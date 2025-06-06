Feature: C.3.30.0700 User Interface: The system shall ensure users with Randomization Setup can create and modify randomization models while in project development mode. 
# A: Stratified Randomization C.3.30.0700.0100 to C.3.30.0700.1900
#C.3.30.0700.0100. Disable stratified randomization.    
#C.3.30.0700.0200. Enable stratified randomization with one stratum.    
#C.3.30.0700.0300. Enable stratified randomization with up to 14 strata (test all 14).    
#C.3.30.0700.0400. Randomize by group/site enabled with no option selected.    
#C.3.30.0700.0500. Randomize by group/site enabled with DAG selected.    
#C.3.30.0700.0600. Randomize by group/site enabled with an existing field selected.    
#C.3.30.0700.0700. Choose open randomization dropdown field.    
#C.3.30.0700.0800. Choose open randomization radio field.    
#C.3.30.0700.0900. Choose concealed randomization text field.    
#C.3.30.0700.1000. Save randomization model.    
#C.3.30.0700.1100. Erase randomization model.    
#C.3.30.0700.1200. Download example allocation tables (Excel/CSV).    
#C.3.30.0700.1300. User with Randomization Setup uploads a unique allocation table in DEVELOPMENT status (system prevents duplicate uploads).   
#C.3.30.0700.1400. User with Randomization Setup downloads the allocation table previously uploaded in DEVELOPMENT.  
#C.3.30.0700.1500. User with Randomization Setup deletes the allocation table previously uploaded in DEVELOPMENT.  
#C.3.30.0700.1600. User with Randomization Setup uploads a unique allocation table in PRODUCTION status (system prevents duplicate uploads).  
#C.3.30.0700.1700. User with Randomization Setup downloads the allocation table previously uploaded in PRODUCTION.  
#C.3.30.0700.1800. Admin deletes the allocation table previously uploaded in PRODUCTION.  
#C.3.30.0700.1900. Admin uploads an additional allocation table in PRODUCTION status.


As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP project with randomization enabled - "C.3.30.AllRandNoneSetup.xml"
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.0700" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.AllRandNoneSetup.xml", and clicking the "Create Project" button

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
And I select the dropdown option "strat_rand1" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"
And I should see a dropdown labeled "Choose strata" with option "strat_var1" selected

#VERIFY one stratification variable is set up
Scenario:
When I click on the link labeled "Randomization"
Then I should see a "strat_var1" with the "strat_rand1" row of the column labeled "Stratification" of the Randomization Summary table

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

When I select the dropdown option "strat_rand2" for the field labeled "Choose your randomization field" 
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

##VERIFY stratification variables are set up
Scenario:
When I click on the link labeled "Randomization"
Then I should see a "strat_var1", "strat_var1", "strat_var3", "strat_var4", "strat_var5", "strat_var6", "strat_var7", "strat_var8", "strat_var9", "strat_var10", "strat_var11", "strat_var12", "strat_var13", "strat_var14" with the "strat_rand2" row of the column labeled "Stratification" of the Randomization Summary table

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0400: Randomize by group/site enabled with no option selected results in error
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I click on the checkbox labeled "B) Randomize by group/site?"
#Then I should see Radio button with options: 
#-Use Data Access Groups to designate each group/site
#-Use an exiting field to designate each group/site
#-select a field drop down.

When I select the dropdown option "dag_rand" for the field labeled "Choose your randomization field" 
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
And I select the dropdown option "dag_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY Data Access group in Stratification column beside dag_rand
Scenario:
When I click on the link labeled "Randomization"
Then I should see a "Data Access group" with the "dag_rand" row of the column labeled "Stratification" of the Randomization Summary table

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0600: Randomize by group/site enabled with an existing field selected.
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I click on the checkbox labeled "B) Randomize by group/site?"
And I click on the radio button option labeled "Use an existing field to designate each group/site"
And I select the dropdown option "existing_dags" for the field labeled "Use an existing field to designate each group/site"
And I select the dropdown option "dagfield_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY existing_dags in Stratification column beside dagfield_rand
Scenario:
When I click on the link labeled "Randomization"
Then I should see an "existing_dags" with the "dagfield_rand" row of the column labeled "Stratification" of the Randomization Summary table

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0700: Choose open randomization dropdown field.
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I select the dropdown option "drop_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY 
Scenario:
When I click on the link labeled "Randomization"
Then I should see a "drop_rand" row of the column labeled "Target" of the Randomization Summary table

