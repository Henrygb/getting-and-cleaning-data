getting-and-cleaning-data
=========================

Demonstration repository for peer assessment in Jeff Leek's Coursera 
Getting and Cleaning Data course.

The repository contains this `README.md`, two R scripts 
called `run_analysis.R` and `run_analysis_verbose.R` 
and another markdown document called `Codebook.md` which explains the 
variables the R scipts put in the two tidy txt files: 
`tidymeansandstds.txt` and `tidymeansofmeansandstds.txt`, the second of 
which has been uploaded to the course website for peer review.

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
DITEN - UniversitÓ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
   
Two output files are produced: 

    tidymeansandstds.txt 
	tidymeansofmeansandstds.txt
	
`tidymeansandstds.txt` is a tidy dataset with one row for each observation 
with the observations identified by individual and activity with a further 
66 varibles by observation.  Each of the 66 is a scaled mean or 
scaled standard deviation for data from smartphone acceleration and 
gyroscopic measurements.  With 10299 observations, and allowing for 
a header row of variable names at the top, 
this txt file has 10300 rows and 68 columns.

`tidymeansofmeansandstds.txt` is a summary tidydata set, taking the means 
of the means and standard deviations in `tidymeansandstds.txt` by 
individual and activity.  Since there are 30 individuals and they each do 
6 activities, and again allowing for a header row of variable names 
at the top, this txt file has 181 rows and 68 columns.

The first 2 variable names identify the observation: `individual` runs 
from 1 to 30; `activity` is one of 
laying (presumably lying down), sitting, standing, walking, 
walking_downstairs, and walking_upstairs.   
The other 66 variables are based on the originals, but tidied 
by moving to lower case and removing punctuation in particular 
the four `(` `)` `,` and `-` which might otherwise 
suggest functions, lists or subtraction if used in later code.
For details on the variables, see `Codebook.md` 

The script `run_analysis_verbose.R` provides extra information when run 
interactively, such as the name of the working directory and the 
dimensions and initial values of intermediate dataframes.  
The shorter script `run_analysis_verbose.R` strips this information out 
and just produces the output txt files, but otherwise is the same.  
Both scripts use the R packages `plyr` and `reshape2` to 
take means of variables by individual and activity.
    

   