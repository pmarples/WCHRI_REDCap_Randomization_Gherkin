Feature: C.3.30.0700 User Interface: The system shall ensure users with Randomization Setup can create and modify randomization models while in project development mode. 
# D: Randomization field options C.3.30.0700.1000 to C.3.30.0700.1100

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP project with randomization enabled - "Project 3.30 randAM.xml"
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.0700.D" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project 3.30 randAM.xml", and clicking the "Create Project" button

#SETUP Randomization User Rights (Give User all Rand Rights)
When I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Edit User Privileges"
And I check a checkbox labeled "Setup"
And I check a checkbox labeled "Dashboard"
And I check a checkbox labeled "Randomize"
And I save changes within the context of User Rights
And I click on the link labeled "Randomization"

#FUNCTIONAL_REQUIREMENT C.3.30.0700.1000: Save randomization model.
When I click on the button labeled "Add new randomization model"
And I select "will_survey" on the dropdown field labeled "-select a field-"
And I click a button labeled "Save randomization model" and accept the confirmation window
#VERIFY Success - Save randomization model.
Then I should see a dialog containing " Success! The randomization model has been saved!"
And I click on link labeled "Randomization"
Then I should see a "will_survey" within the "5" row of the column labeled "Target" 


C.3.30.0700.1100: Erase randomization model.
When I click on the icon labeled "Setup" in the row labeled "5"
And I click on the link labeled "Erase randomization model" and deny the confirmation window
Then I should NOT see a dialog containing "Success! Your randomization setup and all allocations have now been erased."
And I click on the link labeled "Erase randomization model" and accept the confirmation window
#VERIFY Sucess - Radnomization model erased
Then I should see a dialog containing "Success! Your randomization setup and all allocations have now been erased."
And I click on link labeled "Randomization"
Then I should NOT see a "will_survey" within the "5" row of the column labeled "Target" 

#VERIFY Logging - Save randomization model.
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | Test_User1 | Manage/Design | Save Randomization Model |
  | Test_User1 | Manage/Design | Erase randomization model and allocations |
And I logout
#END
