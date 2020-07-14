#each row is a feature;
#1 - Read the test set.
test_values <- read.table(paste0(getwd(), "/test/X_test.txt"))
#We can transpose the table (since each vector corresponds to a row)
test_values_transpose <- as.data.frame(t(test_values))
View(head(test_values_transpose))

#Load the labels of the test set
test_labels <- read.table(paste0(getwd(), "/test/Y_test.txt"))

#Load activity_labels

activity_labels <- read.table(paste0(getwd(), "/activity_labels.txt"))
#Rename the test_values columns
test_labels_meaningful <- test_labels %>%
  inner_join(activity_labels)
names(test_values_transpose) <- test_labels_meaningful[[2]]

#2 - Read the training set.

#Values
training_values <- read.table(paste0(getwd(), "/train/X_train.txt"))
training_values_transpose <- as.data.frame(t(training_values))

#Labels
training_labels <- read.table(paste0(getwd(), "/train/Y_train.txt"))
training_labels_meaningful <- training_labels %>%
  inner_join(activity_labels)


#Rename the columns
names(training_values_transpose) <- training_labels_meaningful[[2]]

#Joining the data
activity_recognition <- cbind(training_values_transpose, test_values_transpose)

#---------------------------------------------------------------------------------part_I: merge the datasets
#Vectors for summary values
mean_measurements <- vector()
std_measurements <- vector()
#Append the mean and the standard deviations in the vectors
for(index in seq(1, ncol(activity_recognition))){
  mean_measurements <- c(mean_measurements, mean(activity_recognition[[index]]))
  std_measurements <- c(std_measurements, sd(activity_recognition[[index]]))
}
#Include it in the activity_recoginition table
summary_values <- rbind(activity_recognition, mean_measurements, std_measurements)
#Selectec the two rows
summary_values <- summary_values[562:563, ]

#Insert the column names as rows
summary_values <- rbind(names(summary_values), summary_values)

#Change the rows' names.
rownames(summary_values) <- c("Activity", "Mean", "Standard_Deviation")
#Transpose the data frame
summary_values <- as.data.frame(t(summary_values)) %>%
  mutate(Mean = as.numeric(Mean), Standard_Deviation = as.numeric(Standard_Deviation))
#Change the row names

rownames(summary_values) <- c()
#--------------------------------------------------------------------------------part_II, III and IV: summary and meaningful names.


#We haven't changed the order of the data, so we can append the subject labels to the summary_values table
#(to do this, we need to bind the rows in the following order: training and test)
subject_training_label <- read.table(paste0(getwd(), "/train/subject_train.txt"))
subject_test_label <- read.table(paste0(getwd(), "/test/subject_test.txt"))
#Join the tables

subject_label <- rbind(subject_training_label, subject_test_label)
names(subject_label) <- c("Subject")
#Join this table with the summary_values
summary_values_subject <- cbind(subject_label, summary_values[, 1:2])

#Saving the tables
if(!dir.exists(paste0(getwd(), "/output"))){dir.create(paste0(getwd(), "/output"))}
write.table(summary_values, paste0(getwd(), "/output/summary_values.txt"), sep = "\t", row.names = FALSE)
write.table(summary_values_subject, paste0(getwd(), "/output/summary_values_subject.txt"), sep = "\t", row.names = FALSE)
#--------------------------------------------------------------------------------part_V: mean by activity.
