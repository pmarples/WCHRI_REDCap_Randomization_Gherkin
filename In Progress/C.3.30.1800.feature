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


Start set up same as 17, then test the table options:1700 posted below.






Feature: C.3.30.1700.	Project Interface Administrator Access: The system shall support administrator-only access to the randomization module's View Allocation Table page.
# Randomization C.3.30.1700.0100 to C.3.30.1700.0200
#C.3.30.1700.0100. Admin accesses View Allocation Table page.  
#C.3.30.1700.0200. User with dashboard rights cannot access View Allocation Table.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1700" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.OpenBlind.xml", and clicking the "Create Project" button

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

Scenario:#C.3.30.1700.0100. Admin accesses View Allocation Table page.  
Given I login to REDCap with the user "Test_Admin"
And I click on the link labeled "Randomization"
And I click on the icon labeled "Dashboard" in the row labeled "1"
#VERIFY Admin user can see View Allocation Table link from the Dashboard.
Then I should see an icon labeled "View Admin Only"

#Verify Admin can click on View Allocation Table link from the Dashboard.
When I click on the first icon labeled "View Admin Only"
Then I should see "View Allocation Table"

Given I logout

#C.3.30.1700.0200. User with dashboard rights cannot access View Allocation Table.
Given I login to REDCap with the user "Test_User1"
And I click on the link labeled "Randomization"
And I click on the icon labeled "Dashboard" in the row labeled "1"

#VERIFY Test User with dashboard permissions cannot see View Allocation Table link from the Dashboard.
Then I should NOT see an icon labeled "View Admin Only"

Given I logout
#End
