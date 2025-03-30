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

#VERIFY - Logging
Scenario:
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | Test_User1 | Update record 1 |  |
  | Test_User1 | Randomize record 1 | Randomize record |
  | Test_User1 | Update Response 1 | rand_group = '1' |

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

#VERIFY - Logging
Scenario:
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | Test_User1 | Randomize record 6 | Randomize record (via trigger) |
  | Test_User1 | Update Response 6 | auto_rand = '1' |
  | Test_User1 | Create record 6 | fname = 'Donald', lname = 'Duck', demographics_complete = '0', record_id = '6' |
  | Test_User1 | 	Manage/Design | Save randomization execute option (trigger_option: Trigger logic (user with Randomize permission), instrument: demographics, logic: [fname]<>"" a...) |


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
And I logout

#C.3.30.0800.0300 Trigger logic, for all users based on form  
Scenario:
Given I login to REDCap with the user "Test_User2"
And I click "My Projects" on the menu bar
And I click the link labeled "C.3.30.0800"
And I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Survey" 
Then I should see a dialog containing the following text: "Not yet randomized" near field labeled "Go to:"
And I should see a field labeled "Go to:" is disabled
And I click the button labeled "Yes" for the field labeled "Will you complete the survey?"
And I select the dropdown option "Complete" for the Data Collection Instrument field labeled "Complete?" 
And I select the submit option labeled "Save & Stay" on the Data Collection Instrument

#VERIFY Trigger logic, for all users based on form
Then I should see a dialog containing the following text: "Already Randomized" near field labeled "Go to:"
And  I should see the radio field labeled "Go to:" with the option "Survey A" selected

#C.3.30.0800.0400 Trigger logic, for all users based on survey
Scenario:
When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Survey" 
Then I should see a dialog containing the following text: "Not yet randomized" near field labeled "Go to:"
And I should see a field labeled "Go to:" is disabled
And I click the button labeled "Yes" for the field labeled "Will you complete the survey?"
And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
And I click on the survey option label containing "Log Out + Open Survey" label
And I click on the button labeled "Submit"
And I return to the REDCap page I opened the survey from

#VERIFY Trigger Logic, for all users based on survey
Scenario:
Given I login to REDCap with the user "Test_User1"
And I click "My Projects" on the menu bar
And I click the link labeled "C.3.30.0800"
And I click on the link labeled "Add/Edit Records"
And I select "8" on the dropdown field labeled "Choose an existing Record ID"
And I click on the icon labeled "Status" for the row labeled "Survey" 
Then I should see a dialog containing the following text: "Already Randomized" near field labeled "Go to:"
And  I should see the radio field labeled "Go to:" with the option "Survey B" selected

#SETUP move project to production
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Move project to production"
And I click on the radio labeled "Keep ALL data saved so far. (8 Records)" 
And I click on the button labeled "YES, Move project to production" and accept the confirmation window
Then I should see a dialog containing the following text: "Success! Project now in production" 

#VERIFY - Logging
Scenario:
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | [survey respondent] | Randomize record 8 | Randomize record (via trigger) |
  | [survey respondent] | Update Response 8 | rand_survey = '2' |
  | [survey respondent] | Update Response 8 | survey_complete = '2' |
  | Test_User2 | Create record 8 | will_survey = '1', survey_complete = '0', record_id = '8' |
  | Test_User2 | Randomize record 8 | Randomize record (via trigger) |
  | Test_User2 | Update Response 8 | rand_survey = '1' |
  | Test_User2 | Create record 8 | survey_complete = '2', record_id = '7' |
  | Test_User1 | 	Manage/Design | Save randomization execute option (trigger_option: Trigger logic (any user or survey participant), instrument: survey, logic: [survey_compl...) |

#C.3.30.0800.0500 Modify trigger while in production
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the icon labeled "Setup" in the row labeled "3"
And I select the dropdown option "Trigger Logic, for users with Randomize permission only" for the field labeled "Trigger Option"
And I select the dropdown option "Demographics" for the field labeled "Instrument"
And I enter "[demographics_complete]="2"" into the textarea field labeled "Trigger logic"
And I click on the button labeled "Update & Close Editor"
And I click on the button labeled "Save trigger option"
And I logout

#VERIFY Modify trigger while in production
Scenario:
Given I login to REDCap with the user "Test_User2"
And I click "My Projects" on the menu bar
And I click the link labeled "C.3.30.0800"
And I click on the link labeled "Add/Edit Records"
And I select "7" on the dropdown field labeled "Choose an existing Record ID"
And I click on the icon labeled "Status" for the row labeled "Survey" 
Then I should see the radio labeled "Will you complete the survey?" with option "Yes" unselected
Then I should see the radio labeled "Go to" with option "Survey A" unselected

#VERIFY Test_User2 can no longer randomize this record
Scenario:
When I click on the link labeled "Demographics"
And I select the dropdown option "Complete" for the Data Collection Instrument field labeled "Complete?" 
And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
And I click on the icon labeled "Status" for the row labeled "Survey"
Then I should see a dialog containing the following text: "Not yet randomized" near field labeled "Go to:"
And I logout

#VERIFY Test_User1 can randomize this record
Given I login to REDCap with the user "Test_User1"
And I click "My Projects" on the menu bar
And I click the link labeled "C.3.30.0800"
And I click on the link labeled "Add/Edit Records"
And I select "7" on the dropdown field labeled "Choose an existing Record ID"
And I click on the icon labeled "Status" for the row labeled "Survey"
Then I should see a button labeled "Randomize" in the data entry form field "Go to:"
And I click on the button labeled "Randomize" in the data entry form field "Go to:"
And I click on the button labeled "Randomize"
And I click on the button labeled "Close"
And I should see the radio labeled "Go to" with option "Survey C" selected
And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

#VERIFY - Logging
Scenario:
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | Test_User1 | Update record 7 | survey_complete = '2' |
  | Test_User1 | Randomize record 7 | Randomize record |
  | Test_User2 | Update record 7 | rand_survey = '3', survey_complete = '0' |
  | Test_User1 | Update record 7  | demographics_complete = '2' |
  | Test_User1 | 	Manage/Design | Save randomization execute option (trigger_option: Trigger logic (any user or survey participant), instrument: survey, logic: [demographics...) |
  | Test_User1 | 	Manage/Design | Move project to Production status |
  | Test_User1 | Update record 8 | rand_survey = '' |
  | Test_User1 | Update record 7 | rand_survey = '' |
  | Test_User1 | Update record 6 | auto_rand = '' |
  | Test_User1 | Update record 1 | rand_group = '' |
And I logout
#END
  
