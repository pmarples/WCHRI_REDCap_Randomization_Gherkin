Feature: C.3.30.1100.	User Interface: The system shall ensure users with Randomize rights can execute record randomization.
# Randomization 
#C.3.30.1100.0100. User without randomize rights cannot randomize record.  
#C.3.30.1100.0200. User with randomize rights can randomize record.  
#C.3.30.1100.0300. Record's randomized value matches allocation table.  (Also tested in C.3.30.1000 as part of proving sequential assignment)
#C.3.30.1100.0400 User with randomize rights cannot modify randomized record.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.OneRand.xml", and clicking the "Create Project" button

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
Given I logout

#C.3.30.1100.0100. User without randomize rights cannot randomize record.  
Given I login to REDCap with the user "Test_User2"
And I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
Then I should NOT see a button labeled "Randomize"
And I CANNOT select the radio option "Drug A" for the field labeled "Randomization group"
Given I logout

#C.3.30.1100.0200. User with randomize rights can randomize record.  
Given I login to REDCap with the user "Test_User1"
And I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
Then I should see a button labeled "Randomize"
And I click ont the button labeled "Randomize"
And I select "Man" on the radio field labeled "Do you describe yourself as a man, a woman, or in some other way?"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "6" was randomized for the field "Randomization group" and assigned the value "Drug A" (1)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

#C.3.30.1100.0300. Record's randomized value matches allocation table.  (Also tested in C.3.30.1000 as part of proving sequential assignment)
#question: Is it enough to be able to predict what allocation is coming next?  Or do we need to "look" at the allocation table to verify it is the same as what is expected?

#C.3.30.1100.0400 User with randomize rights cannot modify randomized record.
When I click on the link labeled "Add / Edit Records"
And I select "6" on the dropdown field labeled "Choose an existing Record ID"
And I click the bubble for the row labeled "Randomization" on the column labeled "Status"
Then I should see the radio labeled "Radomization group" with option "Drug A" selected
And I CANNOT select the radio option "Drug B" for the field labeled "Randomization group"

Given I logout
#End