#VERIFY - Logging
Scenario:
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | Test_User1 | Manage/Design | Save randomization model |
  | Test_User1 | Manage/Design | Save randomization model |
  | Test_User1 | Manage/Design | Save randomization model |
  | Test_User1 | Manage/Design | Save randomization model |
  | Test_User1 | Manage/Design | Save randomization model |

#FUNCTIONAL_REQUIREMENT C.3.30.0700.0800: Choose open randomization radio field.
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the button labeled "Add new randomization model"
And I select the dropdown option "radio_rand" for the field labeled "Choose your randomization field" 
And I click the button "Save randomization model"
Then I should see "Success! The randomization model has been saved!"

##VERIFY 
Scenario:
When I click on the link labeled "Randomization"
Then I should see a "radio_rand" row of the column labeled "Target" of the Randomization Summary table

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

#C.3.30.0700.1100: Erase randomization model.
Scenario:
When I click on the icon labeled "Setup" in the row labeled "8"
And I click on the link labeled "Erase randomization model" and deny the confirmation window
Then I should NOT see a dialog containing "Success! Your randomization setup and all allocations have now been erased."
And I click on the link labeled "Erase randomization model" and accept the confirmation window

#VERIFY Sucess - Randomization model erased
Scenario:
Then I should see a dialog containing "Success! Your randomization setup and all allocations have now been erased."
And I click on link labeled "Randomization"
Then I should NOT see a "rand" within the "8" row of the column labeled "Target" 

#VERIFY - Logging
Scenario:
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | Test_User1 | Manage/Design | Erase Randomization Model and Allocations |
  | Test_User1 | Manage/Design | Save randomization model |
  | Test_User1 | Manage/Design | Save randomization model - blinded |
  | Test_User1 | Manage/Design | Save randomization model |

#C.3.30.0700.1200. Download example allocation tables (Excel/CSV).
Scenario:
When I click on link labeled "Randomization"
And I click on the icon labeled "Setup" in the row labeled "5" #drop_rand
Then I should see a dialog containing "Step 2: Download template allocation tables (as Excel/CSV files)"
And I click on the button labeled "Example #1 (basic)"
#VERIFY - Confirm File Downloaded
Then I should see the downloaded CSV with filename "RandomizationAllocationTemplate.csv"
And I click on the button labeled "Example #2 (all possible combos)"
#VERIFY - Confirm File Downloaded
Then I should see the downloaded CSV with filename "RandomizationAllocationTemplate (1).csv"
And I click on the button labeled "Example #3 (5x all possible combos)"
#VERIFY - Confirm File Downloaded
Then I should see the downloaded CSV with filename "RandomizationAllocationTemplate (2).csv"

#C.3.30.0700.1300. User with Randomization Setup uploads a unique allocation table in DEVELOPMENT status (system prevents duplicate uploads).
Scenario:
When I click on link labeled "Randomization"
And I click on the icon labeled "Setup" in the row labeled "5" #drop_rand
Then I should see a dialog containing "STEP 3: Upload your allocation table (CSV file)"
And I upload a "csv" format file located at "RandomizationAllocationTemplate.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
#File Downloaded for Example #1 "RandomizationAllocationTemplate.csv"

#VERIFY - Confirm File Upload (ensure no button to duplicate uploads)
Scenario:
Then I should see a dialog "Already Uploaded" near "Upload allocation table (CSV file) for use in DEVELOPMENT status"
And I should Not see a button labeled "Upload File" near "Upload allocation table (CSV file) for use in DEVELOPMENT status"

#C.3.30.0700.1400. User with Randomization Setup downloads the allocation table previously uploaded in DEVELOPMENT.
Scenario:
When I click on the button labeled "Download Table" near "Upload allocation table (CSV file) for use in DEVELOPMENT status"
#VERIFY - Confirm File Downloaded
Then I should see the downloaded CSV with filename "RandomizationAllocationTemplate_Dev.csv"

