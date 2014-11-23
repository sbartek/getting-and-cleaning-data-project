The codebook
============

# Content #

1. **The experiments** Description of the experiment, raw data and
   data from dataset (for convenience of the reader copied from
   'README.txt' and 'features_info.txt'))

2. **Processed dataset** Description of processed data.

# 1. The experiments #

## Description ##


The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the
data manually. The obtained dataset has been randomly partitioned into
two sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion
components, was separated using a Butterworth low-pass filter into
body acceleration and gravity. The gravitational force is assumed to
have only low frequency components, therefore a filter with 0.3 Hz
cutoff frequency was used. From each window, a vector of features was
obtained by calculating variables from the time and frequency
domain. See 'features_info.txt' for more details.

## Raw data ##

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:


- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their
descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who
  performed the activity for each window sample. Its range is from 1
  to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration
  signal from the smartphone accelerometer X axis in standard gravity
  units 'g'. Every row shows a 128 element vector. The same
  description applies for the 'total_acc_x_train.txt' and
  'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration
  signal obtained by subtracting the gravity from the total
  acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity
  vector measured by the gyroscope for each window sample. The units
  are radians/second.

## Feature Selection ##

### Notes ###

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

### Description ###

(copied from ``)

The features selected for this database come from the accelerometer
and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time
domain signals (prefix 't' to denote time) were captured at a constant
rate of 50 Hz. Then they were filtered using a median filter and a 3rd
order low pass Butterworth filter with a corner frequency of 20 Hz to
remove noise. Similarly, the acceleration signal was then separated
into body and gravity acceleration signals (tBodyAcc-XYZ and
tGravityAcc-XYZ) using another low pass Butterworth filter with a
corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


# 2. Processed dataset #

What we are doing is summarize each experiment from training and test
dataset and create one table (saved in `data/tidyData.txt`). The first
column contains the id of the subject. The second column is the column
with activities. Here we transformed number into descriptive names
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,
LAYING). Then the rest of the columns are columns from calculated data
that contains means and standard deviations.

## Description of variables ##

**subject**
Identifier of a volunteer. There are 30 volunteers within an age bracket of 19-48 year
 
**activity**
One of six activities: WALKING, WALKINGUPSTAIRS, WALKINGDOWNSTAIRS, SITTING, STANDING, LAYING
 
**tBodyAccmeanX**
Mean of time domain signals from accelerometer subtracting the gravity in  X direction.
 
**tBodyAccmeanY**
Mean of time domain signals from accelerometer subtracting the gravity in  Y direction.
 
**tBodyAccmeanZ**
Mean of time domain signals from accelerometer subtracting the gravity in  Z direction.
 
**tBodyAccstdX**
Standard deviation of time domain signals from accelerometer subtracting the gravity in  X direction.
 
**tBodyAccstdY**
Standard deviation of time domain signals from accelerometer subtracting the gravity in  Y direction.
 
**tBodyAccstdZ**
Standard deviation of time domain signals from accelerometer subtracting the gravity in  Z direction.
 
**tGravityAccmeanX**
Mean of time domain signals from accelerometer in standard gravity units in  X direction.
 
**tGravityAccmeanY**
Mean of time domain signals from accelerometer in standard gravity units in  Y direction.
 
**tGravityAccmeanZ**
Mean of time domain signals from accelerometer in standard gravity units in  Z direction.
 
**tGravityAccstdX**
Standard deviation of time domain signals from accelerometer in standard gravity units in  X direction.
 
**tGravityAccstdY**
Standard deviation of time domain signals from accelerometer in standard gravity units in  Y direction.
 
**tGravityAccstdZ**
Standard deviation of time domain signals from accelerometer in standard gravity units in  Z direction.
 
**tBodyAccJerkmeanX**
Mean of time domain Jerk signals from accelerometer subtracting the gravity in  X direction.
 
**tBodyAccJerkmeanY**
Mean of time domain Jerk signals from accelerometer subtracting the gravity in  Y direction.
 
**tBodyAccJerkmeanZ**
Mean of time domain Jerk signals from accelerometer subtracting the gravity in  Z direction.
 
**tBodyAccJerkstdX**
Standard deviation of time domain Jerk signals from accelerometer subtracting the gravity in  X direction.
 
**tBodyAccJerkstdY**
Standard deviation of time domain Jerk signals from accelerometer subtracting the gravity in  Y direction.
 
**tBodyAccJerkstdZ**
Standard deviation of time domain Jerk signals from accelerometer subtracting the gravity in  Z direction.
 
**tBodyGyromeanX**
Mean of time domain signals from gyroscope in  X direction.
 
**tBodyGyromeanY**
Mean of time domain signals from gyroscope in  Y direction.
 
**tBodyGyromeanZ**
Mean of time domain signals from gyroscope in  Z direction.
 
**tBodyGyrostdX**
Standard deviation of time domain signals from gyroscope in  X direction.
 
**tBodyGyrostdY**
Standard deviation of time domain signals from gyroscope in  Y direction.
 
**tBodyGyrostdZ**
Standard deviation of time domain signals from gyroscope in  Z direction.
 
**tBodyGyroJerkmeanX**
Mean of time domain Jerk signals from gyroscope in  X direction.
 
**tBodyGyroJerkmeanY**
Mean of time domain Jerk signals from gyroscope in  Y direction.
 
**tBodyGyroJerkmeanZ**
Mean of time domain Jerk signals from gyroscope in  Z direction.
 
