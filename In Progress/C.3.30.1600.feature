Feature: C.3.30.1600.	User Interface: The system shall ensure users with randomization dashboard rights can view the randomization dashboard.	
# Randomization C.3.30.1600.0100 to C.3.30.1600.0200

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1600" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

#C.3.30.1600.0100. User without dashboard rights cannot access randomization dashboard.  
#C.3.30.1600.0200. User with dashboard rights cannot access randomization dashboard.
