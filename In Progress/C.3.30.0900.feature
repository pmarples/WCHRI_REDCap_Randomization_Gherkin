#Questions:Sorry - this one isn't ready... I have a question for C.3.30.0900.0100:  
##NOTE: Normal user can Modify Changes to the Step 4: Automatic Triggering Option in Production - is this expected? 
# If yes, should it be validated?

Feature: C.3.30.0900.	User Interface: The system shall ensure users with Randomization Setup rights lock randomization models and allocation table while in production mode.	
# Randomization
# C.3.30.0900.0100. Normal user cannot modify setup in production.  
# C.3.30.0900.0200. Admin user unable to revert project to development.  
# C.3.30.0900.0300. Admin cannot modify setup in production.  
# C.3.30.0900.0400. Admin can download existing allocation table in production.  
# C.3.30.0900.0500. Admin cannot modify existing allocation table in production.  
# C.3.30.0900.0600. Admin can upload additional allocations to existing table in production.


As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_Admin"
And I create a new project named "C.3.30.0900" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

#SETUP randomization 
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the icon labeled "Setup" in the row labeled "1"
And I upload a "csv" format file located at "AlloRand rand_group3.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I upload a "csv" format file located at "AlloRand rand_group4.csv", by clicking the button near "Upload allocation table (CSV file) for use in PRODUCTION status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
When I click on the link labeled "Project Setup"
And I click on the button labeled "Move project to production"
And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
And I click on the button labeled "Ok"
Then I should see Project status: "Production"

#SETUP User Rights
Scenario: 
When I click on the link labeled "User Rights"
And I enter "Test_User1" into the input field labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "Select Role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User1" has been successfully ASSIGNED to the user role "1_FullRights"."
Given I logout

Scenario: C.3.30.0900.0100. Normal user cannot modify setup in production. 
Given I login to REDCap with the user "Test_User1"
And I Click on the link labeled "Randomization"
And I click on the icon labeled "Setup" in the row labeled "1"

#verify unable to erase randomization model
And I verify I cannot click on the link labeled "Erase randomization model"

#Verify unable to modify Stratification
And I verify I cannot uncheck the checkbox labeled "A) Use stratified randomization?"
And I verify I cannot select "strat_1 (Stratification 1)" on the first dropdown field labeled "gender"

#Verify unable to change randomize by group/site
And I verify I cannot check the checkbox labeled "B) Randomize by group/site?"

#verify unable to change randomization field
And I verify I cannot select "rand_group (Randomization group)" on the second dropdown field labeled "rand_group (Randomization group)"

#verify unable to upload or download allocation table for use in Development
And I verify I cannot click on the button labeled "Download table" on the first button labeled "Download table"

#verify unable to upload or download allocation table for use in Production
And I verify I cannot click on the button labeled "Download table" on the second button labeled "Download table"

##NOTE: Normal user can Modify Changes to the Step 4: Automatic Triggering Option in Production - is this expected? If yes, should it be validated?

Given I logout

Scenario: C.3.30.0900.0200. Admin user unable to revert project to development.  
Given I login to REDCap with the user "Test_Admin"
And I click on the link labeled "Project Setup"
And I click on the link labeled "Other Functionality"
Then I should see "Because Randomization is enabled, the project cannot be moved back to Development status."
And I verify I cannot click on the button labeled "Move back to Development status" 

Scenario: C.3.30.0900.0300. Admin cannot modify setup in production.  
Given I Click on the link labeled "Randomization"
And I click on the icon labeled "Setup" in the row labeled "1"

#verify unable to erase randomization model
And I verify I cannot click on the link labeled "Erase randomization model"

#Verify unable to modify Stratification
And I verify I cannot uncheck the checkbox labeled "A) Use stratified randomization?"
And I verify I cannot select "strat_1 (Stratification 1)" on the first dropdown field labeled "gender"

#Verify unable to change randomize by group/site
And I verify I cannot check the checkbox labeled "B) Randomize by group/site?"

#verify unable to change randomization field
And I verify I cannot select "rand_group (Randomization group)" on the second dropdown field labeled "rand_group (Randomization group)"

#verify unable to upload or download allocation table for use in Development
And I verify I cannot click on the button labeled "Download table" on the first button labeled "Download table"
Then I should not see "Upload more allocations? (Administrators only)" near "Upload allocation table (CSV file) for use in DEVELOPMENT status"

Scenario: C.3.30.0900.0400. Admin can download existing allocation table in production.  
#verify able to download allocation table for use in Production
And I should see a link labeled "Upload more allocations? (Administrators only) near "Upload allocation table (CSV file) for use in PRODUCTION status"
And I should see a button labeled "Download table" near "Upload allocation table (CSV file) for use in PRODUCTION status"
And I should see "(only REDCap admins may download the allocation table while in production)"

Given I click on the on the button labeled "Download table" on the second button labeled "Download table" near "Upload allocation table (CSV file) for use in PRODUCTION status"
And I click the button labeled "Download table"
Then I should see a downloaded file named "RandomizationAllocationTemplate_Prod.csv"

Scenario: C.3.30.0900.0500. Admin cannot modify existing allocation table in production. 
#verify unable to delete or change allocation table for use in Production
And I should not see "Delete allocation table"

Scenario: C.3.30.0900.0600. Admin can upload additional allocations to existing table in production.
#verify able to upload more allocations (Administrators only)
When I click on the link labeled "Upload more allocations? (Administrators only)"
Then I should see a button labeled "Choose File"
And I should see a button labeled "Upload File"
When I upload a "csv" format file located at "RandomizationAllocationTemplate_Prod.csv", by clicking the button near "for use in PRODUCTION status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
Then I should see "Success! New assignments were appended to your existing randomization allocation table!"

#verify logging for the upload
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported           |
            | mm/dd/yyyy hh:mm | test_admin | Manage/Design |Upload randomization allocation table to append - production (rid=#)|

Given I logout
#End
