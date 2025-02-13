Feature: C.3.30.0700 User Interface: The system shall ensure users with Randomization Setup can create and modify randomization models while in project development mode. 
# C: Randomization field options C.3.30.0700.0700 to C.3.30.0700.0900

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP project with randomization enabled - "C.3.30.Rand.xml"
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.0700A" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

#SETUP User Rights
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Assign to role" on the tooltip
And I select "1_FullRights" on the dropdown field labeled "Select Role"
And I click on the button labeled exactly "Assign"

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0700: Choose open randomization dropdown field.
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I select the dropdown option "simple_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY 
When I click on the link labeled "Randomization"
Then I should see a "simple_rand" row of the column labeled "Target" of the Randomization Summary table

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0800: Choose open randomization radio field.
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I select the dropdown option "complex_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY 
When I click on the link labeled "Randomization"
Then I should see a "complex_rand" row of the column labeled "Target" of the Randomization Summary table

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0900: Choose concealed randomization text field.
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I select the dropdown option "concealed_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY 
When I click on the link labeled "Randomization"
Then I should see a "concealed_rand" row of the column labeled "Target" of the Randomization Summary table
And I log out
#END
