Feature: C.3.30.1800.	Project Interface Administrator Access: The system shall support the administrator role's ability to perform the following actions with specifying the reason on the randomization module allocation table: perform edit target field, edit target allocation, manual randomization, and make sequence unavailable.	
# Randomization C.3.30.1800.0100 to C.3.30.1800.0500
#C.3.30.1800.0100. Admin can edit target field with reason.  
#C.3.30.1800.0200. Admin can edit target alternative with reason.  
#C.3.30.1800.0300. Admin can manually randomize a record with reason.  
#C.3.30.1800.0400. Admin can mark a sequence as unavailable with reason.  
#C.3.30.1800.0500. Admin can restore allocation with reason.
#C.3.30.1800.0600. Admin can remove randomization with reason.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1800" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.OpenBlind.xml", and clicking the "Create Project" button

#SETUP- Assign rights for user with randomization rights
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test_User1" 
And I click on the button labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "select role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User1" has been successfully ASSIGNED to the user role "1_FullRights"."

#SETUP Admin User Rights with Randomization Rights.
Scenario: 
When I click on the link labeled "User Rights"
And I enter "Test_Admin" into the input field labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "Select Role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_Admin" has been successfully ASSIGNED to the user role "1_FullRights"."

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

Scenario:#C.3.30.1800.0100. Admin can edit target field with reason.  
Given I login to REDCap with the user "Test_Admin"
And I click on the link labeled "Randomization"
And I click on the icon labeled "Dashboard" in the row labeled "2"
And I click on the first icon labeled "View Admin Only"
Then I should see "View Allocation Table"

When I click on the icon labeled "Edit Target Field" in the row labeled "2"
Then I should see "Specify a new value for the target field"
And I should see "Specify Reason"

When I enter "Test reason" into the input field labeled "Specify Reason" in the dialog box
And I enter "3" into the input field labeled "Enter new value" in the dialog box
And I enter "CONFIRM" into the input field labeled "Type "CONFIRM"" in the dialog box
And I click the button labeled "Confirm"
Then I should see a "3" within the "2" row of the column labeled "Target Field"

Scenario:#VERIFY that the change to the target is reflected in the form during data entry.
Given I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Randomization Group"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "7" was randomized for the field "Randomization group" and assigned the value "Placebo" (3)." 
And I click on the button labeled "Close"
And I click on a button labeled "Randomize" for the field labeled "Blinded randomization"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "7" was randomized for the field "Blinded randomization" and assigned the value "2"." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

