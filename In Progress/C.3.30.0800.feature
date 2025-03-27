Feature: C.3.30.0800.	User Interface: The system shall ensure users with Randomization Setup can create or modify the automatic triggering options: Manual, Users with Randomize permission, all users (including survey).
# Randomization C.3.30.0800.0100 to C.3.30.0800.0500

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.0800" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

#C.3.30.0800.0100. Manual only, using Randomize button (default)  
#C.3.30.0800.0200. Trigger logic, for users with Randomize permissions only  
#C.3.30.0800.0300 Trigger logic, for all users based on form  
#C.3.30.0800.0400 Trigger logic, for all users based on survey  
#C.3.30.0800.0500 Modify trigger while in production
