Feature: C.3.30.0600 User Interface: The system shall support stratified randomization by Data Access Group (DAG) and restrict user access based on their DAG assignment.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP project with no randomization enabled - "Project 3.30 randAM.xml"
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.0600" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project 3.30 randAM.xml", and clicking the "Create Project" button

#SETUP Randomization User Rights (Give User all Rand Rights and Add User 2)
When I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Edit User Privileges"
And I check a checkbox labeled "Data Access Groups"
And I check a checkbox labeled "Setup"
And I check a checkbox labeled "Dashboard"
And I check a checkbox labeled "Randomize"
And I save changes within the context of User Rights
And I enter "Test_User2" into the input field labeled "Add with custom rights"
And I click on the button labeled "Add with custom rights"
And I check a checkbox labeled "Randomize"
And I save changes within the context of User Rights

#SETUP DAG with user 2
When I click on the link labeled "DAGs"
And I enter "DAG" into the input field labeled "Add new group name"
And I click on the button labeled "Add Group"
And I select "Test_User2" on the dropdown field labeled "--Select User--"
And I select "Dag" on the dropdown field labeled "[No Assignment]"
And I click on the button labeled "Assign"

#SETUP Add a record to DAG
When I click on the link labeled "Add / Edit Records"
And I select "1" on the dropdown field labeled "--Select Record--"
And I select "Assign to Data Access Group" on the dropdown field labeled "Choose action for record"
And I select "Dag" on the dropdown field labeled "[No Assignment]"
And I click on the button labeled "Assign to Data Access Group"

#SETUP Upload randomization
When I click on the link labeled "Randomization"
And I click on the icon in the row labeled "rand_group" 
And I upload a "csv" format file located at "RandomizationAllocationTemplate_0600.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I click on the link labeled "My Projects"
And I logout

#SETUP Login to Test User 2
Given I login to REDCap with the user "Test_User2"
And I click "My Projects" on the menu bar
And I click the link labeled "C.3.30.0600"

#FUNCTIONAL_REQUIREMENT C.3.30.0600.0100. Users within a DAG can randomize records only within their assigned DAG, ensuring they cannot view or randomize records outside their group.

#FUNCTIONAL_REQUIREMENT C.3.30.0600.0200: The randomization model shall support stratification by DAG, allowing independent randomization assignments within each DAG.
And I logout


#END
