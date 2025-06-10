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

#C.3.30.1500.0100. For a blinded model, users without setup rights will see only a concealed allocation code in the record and reports, with no visible group assignment.  
#C.3.30.1500.0200. For an open model, users without setup rights can view the assigned group allocation directly in the record and reports.  
#C.3.30.1500.0300. All users with export rights can export randomized records, seeing the allocation assigned to each record as displayed in the record view.  
#C.3.30.1500.0400. Only users with setup rights or admin privileges can access and export the full allocation table directly from the setup interface, regardless of model type.






#FUNCTIONAL_REQUIREMENT C.3.30.0700.0900: Choose concealed randomization text field.
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I select the dropdown option "concealed_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY 
Scenario:
When I click on the link labeled "Randomization"
Then I should see a "concealed_rand" row of the column labeled "Target" of the Randomization Summary table

#FUNCTIONAL_REQUIREMENT C.3.30.0700.1000: Save randomization model.
Scenario:
When I click on the button labeled "Add new randomization model"
And I select "rand" on the dropdown field labeled "-select a field-"
And I click a button labeled "Save randomization model" and accept the confirmation window
And I should see a "Concealed allocation" icon in the column labeled "Allocation type" of the "concealed_rand" row of the column labeled "Target" of the Randomization Summary table

#VERIFY Success - Save randomization model.
Scenario:
Then I should see a dialog containing " Success! The randomization model has been saved!"
And I click on link labeled "Randomization"
Then I should see a "rand" within the "8" row of the column labeled "Target" 
