Feature: C.3.30.0700 User Interface: The system shall ensure users with Randomization Setup can create and modify randomization models while in project development mode. 
# D: Randomization field options C.3.30.0700.1000 to C.3.30.0700.1100

Setup: 
create project with project 3.30 Rand
Add test user to full rights
Log in with Test user.

Click Randomization
Click Add new randomization model
Select randomization field simple_rand
Click Save randomization model
Verify success Success! The randomization model has been saved!

C.3.30.0700.1000: Save randomization model.
Click Randomization
Click Add new randomization model
Select randomization field simple_rand
Click Save randomization model

Verify success Success! The randomization model has been saved!
and click randomization
verify simple_rand in the list
loggin: verify see Save randomization model 

C.3.30.0700.1100: Erase randomization model.
Click setup beside simple_rand
Click Erase randomization model
then I should see popup that says Erase Randomization model
Click Cancel
verify not erased.

Click Randomization
Click setup beside simple_rand
Click Erase randomization model
then I should see popup that says Erase Randomization model
Click Okay
verify message Success! Your randomization setup and all allocations have now been erased.
verify simple_rand no longer in list.

Logging - verify see Erase randomization model and allocations

log out
