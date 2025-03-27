Feature: C.3.30.0900.	User Interface: The system shall ensure users with Randomization Setup rights lock randomization models and allocation table while in production mode.	
# Randomization C.3.30.0900.0100 to C.3.30.0900.0600

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_Admin"
And I create a new project named "C.3.30.0900" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button


#C.3.30.0900.0100. Normal user cannot modify setup in production.  
#C.3.30.0900.0200. Admin user unable to revert project to development.  
#C.3.30.0900.0300. Admin cannot modify setup in production.  
#C.3.30.0900.0400. Admin can download existing allocation table in production.  
#C.3.30.0900.0500. Admin cannot modify existing allocation table in production.  
#C.3.30.0900.0600. Admin can upload additional allocations to existing table in production.
