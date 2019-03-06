## Codebook for the assignment programming 3

### Run_analysis.R

The result of the R script are a dataset "arrange" and the write of a text file "result.txt".
The R script is a function cleanData with a parameter : the working Directory. 
The following is an explanation of the variables in the dataset.

### arrange dataset

There is in the dataset a total of 81 variables and 40 observations. 
All the variables on the dataset are numeric except for the "activity" colum, which is of class "char"
*activity: Type of activity that the person was doing.
*subject: A number that identifies the person during the experiment.
*other columns : The mean for the observation of the following variable:
  *[t,f]-BodyAcc-[mean,std]--[X,Y,Z] 
  *[t,f]-BodyAccMag-[mean.std]- 
  *[t]-GravityAcc-[mean,std]--[X,Y,Z]
  *[t]-GravityAccMag-[mean.std]-
  *[t,f]-BodyAccJerk-[mean,std]--[X,Y,Z]
  *[t,f]-BodyAccJerkMag-[mean.std]
  *[t,f]-BodyGyro-[mean,std]--[X,Y,Z] 
  *[t,f]-BodyGyroMag-[mean.std]
  *[t]-BodyGyroJerk-[mean,std]--[X,Y,Z]
  *[t,f]-BodyGyroJerkMag-[mean.std]
  
### result.txt

It's the print of the arrange dataset.
