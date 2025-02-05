Feature: C.3.30.0700 User Interface: The system shall ensure users with Randomization Setup can create and modify randomization models while in project development mode. 
# B: Randomization by group/site C.3.30.0700.0400 to C.3.30.0700.0600

Setup: 
create project with project 3.30 Rand
Add test user to full rights
Log in with Test user.

C.3.30.0700.0400: Randomize by group/site enabled with no option selected.
Click Randomization
Click Add new randomization model
Click Randomize by group/site
select randomization field simple_rand
Click Save randomization model
verify pop up message: Please choose one of the grouping options OR uncheck the Randomize By Group checkbox.
Click Ok

C.3.30.0700.0500: Randomize by group/site enabled with DAG selected.
Click on Dags
Create DAG1 
Click Add Group
Create DAG2
Click Add Group
Click Randomization
Click Add new randomization model
Click Randomize by group/site
Click "Use Data Access Groups to designate each group/site"
Select randomization field simple_rand
Click Save randomizaiton model
Verify success  Success! The randomization model has been saved!

C.3.30.0700.0600: Randomize by group/site enabled with an existing field selected.
Click Randomization
Click Add new randomization model
Click Randomize by group/site
Click "Use an existing field to designate each group/site"
Select existing_dags
Select randomization field complex_rand
Click Save randomization model
Verify success Success! The randomization model has been saved!

Note - I don't see any new logging to add
