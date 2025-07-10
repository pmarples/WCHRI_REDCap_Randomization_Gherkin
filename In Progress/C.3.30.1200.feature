Feature: C.3.30.1200.	User Interface: The system shall support an audit trail showing who randomized the record and the date-time of randomization.
# Randomization 
#C.3.30.1200.0100. Logging of record's randomization includes user and timestamp.  
#C.3.30.1200.0200 – Logging includes the target field allocation value.
#C.3.30.1200.0300 – Allocation group is visible in logging for open models.
#C.3.30.1200.0400 – Concealed allocation group remains hidden in logging for blinded models.

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.OpenBlind.xml", and clicking the "Create Project" button

#SETUP User Rights
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test_User1" 
And I click on the button labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "select role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User1" has been successfully ASSIGNED to the user role "1_FullRights"."

#SETUP randomization 
Scenario:
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the icon labeled "Setup" in the row labeled "1"
And I upload a "csv" format file located at "AlloRand blind1.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I click on the link labeled "Summary"
And I click on the icon labeled "Setup" in the row labeled "2"
And I upload a "csv" format file located at "AlloRand open1.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file

Scenario: #C.3.30.1200.0100. Logging of record's randomization includes user and timestamp.  
Given I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on the first button labeled "Randomize"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "6" was randomized for the field "Randomization group" and assigned the value "Drug A" (1)." 
And I click on the button labeled "Close"
And I click on the button labeled "Randomize"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "6" was randomized for the field "Blinded randomization" and assigned the value "1"."
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

#VERIFY: Logging of record's randomization includes user and timestamp.  
When I click on the link labeled "Logging"
Then I should see a table header and rows containing the following values in the logging table:
   |Time / Date| Username   | Action        | List of Data Changes OR Fields Exported      |
   | MM-DD-YYYY HH:MM | Test_User1 | Randomize record 6 | Randomize record |
   
Scenario: #C.3.30.1200.0200 – Logging includes the target field allocation value.
#VERIFY: Logging includes the target field allocation value. 
And I should see a table header and rows containing the following values in the logging table:
   |Time / Date| Username   | Action        | List of Data Changes OR Fields Exported      |
   | MM-DD-YYYY HH:MM | Test_User1 | Randomize record 6 | Randomize record |
   | MM-DD-YYYY HH:MM | Test_User1 | Create record 6 | record_id = '6',
                                                          rand_group = '1',
                                                          gender = '0',
                                                          randomization_complete = '0' |
And I should see a table header and rows containing the following values in the logging table:
   |Time / Date| Username   | Action        | List of Data Changes OR Fields Exported      |
   | MM-DD-YYYY HH:MM | Test_User1 | Randomize record 6 | Randomize record | 
   | MM-DD-YYYY HH:MM | Test_User1 | Update record 6 | rand_blind = '1' |

# Note for Automation: In the above tables, I'm not sure if you need to look for all that I put... 
#What I need to verify is that "Randomize record" appears 2x and that one time is associated with rand_blind = '1' 
# and one is associated with rand_group = '1' and that I can see rand_blind = '1' and rand_group = '1'

 #C.3.30.1200.0300 – Allocation group is visible in logging for open models.
# This feature test is REDUNDANT and can be viewed in C.3.30.1200.0200 where "rand_group = '1'"

Scenario: # C.3.30.1200.0400 – Concealed allocation group remains hidden in logging for blinded models.
#VERIFY: Concealed allocation group remains hidden in logging for blinded models.
And I should NOT see a table header and rows containing the following values in the logging table:
   |Time / Date| Username   | Action        | List of Data Changes OR Fields Exported      |
   | MM-DD-YYYY HH:MM | Test_User1 | Randomize record 6 | anything that says "Group A" |
# Note for Automation: - in the above table I only care about "Group A", which is the concealed 
# allocation assigned to rand_blind ='1', so if you don't need the whole thing, then you can leave the rest out.

Given I logout
#End


