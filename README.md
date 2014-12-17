README

Data files read and all the variables named.

Two files containing the data for the training ("train") and test ("test") participants were created; each was a merge of the files containing subject numbers ("subject_train" or "subject_test"), the activity labels ("y_train" or "y_test") and the 561 features ("X_train" or "X_test"). The status of the participants (train or test) was added. The train and test files were merged together into "merged.data".

Duplicated variable names were removed and a new file"new.data" was created. This is not a neat process since we might lose important variables (this was not the case here), but this step was necessary to avoid the problem of double column names. 
From the new file, variables on the mean and standard deviation were extracted into "extracted.data".

The activity labels were changed from "1 ...6 " into "STANDING" etc.

Only variables that are measurements of magnitude were kept in "new.data". The variable names were tidied up (no parentheses, dashes, periods and changed into lower cases).

Each variable was averaged for each activity and each subject in "tidy.data" and a txt file "tidy.txt" was created.
