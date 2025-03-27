Feature: C.3.30.1700.	Project Interface Administrator Access: The system shall support administrator-only access to the randomization module's View Allocation Table page.
# Randomization C.3.30.1700.0100 to C.3.30.1700.0200

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_Admin"
And I create a new project named "C.3.30.1700" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

#C.3.30.1700.0100. Admin accesses View Allocation Table page.  
#C.3.30.1700.0200. User with dashboard rights cannot access View Allocation Table.