Scenario: #VERIFY: Logging
Given I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | test_admin | Manage/Design | Update randomization allocation table (development) (aid: #, target_field: "3", reason: "Test reason")|



Scenario: #C.3.30.1800.0200. Admin can edit target alternative with reason.  
Given I click on the link labeled "Randomization"
And I click on the icon labeled "Dashboard" in the row labeled "2"
And I click on the first icon labeled "View Admin Only"
Then I should see "View Allocation Table"

When I click on the icon labeled "Edit Target Alternative" in the row labeled "3"
Then I should see "Specify a new value for the alternate field"
And I should see "Specify Reason"

When I enter "Test reason" into the input field labeled "Specify Reason" in the dialog box
And I enter "1" into the input field labeled "Enter new value" in the dialog box
And I enter "CONFIRM" into the input field labeled "Type "CONFIRM"" in the dialog box
And I click the button labeled "Confirm"
Then I should see a "1" within the "3" row of the column labeled "Alternate"

Scenario:#VERIFY that the change to the alternate is reflected in the Randomization Allocation Table
#Download allocation table - "1" should appear in the redcap_randomization number column for row 4 in the csv file and "3" in the redcap_randomization_group column for row 4.

Scenario: #VERIFY: Logging
Given I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | test_admin | Manage/Design | Update randomization allocation table (development) (aid: #, target_field_alt: "1", reason: "Test reason")|

Senario: #C.3.30.1800.0300. Admin can manually randomize a record with reason. 
Given I click on the link labeled "Randomization"
And I click on the icon labeled "Dashboard" in the row labeled "2"
And I click on the first icon labeled "View Admin Only"
Then I should see "View Allocation Table"

When I click on the icon labeled "Manual Randomization" in the row labeled "3"
Then I should see "Manually assign an existing record"
And I should see "Specify Reason"

When I enter "Test reason" into the input field labeled "Specify Reason" in the dialog box
And I enter "1" into the input field labeled "Existing record to assign" in the dialog box
And I enter "CONFIRM" into the input field labeled "Type "CONFIRM"" in the dialog box
And I click the button labeled "Confirm"
Then I should see a "1" within the "3" row of the column labeled "Record"

Scenario: #VERIFY the Manual record assignment is reflected in the record.
When I click on the link labeled "Add / Edit Records"
And I select "1" on the dropdown field labeled "Choose an existing Record ID"
And I click the bubble for the row labeled "Randomization" on the column labeled "Status"
Then I should see the radio labeled "Randomization Group" with option "Placebo"  

Scenario: #VERIFY: Logging
Given I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | test_admin | Manage/Design | Update randomization allocation table (development)(aid: #, is_used_by: "1", reason: "Test reason")|

Scenario: #C.3.30.1800.0400. Admin can mark a sequence as unavailable with reason. 
Given I click on the link labeled "Randomization"
And I click on the icon labeled "Dashboard" in the row labeled "2"
And I click on the first icon labeled "View Admin Only"
Then I should see "View Allocation Table"

When I click on the icon labeled "Make Sequence Unavailable" in the row labeled "4"
Then I should see "Make this allocation unavailable to future randomizations"
And I should see "Specify Reason"

When I enter "Test reason" into the input field labeled "Specify Reason" in the dialog box
And I enter "CONFIRM" into the input field labeled "Type "CONFIRM"" in the dialog box
And I click the button labeled "Confirm"
#note for automation: this icon doesn't seem to be labeled:
Then I should see an icon labeled "Sequence Unavailable" within the "4" row of the column labeled "Record"
And I should see an icon labeled "Restore Availability" in the "4" row of the column labeled "Edit"

Scenario: #VERIFY Sequence Unavailable when randomizing a record.
Given I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Randomization Group"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "8" was randomized for the field "Randomization group" and assigned the value "Drug B" (2)." 
And I should NOT see a dialog containing the following text: "Record ID "8" was randomized for the field "Randomization group" and assigned the value "Drug A" (1)." 
And I click on the button labeled "Close"

Scenario: #VERIFY: Logging
Given I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | test_admin | Manage/Design | Update randomization allocation table (development)(aid: #, is_used_by: "#-UNAVAILABLE", reason: "Test reason")|

Scenario: #C.3.30.1800.0500. Admin can restore allocation with reason.
Given I click on the link labeled "Randomization"
And I click on the icon labeled "Dashboard" in the row labeled "2"
And I click on the first icon labeled "View Admin Only"
Then I should see "View Allocation Table"

When I click on the icon labeled "Restore Availability" in the "4" row of the column labeled "Edit"
Then I should see "restore availability of this allocation"
And I should see "Specify Reason"

When I enter "Test reason" into the input field labeled "Specify Reason" in the dialog box
And I enter "CONFIRM" into the input field labeled "Type "CONFIRM"" in the dialog box
And I click the button labeled "Confirm"
Then I should see an icon labeled "Edit Target Field" within the "4" row of the column labeled "Record"
And I should see an icon labeled "Edit Target Alternative" within the "4" row of the column labeled "Edit"
And I should see an icon labeled "Manual Randomization" within the "4" row of the column labeled "Edit"
And I should see an icon labeled "Make Sequence Unavailable" within the "4" row of the column labeled "Edit"

Scenario: #VERIFY restored value is used when randomizing a record
Given I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Randomization Group"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "9" was randomized for the field "Randomization group" and assigned the value "Drug A" (1)." 
And I should NOT see a dialog containing the following text: "Record ID "9" was randomized for the field "Randomization group" and assigned the value "Placebo" (3)." 
And I click on the button labeled "Close"

Scenario: #VERIFY: Logging
Given I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | test_admin | Manage/Design | Update randomization allocation table (development)(aid: #, is_used_by: "", reason: "Test reason")|
  
Scenario: #C.3.30.1800.0600. Admin can remove randomization with reason.
Given I click on the link labeled "Randomization"
And I click on the icon labeled "Dashboard" in the row labeled "2"
And I click on the first icon labeled "View Admin Only"
Then I should see "View Allocation Table"

When I click on the icon labeled "Remove Randomization" in the "1" row of the column labeled "Edit"
Then I should see "Confirm removal of this randomization allocation."
And I should see "Specify Reason"

When I enter "Test reason" into the input field labeled "Specify Reason" in the dialog box
And I enter "CONFIRM" into the input field labeled "Type "CONFIRM"" in the dialog box
And I click the button labeled "Confirm"
Then I should see an icon labeled "Edit Target Field" within the "4" row of the column labeled "Record"
And I should see an icon labeled "Edit Target Alternative" within the "4" row of the column labeled "Edit"
And I should see an icon labeled "Manual Randomization" within the "4" row of the column labeled "Edit"
And I should see an icon labeled "Make Sequence Unavailable" within the "4" row of the column labeled "Edit"
And I should NOT see a "6" within the "1" row of the column labeled "Record"

Scenario: #VERIFY record 6 is now not randomized
Given I click on the link labeled "Add / Edit Records"
And I select "6" on the dropdown field labeled "Choose an existing Record ID"
And I click the bubble for the row labeled "Randomization" on the column labeled "Status"
Then I should see a button labeled "Randomize" on the field labeled "Randomization group" 

Scenario: #VERIFY: Logging
Given I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | test_admin | Manage/Design | Update randomization allocation table (development)(aid: #, is_used_by: "", reason: "Test reason")|
  | test_admin | Update record 6 | rand_group=''|
  | test_admin | Randomize record 6 | Remove randomization|

Given I logout
#END
