Feature: C.3.30.1500.	User Interface: The system shall support blinded and open randomization models, with access to allocation details based on user permissions and model setup.
# Randomization C.3.30.1500.0100 to C.3.30.1500.0400
#C.3.30.1500.0100. For a blinded model, users without setup rights will see only a concealed allocation code in the record and reports, with no visible group assignment.  
#C.3.30.1500.0200. For an open model, users without setup rights can view the assigned group allocation directly in the record and reports.  
#C.3.30.1500.0300. All users with export rights can export randomized records, seeing the allocation assigned to each record as displayed in the record view.  
#C.3.30.1500.0400. Only users with setup rights or admin privileges can access and export the full allocation table directly from the setup interface, regardless of model type.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1500" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.OpenBlind.xml", and clicking the "Create Project" button

#SETUP- Assign rights for user with randomization rights
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test_User1" 
And I click on the button labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "select role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User1" has been successfully ASSIGNED to the user role "1_FullRights"."

#SETUP User Rights for user without Setup randomization rights.
Scenario: 
When I click on the link labeled "User Rights"
And I enter "Test_User2" into the input field labeled "Assign to role"
And I select "5_NoRandSetup" on the dropdown field labeled "Select Role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User2" has been successfully ASSIGNED to the user role "5_NoRandSetup"."

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

#C.3.30.1500.0100. For a blinded model, users without setup rights will see only a concealed allocation code in the record and reports, with no visible group assignment.  
Scenario:
Given I login to REDCap with the user "Test_User2"
And I click on the link labeled "Add / Edit Records"
And I select "6" on the dropdown field labeled "Choose an existing Record ID"
And I click the bubble for the row labeled "Randomization" on the column labeled "Status"

#Verify the user can only see a concealed allocation code in the record with no visible group assignment.  
Then I should see "1" in the data entry form field "Blinded randomization" 
And I should not see "Group A" in the data entry form field "Blinded randomization" 

#Verify the user can only see a concealed allocation code in reports with no visible group assignment.  
When I click on the link "Blind Rand Report"
Then I should see a "1" within the "6" row of the column labeled "Blinded randomization" of the Reports table
And I should NOT see a "Group A" within the "6" row of the column labeled "Blinded randomization" of the Reports table

#C.3.30.1500.0200. For an open model, users without setup rights can view the assigned group allocation directly in the record and reports.  
Scenario:
Given I click on the link labeled "Add / Edit Records"
And I select "6" on the dropdown field labeled "Choose an existing Record ID"
And I click the bubble for the row labeled "Randomization" on the column labeled "Status"

#Verify the user can see the assigned group allocation code directly in the record
Then I should see the radio labeled "Radomization group" with option "Drug A" selected

#Verify the user can see the assigned group allocation code directly in reports
When I click on the link "Open Rand Report"
Then I should see a "Drug A (1)" within the "6" row of the column labeled "Randomization group" of the Reports table

#C.3.30.1500.0300. All users with export rights can export randomized records, seeing the allocation assigned to each record as displayed in the record view.  
Scenario:
Given I click on the link "Data Exports, Reports, and Stats"
And I click on the first button labeled "View Report"
Then I should see a "Drug A (1)" within the "6" row of the column labeled "Randomization group" of the Reports table
And I should see a "1" within the "6" row of the column labeled "Blinded randomization" of the Reports table
And I should NOT see a "Group A" within the "6" row of the column labeled "Blinded randomization" of the Reports table

#C.3.30.1500.0400. Only users with setup rights or admin privileges can access and export the full allocation table directly from the setup interface, regardless of model type.
Scenario:#User without setup rights can not access and export the full allocation table directly from the setup interface, regardless of model type.

Scenario:#User with setup rights can access and export the full allocation table directly from the setup interface, regardless of model type.

Scenario:#Admin User can access and export the full allocation table directly from the setup interface, regardless of model type.