#C.3.30.0700.1500. User with Randomization Setup deletes the allocation table previously uploaded in DEVELOPMENT.
Scenario:
When I click on the link labeled "Delete allocation table?" near "Upload allocation table (CSV file) for use in DEVELOPMENT status" and deny the confirmation window
Then I should see a dialog "Already Uploaded" near "Upload allocation table (CSV file) for use in DEVELOPMENT status"
And I click on the link labeled "Delete allocation table?" near "Upload allocation table (CSV file) for use in DEVELOPMENT status" and confirm the confirmation window
#VERIFY - Confirm File Deleted
Then I should see "Success! The allocation table has been deleted." in the dialog box
And I should see a button labeled "Upload File" near "Upload allocation table (CSV file) for use in DEVELOPMENT status"

#C.3.30.0700.1600. User with Randomization Setup uploads a unique allocation table in PRODUCTION status (system prevents duplicate uploads).  
Scenario:
When I click on link labeled "Randomization"
And I click on the icon labeled "Setup" in the row labeled "5" #drop_rand
Then I should see a dialog containing "STEP 3: Upload your allocation table (CSV file)"
And I upload a "csv" format file located at "RandomizationAllocationTemplate.csv", by clicking the button near "Upload allocation table (CSV file) for use in PRODUCTION status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
#File Downloaded in step 252 "RandomizationAllocationTemplate.csv"

#VERIFY - Confirm File Upload (ensure no button to duplicate uploads)
Scenario:
Then I should see a dialog "Already Uploaded" near "Upload allocation table (CSV file) for use in PRODUCTION status"
And I should Not see a button labeled "Upload File" near "Upload allocation table (CSV file) for use in PRODUCTION status"

#C.3.30.0700.1700. User with Randomization Setup downloads the allocation table previously uploaded in PRODUCTION.  
Scenario:
When I click on the button labeled "Download Table" near "Upload allocation table (CSV file) for use in PRODUCTION status"
#VERIFY - Confirm File Downloaded
Then I should see the downloaded CSV with filename "RandomizationAllocationTemplate_Prod.csv"

#C.3.30.0700.1800. Admin deletes the allocation table previously uploaded in PRODUCTION.  
Scenario:
When I click on the link labeled "Delete allocation table?" near "Upload allocation table (CSV file) for use in PRODUCTION status" and deny the confirmation window
Then I should see a dialog "Already Uploaded" near "Upload allocation table (CSV file) for use in PRODUCTION status"
And I click on the link labeled "Delete allocation table?" near "Upload allocation table (CSV file) for use in PRODUCTION status" and confirm the confirmation window
#VERIFY - Confirm File Deleted
Then I should see "Success! The allocation table has been deleted." in the dialog box
And I should see a button labeled "Upload File" near "Upload allocation table (CSV file) for use in PRODUCTION status"

#C.3.30.0700.1900. Admin uploads an additional allocation table in PRODUCTION status. - No Button to upload "additional" allocation table without uploading first allocation table again and moving to production. 
#Could repeat C.3.30.0700.1600 again if that's what was meant?  Or if this means that we need to upload one and then move the project to production and upload another one then 
#we could do that, but that is also repeated at step C.3.30.0900.0600.

#VERIFY - Logging
Scenario:
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
  | Username   | Action        | List of Data Changes OR Fields Exported      |
  | Test_User1 | Manage/Design | Delete randomization allocation table (production) |
  | Test_User1 | Manage/Design | Download randomization allocation table (production) |
  | Test_User1 | Manage/Design | Upload randomization allocation table - production |
  | Test_User1 | Manage/Design | Delete randomization allocation table (development) |
  | Test_User1 | Manage/Design | Download randomization allocation table (development) |
  | Test_User1 | Manage/Design | Upload randomization allocation table - development |
  | Test_User1 | Manage/Design | Download randomization allocation template |
  | Test_User1 | Manage/Design | Download randomization allocation template |
  | Test_User1 | Manage/Design | Download randomization allocation template |

And I logout
#END

