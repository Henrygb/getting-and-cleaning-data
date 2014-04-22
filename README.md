getting-and-cleaning-data
=========================

Demonstration repository for peer assessment in Jeff Leek's Coursera 
Getting and Cleaning Data course.

The repository contains this `README.md`, two R scripts called `run_analysis.R` 
and `run_analysis_verbose.R` 
and another markdown document called `Codebook.md` which explains the 
variables in the two tidy csv files created by the R scipts: 
`tidymeansandstds.csv` and `tidymeansofmeansandstds.csv`, the second of which 
has been uploaded to the course website for peer review.

The following input files to the R script are assumed to be in the 
working directory:

    X_train.txt
    X_test.txt
    y_train.txt
    y_test.txt
    subject_train.txt
    subject_test.txt
    features.txt
    activity_labels.txt

These come from the Human Activity Recognition Using Smartphones Dataset

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
   
Two output files are produced: 

    tidymeansandstds.csv 
	tidymeansofmeansandstds.csv
	
`tidymeansandstds.csv` is a tidy dataset with one row for each observation 
with the observations identified by individual and activity with a further 
66 varibles by observation.  Each of the 66 is a scaled mean or 
scaled standard deviation for data from smartphone acceleration and 
gyroscopic measurements.  With 10299 observations, and allowing for 
a header row of variable names at the top, 
this csv file has 10300 rows and 68 columns.

`tidymeansofmeansandstds.csv` is a summary tidydata set, taking the means 
of the means and standard deviations in `tidymeansandstds.csv` by 
individual and activity.  Since there are 30 individuals and they each do 
6 activities, and again allowing for a header row of variable names 
at the top, 
this csv file has 181 rows and 68 columns.

For details on the variables, see `Codebook.md` 
    



   