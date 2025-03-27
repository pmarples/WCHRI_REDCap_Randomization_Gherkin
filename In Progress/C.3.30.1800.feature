Feature: C.3.30.1800.	Project Interface Administrator Access: The system shall support the administrator role's ability to perform the following actions with specifying the reason on the randomization module allocation table: perform edit target field, edit target allocation, manual randomization, and make sequence unavailable.	
# Randomization C.3.30.1800.0100 to C.3.30.1800.0500

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_Admin"
And I create a new project named "C.3.30.1800" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

#C.3.30.1800.0100. Admin can edit target field with reason.  
#C.3.30.1800.0200. Admin can edit target alternative with reason.  
#C.3.30.1800.0300. Admin can manually randomize a record with reason.  
#C.3.30.1800.0400. Admin can mark a sequence as unavailable with reason.  
#C.3.30.1800.0500. Admin can restore allocation with reason.
