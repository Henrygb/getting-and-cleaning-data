getting-and-cleaning-data  
=========================

Codebook
--------

This codebook explains the 68 columns of the files 
`tidymeansandstds.txt` and `tidymeansofmeansandstds.txt` 
produced by the R script `run_analysis.R` for 
peer assessment in Jeff Leek's Coursera 
Getting and Cleaning Data course. It is worth reading `READMED.md` too. 

The first 2 columns identify the observation by the 
individual undertaking a particular activity 
while wearing a smartphone with acceleration and gyroscope monitors:  

`individual` can take any values from 1 through to 30 as 
there were thirty individuals.  These are just used for identification  
and their order has no meaning.  
The original test set covered individuals 
2, 4, 9, 10, 12, 13, 18, 20, and 24 
while the training set covered the others from the thirty.  

`activity` can take one of six possible values: 
laying, sitting, standing, walking, walking_downstairs, 
and walking_upstairs 

The other 66 variable names have been tidied from the originals by 
moving to lower case and removing punctuation in particular 
the four `(` `)` `,` and `-` which might otherwise  
suggest functions, lists or subtraction if used in later code.
The following four paragraphs are therefore slightly adapted from 
the  original `features_info.txt` accompanying the dataset:

The features selected for the database come from the 
accelerometer and gyroscope 3-axial raw signals `tacc-xyz` and `tgyro-xyz`. 
These signals were used to estimate variables of the feature vector for each 
pattern:  variable names end with `x`, `y`, or `z` to denote 
3-axial signals in the X, Y, and Z directions, except when 
overall magnitudes are being calculated, in which `mag` appears.

These time domain signals (prefix 't' to denote time) were captured at 
a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into 
body and gravity acceleration signals (`tbodyacc` and `tgravityacc`) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived 
in time to obtain Jerk signals (`tbodyaccjerk` and `tbodygyrojerk`). 
Also the magnitude of these three-dimensional signals were calculated 
using the Euclidean norm (`tbodyaccmag`, `tgravityaccmag`, `tbodyaccjerkmag`, 
`tbodygyromag`, `tbodygyrojerkmag`). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing `fbodyacc`, `fbodyaccjerk`, `fbodygyro`, 
`fbodyaccjerkmag`, `fbodygyromag`, `fbodygyrojerkmag`. 
(Note the 'f' to indicate frequency domain signals). 

The mean and standard deviation (`mean` and `std`) were calculated for 
each variable for each of the 10299 observations. 
The means were then further processed by linearly scaling them across all 
observations of the means of that particular variable, 
whether in the training or the test set, so that the minimum 
mean for a paticular variable became -1 and the the maximum mean became +1. 
The same was done with the standard deviations, with the result that 
most of the `std` variables have negative values, 
confusing in statistical terms unless the user remembers that this peculiar 
scaling has been used.

