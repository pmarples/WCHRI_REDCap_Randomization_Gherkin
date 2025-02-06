Feature: C.3.30.0700 User Interface: The system shall ensure users with Randomization Setup can create and modify randomization models while in project development mode. 
# A: Stratified Randomization C.3.30.0700.0100 to C.3.30.0700.0300

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
And I select the dropdown option "simple_strata_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"
And I should see a dropdown labeled "Choose strata" with option "strat_var1" selected

##VERIFY one stratificiation variable is set up
When I click on the link labeled "Randomization"
Then I should see a "strat_var1" with the "simple_strat_rand" row of the column labeled "Stratification" of the Randomization Summary table

##VERIFY audit trail
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

When I select the dropdown option "complex_strata_rand" for the field labeled "Choose your randomization field" 
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
When I click on the link labeled "Randomization"
Then I should see a "strat_var1", "strat_var1", "strat_var3", "strat_var4", "strat_var5", "strat_var6", "strat_var7", "strat_var8", "strat_var9", "strat_var10", "strat_var11", "strat_var12", "strat_var13", "strat_var14" with the "complex_strat_rand" row of the column labeled "Stratification" of the Randomization Summary table
And I log out
#END
