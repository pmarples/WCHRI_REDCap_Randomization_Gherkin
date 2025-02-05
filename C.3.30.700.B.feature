Feature: C.3.30.0700 User Interface: The system shall ensure users with Randomization Setup can create and modify randomization models while in project development mode. 
# B: Randomization by group/site C.3.30.0700.0400 to C.3.30.0700.0600

Setup: 
create project with project 3.30 Rand
Add test user to full rights
Log in with Test user.

.400: Randomize by group/site enabled with no option selected.
.500: Randomize by group/site enabled with DAG selected.
.600: Randomize by group/site enabled with an existing field selected.
