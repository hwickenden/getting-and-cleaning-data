# Code Book
This file explains how the data used in this project was collected and recorded. It also outlines the variables given in the output of run_analysis.R

# Input Data

This information can also be found in the README from the data download.

## Human Activity Recognition Using Smartphones Dataset
## Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## The dataset includes the following files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

## License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

# Output Data
run_analysis.R creates a data frame called 'tidy_data'. It has 180 observations - one for each subject/activity combination. It has 81 variables and are listed below. 'activity_ID' corresponds to which of the 6 activities was being recorded. 'subject_ID' corresponds to which of the 30 volunteers was being recorded. The rest of the variables are similar to the the corresponding variables in the original dataset, but mean averaged per subject/activity. Note that not all of the original variables are included in the 'tidy_data' dataset (only those corresponding to mean and std dev were). The naming conventions are slightly different to the original variable names but can be coded back by undoing the following transformations:
* Replace '-' with '_'
* Replace 'Acc' with 'Accelerator'
* Replace 'Gyro' with 'Gyroscope'
* Replace 'Mag' with 'Magnitude'
* Replace 't' with 'time_'
* Replace 'f' with 'frequency_'

 [1] "activity_ID"                                          
 [2] "subject_ID"                                           
 [3] "time_BodyAccelerator_mean()_X"                        
 [4] "time_BodyAccelerator_mean()_Y"                        
 [5] "time_BodyAccelerator_mean()_Z"                        
 [6] "time_BodyAccelerator_std()_X"                         
 [7] "time_BodyAccelerator_std()_Y"                         
 [8] "time_BodyAccelerator_std()_Z"                         
 [9] "time_GravityAccelerator_mean()_X"                     
[10] "time_GravityAccelerator_mean()_Y"                     
[11] "time_GravityAccelerator_mean()_Z"                     
[12] "time_GravityAccelerator_std()_X"                      
[13] "time_GravityAccelerator_std()_Y"                      
[14] "time_GravityAccelerator_std()_Z"                      
[15] "time_BodyAcceleratorJerk_mean()_X"                    
[16] "time_BodyAcceleratorJerk_mean()_Y"                    
[17] "time_BodyAcceleratorJerk_mean()_Z"                    
[18] "time_BodyAcceleratorJerk_std()_X"                     
[19] "time_BodyAcceleratorJerk_std()_Y"                     
[20] "time_BodyAcceleratorJerk_std()_Z"                     
[21] "time_BodyGyroscope_mean()_X"                          
[22] "time_BodyGyroscope_mean()_Y"                          
[23] "time_BodyGyroscope_mean()_Z"                          
[24] "time_BodyGyroscope_std()_X"                           
[25] "time_BodyGyroscope_std()_Y"                           
[26] "time_BodyGyroscope_std()_Z"                           
[27] "time_BodyGyroscopeJerk_mean()_X"                      
[28] "time_BodyGyroscopeJerk_mean()_Y"                      
[29] "time_BodyGyroscopeJerk_mean()_Z"                      
[30] "time_BodyGyroscopeJerk_std()_X"                       
[31] "time_BodyGyroscopeJerk_std()_Y"                       
[32] "time_BodyGyroscopeJerk_std()_Z"                       
[33] "time_BodyAcceleratorMagnitude_mean()"                 
[34] "time_BodyAcceleratorMagnitude_std()"                  
[35] "time_GravityAcceleratorMagnitude_mean()"              
[36] "time_GravityAcceleratorMagnitude_std()"               
[37] "time_BodyAcceleratorJerkMagnitude_mean()"             
[38] "time_BodyAcceleratorJerkMagnitude_std()"              
[39] "time_BodyGyroscopeMagnitude_mean()"                   
[40] "time_BodyGyroscopeMagnitude_std()"                    
[41] "time_BodyGyroscopeJerkMagnitude_mean()"               
[42] "time_BodyGyroscopeJerkMagnitude_std()"                
[43] "frequency_BodyAccelerator_mean()_X"                   
[44] "frequency_BodyAccelerator_mean()_Y"                   
[45] "frequency_BodyAccelerator_mean()_Z"                   
[46] "frequency_BodyAccelerator_std()_X"                    
[47] "frequency_BodyAccelerator_std()_Y"                    
[48] "frequency_BodyAccelerator_std()_Z"                    
[49] "frequency_BodyAccelerator_meanFreq()_X"               
[50] "frequency_BodyAccelerator_meanFreq()_Y"               
[51] "frequency_BodyAccelerator_meanFreq()_Z"               
[52] "frequency_BodyAcceleratorJerk_mean()_X"               
[53] "frequency_BodyAcceleratorJerk_mean()_Y"               
[54] "frequency_BodyAcceleratorJerk_mean()_Z"               
[55] "frequency_BodyAcceleratorJerk_std()_X"                
[56] "frequency_BodyAcceleratorJerk_std()_Y"                
[57] "frequency_BodyAcceleratorJerk_std()_Z"                
[58] "frequency_BodyAcceleratorJerk_meanFreq()_X"           
[59] "frequency_BodyAcceleratorJerk_meanFreq()_Y"           
[60] "frequency_BodyAcceleratorJerk_meanFreq()_Z"           
[61] "frequency_BodyGyroscope_mean()_X"                     
[62] "frequency_BodyGyroscope_mean()_Y"                     
[63] "frequency_BodyGyroscope_mean()_Z"                     
[64] "frequency_BodyGyroscope_std()_X"                      
[65] "frequency_BodyGyroscope_std()_Y"                      
[66] "frequency_BodyGyroscope_std()_Z"                      
[67] "frequency_BodyGyroscope_meanFreq()_X"                 
[68] "frequency_BodyGyroscope_meanFreq()_Y"                 
[69] "frequency_BodyGyroscope_meanFreq()_Z"                 
[70] "frequency_BodyAcceleratorMagnitude_mean()"            
[71] "frequency_BodyAcceleratorMagnitude_std()"             
[72] "frequency_BodyAcceleratorMagnitude_meanFreq()"        
[73] "frequency_BodyBodyAcceleratorJerkMagnitude_mean()"    
[74] "frequency_BodyBodyAcceleratorJerkMagnitude_std()"     
[75] "frequency_BodyBodyAcceleratorJerkMagnitude_meanFreq()"    
[76] "frequency_BodyBodyGyroscopeMagnitude_mean()"          
[77] "frequency_BodyBodyGyroscopeMagnitude_std()"           
[78] "frequency_BodyBodyGyroscopeMagnitude_meanFreq()"      
[79] "frequency_BodyBodyGyroscopeJerkMagnitude_mean()"      
[80] "frequency_BodyBodyGyroscopeJerkMagnitude_std()"       
[81] "frequency_BodyBodyGyroscopeJerkMagnitude_meanFreq()"
