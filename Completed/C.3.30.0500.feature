Feature: C.3.30.0500 User Interface: The system shall allow user rights configuration to create and manage Randomization Dashboard.
#C.3.30.0500.0100. User with Randomization Randomize rights can Randomize.  
#C.3.30.0500.0200. User without Randomization Randomize rights cannot Randomize.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP project with randomization enabled - "Project 3.30 randAM.xml"
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.0500" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project 3.30 randAM.xml", and clicking the "Create Project" button

#SETUP Randomization User Rights (Give User all Rand Rights)
Scenario:
When I click on the link labeled "Project Setup"
And I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Edit User Privileges"
And I check a checkbox labeled "Setup"
And I check a checkbox labeled "Dashboard"
And I check a checkbox labeled "Randomize"
And I save changes within the context of User Rights
And I click on the link labeled "Randomization"

#SETUP Randomization (Setup project with simple Randomization)
When I click on the icon labeled "Setup" in the row labeled "rand_group" 
And I download a file by clicking on the button labeled "Example #1 (basic)"
And  I upload a "csv" format file located at "RandomizationAllocationTemplate.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file

#FUNCTIONAL_REQUIREMENT C.3.30.0500.100: User with Randomization Randomize rights can Randomize.
Scenario:
When I click on the link labeled "Add / Edit Records"
And I click on a button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
Then I should see a button labeled "Randomize" for the field labeled "Randomization Group"
##VERIFY User with Randomization Randomize rights can Randomize.
When I click on a button labeled "Randomize" for the field labeled "Randomization Group"
Then I should see the radio labeled "Do you describe yourself as a man, a woman, or in some other way?" with option "man" unselected
And I select the radio option "man" for the field labeled "Do you describe yourself as a man, a woman, or in some other way?" 
And I click on the button labeled "Randomize"
And I click on the button labeled "Close"
Then I should see the radio labeled "Randomization group" with option "Drug A" selected

#SETUP User Rights (Takeaway User Rand - Setup Rights)
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Edit User Privileges"
And I uncheck a checkbox labeled "Randomize"
And I save changes within the context of User Rights

#FUNCTIONAL_REQUIREMENT C.3.30.0500.200: User without Randomization Randomize rights cannot Randomize.
Scenario:
When I click on the link labeled "Add / Edit Records"
And I click on a button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
##VERIFY User without Randomization Randomize rights cannot Randomize.
Then I NOT should see a button labeled "Randomize"

#VERIFY Logging - Save randomization model.
Scenario:
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | Test_User1 | Update user Test_User1 | user = 'Test_User1' |
  | Test_User1 | Randomize Record 6 | Randomize record|
  | Test_User1 | Create Record 6 | record_id = '6', rand_group = '1', gender = '0', randomization_complete = '0'|
  | Test_User1 | Manage/Design | Upload randomization allocation table - development |
  | Test_User1 | Update user Test_User1 | user = 'Test_User1' |

And I log out
#END
