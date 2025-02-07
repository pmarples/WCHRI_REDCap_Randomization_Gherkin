Feature: C.3.30.0600 User Interface: The system shall support stratified randomization by Data Access Group (DAG) and restrict user access based on their DAG assignment.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP project with no randomization enabled - "C.3.30 AllRandOptions.xml"
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.0600" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30 AllRandOptions.xml", and clicking the "Create Project" button

#SETUP Randomization User Rights (Give User all Rand Rights and Add User 2)
When I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Edit User Privileges"
And I check the User Right named "Data Access Groups"
And I check the User Right named "Setup"
And I check the User Right named "Dashboard"
And I check the User Right named "Randomize"
And I save changes within the context of User Rights
And I enter "Test_User2" into the input field labeled "Add with custom rights"
And I click on the button labeled "Add with custom rights"
And I check the User Right named "Randomize"
And I save changes within the context of User Rights

#SETUP DAG with user 2
When I click on the link labeled "DAGs"
And I select "Test_User2" on the dropdown field labeled "Assign user"
And I select "DAG 1" on the dropdown field labeled "to"
And I click on the button labeled "Assign"

#SETUP Add a record to DAG
When I click on the link labeled "Add / Edit Records"
And I select "1" on the dropdown field labeled "Choose an existing Record ID"
And I select "Assign to Data Access Group" on the dropdown field labeled "Choose action for record"
And I select "DAG" on the dropdown field labeled "Assign record "1" to one of the following Data Access Groups:"
And I click on the button labeled "Assign to Data Access Group"

#SETUP Upload randomization
When I click on the link labeled "Randomization"
And I click on the icon in the column labeled "Setup" in the row labeled "dag_rand" 
And I upload a "csv" format file located at "C.3.30.0600Allocation1.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I click on the link labeled "My Projects"
And I logout

#SETUP Login to Test User 2
Given I login to REDCap with the user "Test_User2"
And I click "My Projects" on the menu bar
And I click the link labeled "C.3.30.0600"

Scenario: #FUNCTIONAL_REQUIREMENT C.3.30.0600.0100. Users within a DAG can randomize records only within their assigned DAG, ensuring they cannot view or randomize records outside their group.
#Users in a DAG can randomize records in their DAG
When I click on the link labeled "Add / Edit Records"
And I click the button "Add new record"
And I click the bubble for the row labeled "Randomization" on the column labeled "Status" 
And I click on the button labeled "Randomize" for the field labeled "Stratified by DAG Randomization"
Then I should see a dialog containing the following text: "Below you may perform randomization for Record ID "1-1" on the field Stratified by DAG Randomization (dag_rand)"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "1-1" was randomized for the field "Randomization group" and assigned the value "Group 1"(1)" 
And I click on the button labeled "Close"
And  I should see the radio field labeled "Stratified by DAG Randomization" with the option "Group 1" selected 
And I should see "Already Randomized" near the radio field labeled "Stratified by DAG Randomization"

#Users in a DAG can view randomization in their DAG
When I click on the link labeled "Add / Edit Records"
And I select "1" on the dropdown field labeled "Choose an existing Record ID"
And I click the bubble for the row labeled "Randomization" on the column labeled "Status"
Then I should see "Drug A" in the data entry form field "Randomization Group" 
And I should see "1" in the data entry form field "Blinded randomization" 
And I should see "Group 1" in the data entry form field "Automatic Randomization" 

#Users in a DAG cannot view or randomize outside their DAG
When I click on the link labeled "Add / Edit Records"
And I click on the dropdown field labeled "Choose an existing Record ID"
Then I should see the radio field labeled "Choose an existing Record ID" with the options below
"1"
"1-1"
And I should see the radio field labeled "Choose an existing Record ID" WITHOUT the options below
"2"
"3"
"4"
"5"

Scenario: #FUNCTIONAL_REQUIREMENT C.3.30.0600.0200: The randomization model shall support stratification by DAG, allowing independent randomization assignments within each DAG.
#Randomize a second record to DAG 1 (Group 2 is expected)
When I click on the link labeled "Add / Edit Records"
And I click the button "Add new record"
And I click the bubble for the row labeled "Randomization" on the column labeled "Status"
And I click on the button labeled "Randomize" for the field labeled "Stratified by DAG Randomization"
Then I should see a dialog containing the following text: "Below you may perform randomization for Record ID "1-2" on the field Stratified by DAG Randomization (dag_rand)"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "1-2" was randomized for the field "Randomization group" and assigned the value "Group 2"(1)" 
And I click on the button labeled "Close"
And  I should see the radio field labeled "Stratified by DAG Randomization" with the option "Group 2" selected 
And I should see "Already Randomized" near the radio field labeled "Stratified by DAG Randomization"
And I logout

#Log in as Test User 1 and Randomize two records to DAG 2 (First Group 3 then Group 2 is expected)
Given I login to REDCap with the user "Test_User1"
And I click "My Projects" on the menu bar
And I click the link labeled "C.3.30.0600"
And I click on the link labeled "Add / Edit Records"
And I click the button "Add new record"
And I click the bubble for the row labeled "Randomization" on the column labeled "Status"
And  I select "DAG 2" on the dropdown field labeled "Assign record to a Data Access Group?"
And I click on the button labeled "Randomize" for the field labeled "Stratified by DAG Randomization"
Then I should see the dropdown field labeled "DAG 2" with the option "Group 2" selected 
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "6" was randomized for the field "Stratified by DAG Randomization" and assigned the value "Group 3" (3)."
And I click on the button labeled "Close"
Then  I should see the radio field labeled "Stratified by DAG Randomization" with the option "Group 3" selected 
And I should see "Already Randomized" near the radio field labeled "Stratified by DAG Randomization"

When I click on the link labeled "Add / Edit Records"
And I click the button "Add new record"
And I click the bubble for the row labeled "Randomization" on the column labeled "Status"
And  I select "DAG 2" on the dropdown field labeled "Assign record to a Data Access Group?"
And I click on the button labeled "Randomize" for the field labeled "Stratified by DAG Randomization"
Then I should see the dropdown field labeled "DAG 2" with the option "Group 2" selected 
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "7" was randomized for the field "Stratified by DAG Randomization" and assigned the value "Group 2" (2)."
And I click on the button labeled "Close"
Then  I should see the radio field labeled "Stratified by DAG Randomization" with the option "Group 2" selected 
And I should see "Already Randomized" near the radio field labeled "Stratified by DAG Randomization"

And I logout

#END
