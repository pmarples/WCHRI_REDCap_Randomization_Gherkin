Feature: C.3.30.0700 User Interface: The system shall ensure users with Randomization Setup can create and modify randomization models while in project development mode. 
# C: Randomization field options C.3.30.0700.0700 to C.3.30.0700.0900

Setup: 
create project with project 3.30 Rand
Add test user to full rights
Log in with Test user.

C.3.30.0700.0700: Choose open randomization dropdown field.
Click Randomization
Click Add new randomization model
Select randomization field simple_rand
Click Save randomization model
Verify success Success! The randomization model has been saved!
click randomization and check simple_rand variable appears under target column 

C.3.30.0700.0800: Choose open randomization radio field.
Click Randomization
Click Add new randomization model
Select randomization field complex_rand
Click Save randomization model
Verify success Success! The randomization model has been saved!
click randomization and check complex_rand variable appears under target column 

C.3.30.0700.0900: Choose concealed randomization text field.
Click Randomization
Click Add new randomization model
Select randomization field concealed_rand
Click Save randomization model
Verify success Success! The randomization model has been saved!
click randomization and check concealed_rand variable appears under target column 

log out
