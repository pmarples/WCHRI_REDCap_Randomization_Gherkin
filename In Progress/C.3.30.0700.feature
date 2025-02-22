Feature: C.3.30.0700 User Interface: The system shall ensure users with Randomization Setup can create and modify randomization models while in project development mode. 
# A: Stratified Randomization C.3.30.0700.0100 to C.3.30.0700.1900

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

#SETUP Enable stratified randomization with one stratum.
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
Then I should see "STEP 1: Define your randomization model"

When I click on the checkbox labeled "A) Use stratified randomization"
Then I should see a dropdown labeled "Choose strata"
And I should see a button labeled "Add another stratum"

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0100: Disable stratified randomization.
Scenario:
When I uncheck a checkbox labeled "Use stratified randomization" 
Then I should NOT see a dropdown labeled "Choose strata"
And I should NOT see a button labeled "Add another stratum"

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0200: Enable stratified randomization with one stratum.
Scenario:
When I click on the checkbox labeled "A) Use stratified randomization"
Then I should see a dropdown labeled "Choose strata"
And I should see a button labeled "Add another stratum"

When I select the dropdown option "strat_var1" for the field labeled "Choose strata" 
And I select the dropdown option "simple_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"
And I should see a dropdown labeled "Choose strata" with option "strat_var1" selected

##VERIFY one stratificiation variable is set up
Scenario:
When I click on the link labeled "Randomization"
Then I should see a "strat_var1" with the "simple_rand" row of the column labeled "Stratification" of the Randomization Summary table

##VERIFY audit trail
Scenario:
When I click on “Logging”
Then I should see a table row containing the following values in the logging table : “test_user1”, “Manage/Design”, “Save randomization model”

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0300: Enable stratified randomization with up to 14 strata (test all 14).
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I click on the checkbox labeled "A) Use stratified randomization"
And I select the dropdown option "strat_var1" for the field labeled "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var2" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var3" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var4" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var5" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var6" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var7" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var8" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var9" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var10" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var11" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var12" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var13" for the field labeled "select a field" under "Choose strata" 
And I click the button labeled "Add another stratum"
And I select the dropdown option "strat_var14" for the field labeled "select a field" under "Choose strata" 
Then I should see a button labeled "Add another stratum"

When I click the button labeled "Add another stratum"
Then I should see a dialog containing the following text: "Sorry, but the maximum number of fields that can be used as randomization criteria is 14"

When I select the dropdown option "complex_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"
And I should see a dropdown labeled "Choose strata" with option "strat_var1" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var2" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var3" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var4" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var5" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var6" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var7" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var8" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var9" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var10" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var11" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var12" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var13" selected
And I should see a dropdown labeled "Choose strata" with option "strat_var14" selected

##VERIFY stratificiation variables are set up
Scenario:
When I click on the link labeled "Randomization"
Then I should see a "strat_var1", "strat_var1", "strat_var3", "strat_var4", "strat_var5", "strat_var6", "strat_var7", "strat_var8", "strat_var9", "strat_var10", "strat_var11", "strat_var12", "strat_var13", "strat_var14" with the "complex_rand" row of the column labeled "Stratification" of the Randomization Summary table

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0400: Randomize by group/site enabled with no option selected results in error
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I click on the checkbox labeled "B) Randomize by group/site?"
And I select the dropdown option "simple_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see a dialog containing the following text: "Please choose one of the grouping options OR uncheck the Randomize By Group checkbox."
And I click "Ok"

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0500: Randomize by group/site enabled with DAG selected.
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I click on the checkbox labeled "B) Randomize by group/site?"
And I click on the radio button option labeled "Use Data Access Groups to designate each group/site (2 groups currently exist)"
And I select the dropdown option "simple_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY Data Access group in Stratification column beside simple_rand
Scenario:
When I click on the link labeled "Randomization"
Then I should see a "Data Access group" with the "simple_rand" row of the column labeled "Stratification" of the Randomization Summary table

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0600: Randomize by group/site enabled with an existing field selected.
Scenario:
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
Scenario:
When I click on the link labeled "Randomization"
Then I should see an "existing_dags" with the "complex_rand" row of the column labeled "Stratification" of the Randomization Summary table

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0700: Choose open randomization dropdown field.
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I select the dropdown option "simple_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY 
Scenario:
When I click on the link labeled "Randomization"
Then I should see a "simple_rand" row of the column labeled "Target" of the Randomization Summary table

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0800: Choose open randomization radio field.
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I select the dropdown option "complex_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY 
Scenario:
When I click on the link labeled "Randomization"
Then I should see a "complex_rand" row of the column labeled "Target" of the Randomization Summary table

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
And I select "will_survey" on the dropdown field labeled "-select a field-"
And I click a button labeled "Save randomization model" and accept the confirmation window

#VERIFY Success - Save randomization model.
Scenario:
Then I should see a dialog containing " Success! The randomization model has been saved!"
And I click on link labeled "Randomization"
Then I should see a "will_survey" within the "5" row of the column labeled "Target" 


C.3.30.0700.1100: Erase randomization model.
Scenario:
When I click on the icon labeled "Setup" in the row labeled "5"
And I click on the link labeled "Erase randomization model" and deny the confirmation window
Then I should NOT see a dialog containing "Success! Your randomization setup and all allocations have now been erased."
And I click on the link labeled "Erase randomization model" and accept the confirmation window

#VERIFY Sucess - Radnomization model erased
Scenario:
Then I should see a dialog containing "Success! Your randomization setup and all allocations have now been erased."
And I click on link labeled "Randomization"
Then I should NOT see a "will_survey" within the "5" row of the column labeled "Target" 

#VERIFY Logging - Save randomization model.
Scenario:
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | Test_User1 | Manage/Design | Save Randomization Model |
  | Test_User1 | Manage/Design | Erase randomization model and allocations |