**tBodyGyroJerkstdX**
Standard deviation of time domain Jerk signals from gyroscope in  X direction.
 
**tBodyGyroJerkstdY**
Standard deviation of time domain Jerk signals from gyroscope in  Y direction.
 
**tBodyGyroJerkstdZ**
Standard deviation of time domain Jerk signals from gyroscope in  Z direction.
 
**tBodyAccMagmean**
Mean of the magnitude of time domain signals from accelerometer subtracting the gravity.
 
**tBodyAccMagstd**
Standard deviation of the magnitude of time domain signals from accelerometer subtracting the gravity.
 
**tGravityAccMagmean**
Mean of the magnitude of time domain signals from accelerometer in standard gravity units.
 
**tGravityAccMagstd**
Standard deviation of the magnitude of time domain signals from accelerometer in standard gravity units.
 
**tBodyAccJerkMagmean**
Mean of the magnitude of time domain Jerk signals from accelerometer subtracting the gravity.
 
**tBodyAccJerkMagstd**
Standard deviation of the magnitude of time domain Jerk signals from accelerometer subtracting the gravity.
 
**tBodyGyroMagmean**
Mean of the magnitude of time domain signals from gyroscope.
 
**tBodyGyroMagstd**
Standard deviation of the magnitude of time domain signals from gyroscope.
 
**tBodyGyroJerkMagmean**
Mean of the magnitude of time domain Jerk signals from gyroscope.
 
**tBodyGyroJerkMagstd**
Standard deviation of the magnitude of time domain Jerk signals from gyroscope.
 
**fBodyAccmeanX**
Mean of Fast Fourier Transform (FFT) of signals from accelerometer subtracting the gravity in  X direction.
 
**fBodyAccmeanY**
Mean of Fast Fourier Transform (FFT) of signals from accelerometer subtracting the gravity in  Y direction.
 
**fBodyAccmeanZ**
Mean of Fast Fourier Transform (FFT) of signals from accelerometer subtracting the gravity in  Z direction.
 
**fBodyAccstdX**
Standard deviation of Fast Fourier Transform (FFT) of signals from accelerometer subtracting the gravity in  X direction.
 
**fBodyAccstdY**
Standard deviation of Fast Fourier Transform (FFT) of signals from accelerometer subtracting the gravity in  Y direction.
 
**fBodyAccstdZ**
Standard deviation of Fast Fourier Transform (FFT) of signals from accelerometer subtracting the gravity in  Z direction.
 
**fBodyAccJerkmeanX**
Mean of Fast Fourier Transform (FFT) of Jerk signals from accelerometer subtracting the gravity in  X direction.
 
**fBodyAccJerkmeanY**
Mean of Fast Fourier Transform (FFT) of Jerk signals from accelerometer subtracting the gravity in  Y direction.
 
**fBodyAccJerkmeanZ**
Mean of Fast Fourier Transform (FFT) of Jerk signals from accelerometer subtracting the gravity in  Z direction.
 
**fBodyAccJerkstdX**
Standard deviation of Fast Fourier Transform (FFT) of Jerk signals from accelerometer subtracting the gravity in  X direction.
 
**fBodyAccJerkstdY**
Standard deviation of Fast Fourier Transform (FFT) of Jerk signals from accelerometer subtracting the gravity in  Y direction.
 
**fBodyAccJerkstdZ**
Standard deviation of Fast Fourier Transform (FFT) of Jerk signals from accelerometer subtracting the gravity in  Z direction.
 
**fBodyGyromeanX**
Mean of Fast Fourier Transform (FFT) of signals from gyroscope in  X direction.
 
**fBodyGyromeanY**
Mean of Fast Fourier Transform (FFT) of signals from gyroscope in  Y direction.
 
**fBodyGyromeanZ**
Mean of Fast Fourier Transform (FFT) of signals from gyroscope in  Z direction.
 
**fBodyGyrostdX**
Standard deviation of Fast Fourier Transform (FFT) of signals from gyroscope in  X direction.
 
**fBodyGyrostdY**
Standard deviation of Fast Fourier Transform (FFT) of signals from gyroscope in  Y direction.
 
**fBodyGyrostdZ**
Standard deviation of Fast Fourier Transform (FFT) of signals from gyroscope in  Z direction.
 
**fBodyAccMagmean**
Mean of the magnitude of Fast Fourier Transform (FFT) of signals from accelerometer subtracting the gravity.
 
**fBodyAccMagstd**
Standard deviation of the magnitude of Fast Fourier Transform (FFT) of signals from accelerometer subtracting the gravity.
 
**fBodyBodyAccJerkMagmean**
Mean of the magnitude of Fast Fourier Transform (FFT) of Jerk signals from accelerometer subtracting the gravity.
 
**fBodyBodyAccJerkMagstd**
Standard deviation of the magnitude of Fast Fourier Transform (FFT) of Jerk signals from accelerometer subtracting the gravity.
 
**fBodyBodyGyroMagmean**
Mean of the magnitude of Fast Fourier Transform (FFT) of signals from gyroscope.
 
**fBodyBodyGyroMagstd**
Standard deviation of the magnitude of Fast Fourier Transform (FFT) of signals from gyroscope.
 
**fBodyBodyGyroJerkMagmean**
Mean of the magnitude of Fast Fourier Transform (FFT) of Jerk signals from gyroscope.
 
**fBodyBodyGyroJerkMagstd**
Standard deviation of the magnitude of Fast Fourier Transform (FFT) of Jerk signals from gyroscope.
 
