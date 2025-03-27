Feature: C.3.30.1000.	User Interface: The system shall support the sequential assignment of allocation table entries to participants based on stratification.
# Randomization C.3.30.1000.0100 to C.3.30.1000.0200

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1000" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

C.3.30.1000.100: The system shall prevent uploading an allocation table that lacks sequential assignment.  
C.3.30.1000.200: The system shall assign the next available allocation entry sequentially to each new record.
