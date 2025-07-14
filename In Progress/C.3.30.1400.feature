Feature: C.3.30.1400 – User Interface: The system shall support single randomization per model and multiple randomizations per record.
# Randomization
C.3.30.1400.0100. A record can be randomized across distinct models (e.g., Model A, Model B).
C.3.30.1400.0200. The system shall prevent a record from being randomized more than once within the same model.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1400" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.OpenBlind.xml", and clicking the "Create Project" button

#SETUP- Assign rights for user with randomization rights
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test_User1" 
And I click on the button labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "select role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User1" has been successfully ASSIGNED to the user role "1_FullRights"."

#SETUP 2 Randomization Models (in our example: 1 Open (rand_group), 1 Blind)
Scenario:
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Set up randomization"
And I click on the icon labeled "Setup" in the row labeled "1"
And I upload a "csv" format file located at "AlloRand blind1.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I click on the link labeled "Project Setup"
And I click on the button labeled "Set up randomization"
And I click on the icon labeled "Setup" in the row labeled "2"
And I upload a "csv" format file located at "AlloRand open1.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file

Scenario:#C.3.30.1400.0100. A record can be randomized across distinct models (e.g., Model A, Model B).
# This means: A record can be randomized more than once, but each randomization must come from a different model (e.g., Model A for Intervention Arm, Model B for Drug Dosage).
# Randomize one Record with the Randomization Group Model (Open) and one with the Blinded Randomization Model.
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
And I click on the button labeled "Save & Stay"

#VERIFY that the record is randomized more than once, once from the Open (Randomization Group) model and once from the Blinded model.
And I should see "Already Randomized" near a Radio button labeled "Randomization group"
And I should see "Already Randomized" near a field labeled "Blinded randomization"

#C.3.30.1400.0200. The system shall prevent a record from being randomized more than once within the same model.
# This means: The system must prevent re-randomizing a record to the same model once it's been randomized.
And I should NOT see a button labeled "Randomize"
