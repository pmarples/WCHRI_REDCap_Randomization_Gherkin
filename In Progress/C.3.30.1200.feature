Feature: C.3.30.1200.	User Interface: The system shall support an audit trail showing who randomized the record and the date-time of randomization.
# Randomization C.3.30.1200.0100 to C.3.30.1200.0200
#C.3.30.1200.0100. Logging of record's randomization includes user and timestamp.  
#C.3.30.1200.0200. Users with logging privileges and without randomization privileges will not see record's randomized values.

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.OneRand.xml", and clicking the "Create Project" button

#SETUP User Rights
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test_User1" 
And I click on the button labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "select role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User1" has been successfully ASSIGNED to the user role "1_FullRights"."

#SETUP randomization 
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the icon labeled "Setup" in the row labeled "1"
And I upload a "csv" format file located at "AlloRand rand_group3.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I upload a "csv" format file located at "AlloRand rand_group4.csv", by clicking the button near "Upload allocation table (CSV file) for use in PRODUCTION status" to browse for the file, and clicking the button labeled "Upload File" to upload the file

#SETUP User Rights for user without randomization rights.
Scenario: 
When I click on the link labeled "User Rights"
And I enter "Test_User2" into the input field labeled "Assign to role"
And I select "5_NoRand" on the dropdown field labeled "Select Role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User2" has been successfully ASSIGNED to the user role "5_NoRand"."

#C.3.30.1200.0100. Logging of record's randomization includes user and timestamp.  
When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
Then I should see a button labeled "Randomize"
And I click ont the button labeled "Randomize"
And I select "Man" on the radio field labeled "Do you describe yourself as a man, a woman, or in some other way?"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "6" was randomized for the field "Randomization group" and assigned the value "Drug A" (1)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

#VERIFY: Logging of record's randomization includes user and timestamp.  
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
   |Time / Date| Username   | Action        | List of Data Changes OR Fields Exported      |
   | MM-DD-YYYY HH:MM | Test_User1 | Randomize record 6 | Randomize record |
Given I Logout

#C.3.30.1200.0200. Users with logging privileges and without randomization privileges will not see record's randomized values.
Given I login to REDCap with the user "Test_User2"
# note - In logging, I should not see record 6's randomized values, but I seem to be able to (in the Create Record row just after the Randomize Record row)

Given I logout
#End




