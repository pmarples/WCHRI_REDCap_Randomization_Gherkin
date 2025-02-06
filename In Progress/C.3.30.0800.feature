Feature: C.3.30.0800 User Interface: The system shall ensure users with Randomization Setup can create or modify the automatic triggering options: Manual, Users with Randomize permission, all users (including survey).

Setup: 
create project with project 3.30 TriggerRand
Add test user to full rights
Log in with Test user.

C.3.30.0800.0100: Manual only, using Randomize button (default)
eg) rand_group

C.3.30.0800.0200: Trigger logic, for users with Randomize permissions only
eg) auto_rand; [fname]<>"" and [lname]<>""; Demographics; 

C.3.30.0800.0300 Trigger logic, for all users based on form
eg) rand_survey; [survey_complete]="2" survey
test in form
C.3.30.0800.0400 Trigger logic, for all users based on survey
use same setup from .0300 and test in survey.

C.3.30.0800.0500 Modify trigger while in production
