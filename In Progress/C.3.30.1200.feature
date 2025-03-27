Feature: C.3.30.1200.	User Interface: The system shall support an audit trail showing who randomized the record and the date-time of randomization.
# Randomization C.3.30.1200.0100 to C.3.30.1200.0200

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button
