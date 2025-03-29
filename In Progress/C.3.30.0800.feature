Feature: C.3.30.0800.	User Interface: The system shall ensure users with Randomization Setup can create or modify the automatic triggering options: Manual, Users with Randomize permission, all users (including survey).
# Randomization C.3.30.0800.0100 to C.3.30.0800.0500
#C.3.30.0800.0100. Manual only, using Randomize button (default)  
#C.3.30.0800.0200. Trigger logic, for users with Randomize permissions only  
#C.3.30.0800.0300 Trigger logic, for all users based on form  
#C.3.30.0800.0400 Trigger logic, for all users based on survey  
#C.3.30.0800.0500 Modify trigger while in production

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.0800" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30 TriggerRand.xml", and clicking the "Create Project" button

#SETUP User Rights
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Assign to role" on the tooltip
And I select "1_FullRights" on the dropdown field labeled "Select Role"
And I click on the button labeled exactly "Assign"
And I enter "Test_User2" into the input field labeled "Assign new user to role"
And I select "5_NoRand" on the dropdown field labeled "Select Role"
And I click on the button labeled exactly "Assign"

#SETUP randomization for 0100
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
Then I should see "STEP 1: Define your randomization model"
And I select the dropdown option "rand_group" for the field labeled "Choose your randomization field"
And I click on the button labeled "Save randomization model" and accept the confirmation window
And I upload a "csv" format file located at "AlloRand rand_group1.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I upload a "csv" format file located at "AlloRand rand_group2.csv", by clicking the button near "Upload allocation table (CSV file) for use in PRODUCTION status" to browse for the file, and clicking the button labeled "Upload File" to upload the file

#C.3.30.0800.0100. Manual only, using Randomize button (default)  
Scenario:
When I click on the link labeled "Add/Edit Records"
And I select "1" on the dropdown field labeled "Choose an existing Record ID"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
Then I should see a button labeled "Randomize" for the field labeled "Randomization Group"

#VERIFY User can Randomize Manually, using Randomize Button
Scenario:
When I click on a button labeled "Randomize" for the field labeled "Randomization Group"
Then I should see a dialog containing the following text: "Below you may perform randomization for Record ID 1 on the field Randomization group (rand_group)." 
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID 1 was randomized for the field Randomization group and assigned the value Drug A (1)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

#SETUP randomization for 0200
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
Then I should see "STEP 1: Define your randomization model"
And I select the dropdown option "auto_rand" for the field labeled "Choose your randomization field"
And I click on the button labeled "Save randomization model" and accept the confirmation window
And I upload a "csv" format file located at "AlloRand rand_group1.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I upload a "csv" format file located at "AlloRand rand_group2.csv", by clicking the button near "Upload allocation table (CSV file) for use in PRODUCTION status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I select the dropdown option "Trigger Logic, for users with Randomize permission only" for the field labeled "Trigger Option"
And I select the dropdown option "Demographics" for the field labeled "Instrument"
And I enter "[fname]<>"" and [lname]<>""" into the textarea field labeled "Trigger logic"
And I click on the button labeled "Update & Close Editor"
And I click on the button labeled "Save trigger option"

#C.3.30.0800.0200. Trigger logic, for users with Randomize permissions only
Scenario:
When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Demographics" 
And I enter "Donald" into the data entry form field labeled "First Name" 
And I enter "Duck" into the data entry form field labeled "Last Name" 
And I click on the button labeled "Save & Exit Form"
Then I should see a dialog containing the following text: "Record ID 6 successfully added." 

#VERIFY Trigger logic, for users with Randomize permissions only
Scenario:
When I click on the icon labeled "Status" for the row labeled "Randomization" 
Then I should see a dialog containing the following text: "Already Randomized" near field labeled "Automatic Randomization"
And  I should see the radio field labeled "Automatic Randomization" with the option "Group 1" selected

#SETUP randomization for 0300 and 0400
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
Then I should see "STEP 1: Define your randomization model"
And I select the dropdown option "rand_survey" for the field labeled "Choose your randomization field"
And I click on the button labeled "Save randomization model" and accept the confirmation window
And I upload a "csv" format file located at "AlloRand rand_group1.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I upload a "csv" format file located at "AlloRand rand_group2.csv", by clicking the button near "Upload allocation table (CSV file) for use in PRODUCTION status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I select the dropdown option "Trigger Logic, for all users (including survey respondents)" for the field labeled "Trigger Option"
And I select the dropdown option "Survey" for the field labeled "Instrument"
And I enter "[survey_complete]="2"" into the textarea field labeled "Trigger logic"
And I click on the button labeled "Update & Close Editor"
And I click on the button labeled "Save trigger option"

#C.3.30.0800.0300 Trigger logic, for all users based on form  
Scenario:

#C.3.30.0800.0400 Trigger logic, for all users based on survey  
#C.3.30.0800.0500 Modify trigger while in production