A full list of the 3rd to the 68th variables is given below:   

    Variable                  Domain   Relative   Device     Jerk Direction  Mean or St. Dev.  
    =================         ======   ========   ======     ==== =========  ================  
    tbodyaccmeanx              time      body   acceleration          X           mean         
    tbodyaccmeany              time      body   acceleration          Y           mean         
    tbodyaccmeanz              time      body   acceleration          Z           mean         
    tbodyaccstdx               time      body   acceleration          X     standard deviation 
    tbodyaccstdy               time      body   acceleration          Y     standard deviation 
    tbodyaccstdz               time      body   acceleration          Z     standard deviation 
    tgravityaccmeanx           time     gravity acceleration          X           mean         
    tgravityaccmeany           time     gravity acceleration          Y           mean         
    tgravityaccmeanz           time     gravity acceleration          Z           mean         
    tgravityaccstdx            time     gravity acceleration          X     standard deviation 
    tgravityaccstdy            time     gravity acceleration          Y     standard deviation 
    tgravityaccstdz            time     gravity acceleration          Z     standard deviation 
    tbodyaccjerkmeanx          time      body   acceleration jerk     X           mean         
    tbodyaccjerkmeany          time      body   acceleration jerk     Y           mean         
    tbodyaccjerkmeanz          time      body   acceleration jerk     Z           mean         
    tbodyaccjerkstdx           time      body   acceleration jerk     X     standard deviation 
    tbodyaccjerkstdy           time      body   acceleration jerk     Y     standard deviation 
    tbodyaccjerkstdz           time      body   acceleration jerk     Z     standard deviation 
    tbodygyromeanx             time      body    gyroscopic           X           mean         
    tbodygyromeany             time      body    gyroscopic           Y           mean         
    tbodygyromeanz             time      body    gyroscopic           Z           mean         
    tbodygyrostdx              time      body    gyroscopic           X     standard deviation 
    tbodygyrostdy              time      body    gyroscopic           Y     standard deviation 
    tbodygyrostdz              time      body    gyroscopic           Z     standard deviation 
    tbodygyrojerkmeanx         time      body    gyroscopic  jerk     X           mean         
    tbodygyrojerkmeany         time      body    gyroscopic  jerk     Y           mean         
    tbodygyrojerkmeanz         time      body    gyroscopic  jerk     Z           mean         
    tbodygyrojerkstdx          time      body    gyroscopic  jerk     X     standard deviation 
    tbodygyrojerkstdy          time      body    gyroscopic  jerk     Y     standard deviation 
    tbodygyrojerkstdz          time      body    gyroscopic  jerk     Z     standard deviation 
    tbodyaccmagmean            time      body   acceleration      magnitude       mean         
    tbodyaccmagstd             time      body   acceleration      magnitude standard deviation 
    tgravityaccmagmean         time     gravity acceleration      magnitude       mean         
    tgravityaccmagstd          time     gravity acceleration      magnitude standard deviation 
    tbodyaccjerkmagmean        time      body   acceleration jerk magnitude       mean         
    tbodyaccjerkmagstd         time      body   acceleration jerk magnitude standard deviation 
    tbodygyromagmean           time      body    gyroscopic       magnitude       mean         
    tbodygyromagstd            time      body    gyroscopic       magnitude standard deviation 
    tbodygyrojerkmagmean       time      body    gyroscopic  jerk magnitude       mean         
    tbodygyrojerkmagstd        time      body    gyroscopic  jerk magnitude standard deviation 
    fbodyaccmeanx            frequency   body   acceleration          X           mean         
    fbodyaccmeany            frequency   body   acceleration          Y           mean         
    fbodyaccmeanz            frequency   body   acceleration          Z           mean         
    fbodyaccstdx             frequency   body   acceleration          X     standard deviation 
    fbodyaccstdy             frequency   body   acceleration          Y     standard deviation 
    fbodyaccstdz             frequency   body   acceleration          Z     standard deviation 
    fbodyaccjerkmeanx        frequency   body   acceleration jerk     X           mean         
    fbodyaccjerkmeany        frequency   body   acceleration jerk     Y           mean         
    fbodyaccjerkmeanz        frequency   body   acceleration jerk     Z           mean         
    fbodyaccjerkstdx         frequency   body   acceleration jerk     X     standard deviation 
    fbodyaccjerkstdy         frequency   body   acceleration jerk     Y     standard deviation 
    fbodyaccjerkstdz         frequency   body   acceleration jerk     Z     standard deviation 
    fbodygyromeanx           frequency   body    gyroscopic           X           mean         
    fbodygyromeany           frequency   body    gyroscopic           Y           mean         
    fbodygyromeanz           frequency   body    gyroscopic           Z           mean         
    fbodygyrostdx            frequency   body    gyroscopic           X     standard deviation 
    fbodygyrostdy            frequency   body    gyroscopic           Y     standard deviation 
    fbodygyrostdz            frequency   body    gyroscopic           Z     standard deviation 
    fbodyaccmagmean          frequency   body   acceleration      magnitude       mean         
    fbodyaccmagstd           frequency   body   acceleration      magnitude standard deviation 
    fbodybodyaccjerkmagmean  frequency   body   acceleration jerk magnitude       mean         
    fbodybodyaccjerkmagstd   frequency   body   acceleration jerk magnitude standard deviation 
    fbodybodygyromagmean     frequency   body    gyroscopic       magnitude       mean         
    fbodybodygyromagstd      frequency   body    gyroscopic       magnitude standard deviation 
    fbodybodygyrojerkmagmean frequency   body    gyroscopic  jerk magnitude       mean         
    fbodybodygyrojerkmagstd  frequency   body    gyroscopic  jerk magnitude standard deviation 


Data comes from the Human Activity Recognition Using Smartphones Dataset

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and 
Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass 
Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.

