Feature: C.3.30.1600.	User Interface: The system shall ensure users with randomization dashboard rights can view the randomization dashboard.	
# Randomization C.3.30.1600.0100 to C.3.30.1600.0200
#C.3.30.1600.0100. User without dashboard rights cannot access randomization dashboard.  
#C.3.30.1600.0200 – User with dashboard rights can access the randomization dashboard.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1600" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.OpenBlind.xml", and clicking the "Create Project" button

#SETUP- Assign rights for user with randomization rights
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test_User1" 
And I click on the button labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "select role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User1" has been successfully ASSIGNED to the user role "1_FullRights"."

#SETUP User Rights for user without Dashboard randomization rights.
Scenario: 
When I click on the link labeled "User Rights"
And I enter "Test_User2" into the input field labeled "Assign to role"
And I select "6_NoRandDashboard" on the dropdown field labeled "Select Role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User2" has been successfully ASSIGNED to the user role "6_NoRandDashboard"."

#SETUP Blind Randomization allocation tables and Open Randomization allocation tables.
Scenario:
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Set up randomization"
And I click on the icon labeled "Setup" in the row labeled "1"
And I upload a "csv" format file located at "AlloRand blind1.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I click on the link labeled "Project Setup"
And I click on the button labeled "Set up randomization"
And I click on the icon labeled "Setup" in the row labeled "2"
And I upload a "csv" format file located at "AlloRand open1.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file

#SETUP -  Create a record and randomize with both Open and Blinded Randomization fields.
Scenario:
Given I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Randomization Group"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "6" was randomized for the field "Randomization group" and assigned the value "Drug A" (1)." 
And I click on the button labeled "Close"
And I click on a button labeled "Randomize" for the field labeled "Blinded randomization"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "6" was randomized for the field "Blinded randomization" and assigned the value "1"." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"
Given I Logout

#C.3.30.1600.0100 ensures that access is denied when the user lacks the appropriate permission.
Scenario:
Given I login to REDCap with the user "Test_User2"
And I click on the link labeled "Randomization"

#VERIFY: Test user without dashboard rights cannot access randomization dashboard.
Then I should not see an icon labeled "Dashboard" in the row labeled "1"
And I should not see an icon labeled "Dashboard" in the row labeled "2"

Given I logout

C.3.30.1600.0200 ensures that access is granted when the user has the correct dashboard rights. 
Given I login to REDCap with the user "Test_User1"
And I click on the link labeled "Randomization"

#VERIFY: Test user with dashboard rights CAN access randomization dashboard and will see only a concealed allocation code, with no visible group assignment.
And I click on an icon labeled "Dashboard" in the row labeled "1"
Then I should see a table header and rows containing the following values:
  | Used | Not Used | Allocated records |
  | 1    | 4        | 6                 | 

#Test user with dashboard rights CAN access randomization dashboard and will see group assignment for open randomization model.
Scenario:
Given I click on the link labeled "Randomization"

#VERIFY: Test user with dashboard rights CAN access randomization dashboard and will see group assignment for open randomization model.
And I click on an icon labeled "Dashboard" in the row labeled "2"
Then I should see a table header and rows containing the following values:
  | Used | Not Used | Allocated records | Randomizaton group |
  | 1    | 4        | 6                 | Drug A (1)         |
  | 0    | 5        |                   | Drug B (2)         |
  | 0    | 5        |                   | Placebo (3)        |

  Given I logout
  #End
