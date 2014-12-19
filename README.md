README

The following explains what run_analysis.R code does.

Data files read and all the variables named.

Two files containing the data for the training ("train") and test ("test") participants were created; each was a merge of the files containing the subject numbers ("subject_train" or "subject_test"), the activity labels ("y_train" or "y_test") and the 561 features ("X_train" or "X_test"). The status of the participants (train or test) was added. The train and test files were merged together into "merged.data".

Duplicated variable names were removed. This is not a neat process since we might lose important variables (though this was not the case here), but this step was necessary to avoid the problem of double column names in select function. 
The variables concerning the mean and standard deviation for each measurement were extracted into "extracted.data".

The activity labels were changed from "1 ...6 " into "STANDING" etc.

The variable names were tidied up (not to contain parentheses, dashes, periods or upper cases).

Each variable was averaged for each activity and each subject in "tidy.data". The status of each participant (train or test) was added and a txt file "tidy.txt" was created.

The explanation of each variable can be found in codebook.md