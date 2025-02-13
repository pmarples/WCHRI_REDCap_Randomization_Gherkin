Feature: C.3.30.0700 User Interface: The system shall ensure users with Randomization Setup can create and modify randomization models while in project development mode. 
# B: Randomization by group/site C.3.30.0700.0400 to C.3.30.0700.0600

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP project with randomization enabled - "C.3.30.Rand.xml"
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.0700B" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

#SETUP User Rights
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Assign to role" on the tooltip
And I select "1_FullRights" on the dropdown field labeled "Select Role"
And I click on the button labeled exactly "Assign"

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0400: Randomize by group/site enabled with no option selected results in error
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I click on the checkbox labeled "B) Randomize by group/site?"
And I select the dropdown option "simple_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see a dialog containing the following text: "Please choose one of the grouping options OR uncheck the Randomize By Group checkbox."
And I click "Ok"

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0500: Randomize by group/site enabled with DAG selected.
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I click on the checkbox labeled "B) Randomize by group/site?"
And I click on the radio button option labeled "Use Data Access Groups to designate each group/site (2 groups currently exist)"
And I select the dropdown option "simple_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY Data Access group in Stratification column beside simple_rand
When I click on the link labeled "Randomization"
Then I should see a "Data Access group" with the "simple_rand" row of the column labeled "Stratification" of the Randomization Summary table

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0600: Randomize by group/site enabled with an existing field selected.
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I click on the checkbox labeled "B) Randomize by group/site?"
And I click on the radio button option labeled "Use an existing field to designate each group/site"
And I select the dropdown option "existing_dags" for the field labeled "Use an existing field to designate each group/site"
And I select the dropdown option "complex_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY existing_dags in Stratification column beside complex_rand
When I click on the link labeled "Randomization"
Then I should see an "existing_dags" with the "complex_rand" row of the column labeled "Stratification" of the Randomization Summary table
And I log out
#END
