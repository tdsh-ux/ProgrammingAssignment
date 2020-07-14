# CodeBook.md
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
	
	More information about the dataset used can be found at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](Human Activity Recognition Using Smartphones).
	
## Modified files:
### File: summary_values

	COLUMNS:
	
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
		
					
