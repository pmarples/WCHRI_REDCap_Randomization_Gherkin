Feature: C.3.30.0800 User Interface: The system shall ensure users with Randomization Setup can create or modify the automatic triggering options: Manual, Users with Randomize permission, all users (including survey).

Setup: 
create project with project "C.3.30 TriggerRand.xml"
Add test user 1 to full rights
Add test user 2 to norand
Log in with Test user.

C.3.30.0800.0100: Manual only, using Randomize button (default)
eg) rand_group
Click on Randomization
Click Add new randomization model
select rand field: rand_group
click button: Save randomization model"
Click Ok
Click choose file
upload allocation table to dev: "AlloRand rand_group1.csv"
Click upload file
upload allocation table to prod: "AlloRand rand_group2.csv"
Click Add / Edit Records
Select Record 1
Click Randomization group "Randomize"
dialog: Below you may perform randomization for Record ID "1" on the field Randomization group (rand_group).
Click Randomize button
dialog:"Record ID "1" was randomized for the field "Randomization group" and assigned the value "Drug A" (1)."
Click Save & Exit Form


C.3.30.0800.0200: Trigger logic, for users with Randomize permissions only
eg) auto_rand; [fname]<>"" and [lname]<>""; Demographics; 
Click on Randomization
Click Add new randomization model
select rand field: auto_rand
Click Save randomization model
Click Ok
Click choose file
upload allocation table to dev: "AlloRand auto_rand1.csv"
click upload file
upload allocation table to Prod: "AlloRand auto_rand2.csv"
select Trigger option: Trigger logic, for users with Randomize permissions only
Select instrument "Demographics"
Enter Trigger logic:[fname]<>"" and [lname]<>""
Click Save trigger option
"Saved" pops up briefly
Click Add / Edit Records
Click Add new record
Click Demographics
Enter First name: Donald
Enter Last name: Duke
Save & Exit Form
Randomization is status red/incomplete
Click Randomization
Automatic Randomization is randomized to Group 1 
Automatic Randomization says "Already randomized"

#Setup Trigger logic for all users (.0300 and .0400) eg) rand_survey; [survey_complete]="2" survey
Click on Randomization
Click Add new randomization model
select rand rand_survey (Go to:)
Save randomization model
Click Ok
Click choose file
upload allocation table to dev: "AlloRand auto_rand1.csv"
click upload file
upload allocation table to prod: "AlloRand auto_rand2.csv"
select Trigger option: Trigger logic, for all users (including survey respondents)
select instrument: survey
Enter Trigger logic: [survey_complete]="2"
Save Trigger option

C.3.30.0800.0300 Trigger logic, for all users based on form
test in form with Test user with no Randomization permissions
Log out
Log in as Test User 2
Click add/Edit Records
Click add new record
Click Survey
verify unable to edit Go to:
verify Goto says "not yet randomized"
Enter Yes for Will you complete the survey? radio
Enter Complete for Complete?
Save & Stay
Verify go to randomized to Survey A  and says "Already radomized".

C.3.30.0800.0400 Trigger logic, for all users based on survey
test in survey with Participant
Click add/Edit Records
Click add new record
Click Survey
verify unable to edit Go to:
verify Goto says "not yet randomized"
Enter Yes for Will you complete the survey? radio
Save & Stay
Go to not yet randomized and has no data selected
Survey options: Log out and Open survey
Click submit
Click Close survey
Log in as test user 1
Click add/Edit Records
Click record 8
verify go to is already randomized to Survey B

C.3.30.0800.0500 Modify trigger while in production
Click Project setup
Click Move project to production
Click I agree
Select keep all records
Click Yes, Move to Production Status


