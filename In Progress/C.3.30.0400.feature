Feature: C.3.30.0400 User Interface: The system shall allow user rights configuration to access the Randomization Dashboard.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP project with no randomization enabled - "Project 3.30 randAM.xml"
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.0400" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project 3.30 randAM.xml", and clicking the "Create Project" button

#SETUP Randomization User Rights (Give User all Rand Rights)
Scenario:
When I click on the link labeled "Project Setup"
And I click on "Enable" in the "Randomization module" row in the "Enable optional modules and customizations" section
And I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Edit User Privileges"
And I check a checkbox labeled "Setup"
And I check a checkbox labeled "Dashboard"
And I check a checkbox labeled "Randomize"
And I save changes within the context of User Rights
And I click on the link labeled "Randomization"

#SETUP Randomization (Setup project with simple Randomization)
When I click on the icon labeled "Setup" in the row labeled "1" 
And  I upload a "csv" format file located at "RandomizationAllocationTemplate_0400.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file

#FUNCTIONAL_REQUIREMENT C.3.30.0400.0100. User with Randomization Dashboard rights can use Randomization Module Dashboard page.
Scenario:
When I click on the link labeled "Randomization"
And I click on the icon labeled "Dashboard" in the row labeled "1" 
##VERIFY User with Randomization Dashboard rights can use Randomization Module Dashboard page.
Then I should see "Randomization Group" in the table

#SETUP User Rights (Takeaway User Rand - Dashboard Rights)
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Edit User Privileges"
And I uncheck a checkbox labeled "Dashboard"
And I save changes within the context of User Rights

#FUNCTIONAL_REQUIREMENT C.3.30.0400.0200: User without Randomization Dashboard rights cannot use Randomization Module Dashboard page.
Scenario:
When I click on the link labeled "Randomization"
#VERIFY User without Randomization Dashboard rights cannot use Randomization Module Dashboard page.
Then I should NOT see a column labeled "Dashboard" 

And I log out
#END
