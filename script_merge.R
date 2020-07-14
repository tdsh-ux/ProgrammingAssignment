#each row is a feature;
#1 - Read the test set.
test_values <- read.table("C:/Users/tiago/Desktop/Coursera/data/getting_data/ProgrammingAssignment/test/X_test.txt")
#We can transpose the table (since each vector corresponds to a row)
test_values_transpose <- as.data.frame(t(test_values))
View(head(test_values_transpose))

#Load the labels of the test set
test_labels <- read.table("C:/Users/tiago/Desktop/Coursera/data/getting_data/ProgrammingAssignment/test/Y_test.txt")

#Load activity_labels

activity_labels <- read.table("C:/Users/tiago/Desktop/Coursera/data/getting_data/ProgrammingAssignment/activity_labels.txt")
#Rename the test_values columns
test_labels_meaningful <- test_labels %>%
  inner_join(activity_labels)
names(test_values_transpose) <- test_labels_meaningful[[2]]

#2 - Read the training set.

#Values
training_values <- read.table("C:/Users/tiago/Desktop/Coursera/data/getting_data/ProgrammingAssignment/train/X_train.txt")
training_values_transpose <- as.data.frame(t(training_values))

#Labels
training_labels <- read.table("C:/Users/tiago/Desktop/Coursera/data/getting_data/ProgrammingAssignment/train/Y_train.txt")
training_labels_meaningful <- training_labels %>%
  inner_join(activity_labels)


#Rename the columns
names(training_values_transpose) <- training_labels_meaningful[[2]]

#Joining the data
activity_recognition <- cbind(training_values_transpose, test_values_transpose)
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
rownames(summary_values) <- c("Activity", "Mean", "Standard Deviation")
#Transpose the data frame
summary_values <- as.data.frame(t(summary_values))
#Change the row names
rownames(summary_values) <- c()


