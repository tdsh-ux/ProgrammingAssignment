# ProgrammingAssignment
Programming assignment of Getting and Cleaning Data.
This assignment consists in cleaning the data of [this experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), which can be downloaded at [this site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The [code book](https://github.com/tdsh-ux/ProgrammingAssignment/blob/master/CodeBook.md) contain informations about the tables in [output](https://github.com/tdsh-ux/ProgrammingAssignment/tree/master/output).

In summary, this is the description of the original file:

## Original files:
	The original file contains 10299 measurements (one-per-row) divided in two sets:
		- train (7352)
		- test (2947)
		
	Each measurement is a vector with 561-entries in the interval [-1, 1].
	
	For each row, there is an associated subject and an activiy, which are described below:
	
	- Subject
		Description: Number between 1 and 30 that identifies the subject
		Type: integer
	- Activity
		Description: Name of the activity realized by the subject
		Type: categoric
		Values:
			1 - WALKING
			2 - WALKING_UPSTAIRS
			3 - WALKING_DOWNSTAIRS
			4 - SITTING
			5 - STANDING
			6 - LAYING
      
## Descriptions of the scripts

I put a lot of commentaries in the code, so it can be readable. 
After loaded the values with the read.table() function, I took the transpose of the data frame; since each row corresponds to a measurement, that is a nice way to calculate the mean and the standard deviation. Then, the columns' names were changed (so they corresponde to each activity), which has been followed by the merging of the training and the test data with the cbind() function. With this tables, I used a for loop to calculate the mean and the standard deviation for each column. To finalize the task, I included, again with cbind(), the subject for each measurement. All this information is available in the [script](https://github.com/tdsh-ux/ProgrammingAssignment/blob/master/run_analysis.R). The final table, as is written in the [code book](https://github.com/tdsh-ux/ProgrammingAssignment/blob/master/CodeBook.md), has the following description:
### File: summary_values_subject

	COLUMNS:
	
	- Subject
		Description: Number between 1 and 30 that identifies the subject
		Type: integer
	
	- Activity
		Description: Name of the activity realized by the subject
		Type: categoric
		Values:
			WALKING
			WALKING_UPSTAIRS
			WALKING_DOWNSTAIRS
			SITTING
			STANDING
			LAYING
			
	- Mean
		Description: Mean of the measurements made, normalized and bounded within [-1,1]
		Type: numeric
	
	- Standard_Deviation
		Description: Standard deviation of the measurements made, normalized and bounded within [-1, 1]
		Type: numeric
		
