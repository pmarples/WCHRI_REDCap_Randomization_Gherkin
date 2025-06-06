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
# Click on Randomization
# click on Setup in row 1
#verify unable to erase randomization model
#Verify unable to modify Stratification
#Verify unable to change randomize by group/site
#verify unable to change randomization field
#verify unable to upload or download allocation table for use in Development
#verify unable to upload or download allocation table for use in Production
Given I logout

Scenario: C.3.30.0900.0200. Admin user unable to revert project to development.  
Given I login to REDCap with the user "Test_Admin"
#Click on Project Setup
#Click on Other Functionality
#verify cannot see "Move to development"

Scenario: C.3.30.0900.0300. Admin cannot modify setup in production.  
# Click on Randomization
# click on Setup in row 1
#verify unable to erase randomization model
#Verify unable to modify Stratification
#Verify unable to change randomize by group/site
#verify unable to change randomization field
#verify unable to upload or download allocation table for use in Development

Scenario: C.3.30.0900.0400. Admin can download existing allocation table in production.  
#verify able to download allocation table for use in Production

Scenario: C.3.30.0900.0500. Admin cannot modify existing allocation table in production. 
#verify unable to delete or change allocation table for use in Production

Scenario: C.3.30.0900.0600. Admin can upload additional allocations to existing table in production.
#verify able to upload more allocations (Administrators only)
#verify logging for the upload

Given I logout
#End
