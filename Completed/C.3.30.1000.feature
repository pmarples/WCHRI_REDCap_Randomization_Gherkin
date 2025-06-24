Feature: C.3.30.1000. User Interface: The system shall support the sequential assignment of allocation table entries to participants based on stratification.
# C.3.30.1000.0100: The system shall allocate an entry for a record with specified stratification values following the order in which the entries for the stratum were uploaded into the allocation table.
# C.3.30.1000.0200: The system shall assign the next available allocation entry sequentially to each new record.
# C.3.30.1000.0300: The system shall reject allocation tables missing required structural elements (e.g., target field column, inconsistent stratum combinations).

As a REDCap end user
I want to see that Randomization is functioning as expected

Scenario: #SETUP - Create new project
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1000" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.SeqRand.REDCap", and clicking the "Create Project" button

#SETUP User Rights
Scenario: #SETUP- Give User 1 full rights
When I click on the link labeled "User Rights"
And I click on the link labeled "Test_User1" 
And I click on the button labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "select role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User1" has been successfully ASSIGNED to the user role "1_FullRights"."

Scenario: # C.3.30.1000.0300: The system shall reject allocation tables missing required structural elements (e.g., target field column, inconsistent stratum combinations).
# Test: Upload malformed CSV (e.g., missing redcap_randomization_group). Confirm that REDCap rejects the file with a descriptive error.
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the icon labeled "Setup" in the row labeled "2"
And I upload a "csv" format file located at "AlloRand malformed.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file

#Verify: The system rejects allocation tables missing required structural elements.
Then I should see "ERROR: The following errors occurred. Please address them and try again."
And I should see "The header variables in the first row of your CSV file are not correct."

#Test: Upload malformed CSV (e.g.inconsistent stratum combinations)
When I click on the button labeled "Return to previous page"
And I upload a "csv" format file located at "AlloRand malformed2.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file

#Verify: The system rejects allocation tables with inconsistent stratum combinations
Then I should see "ERROR: The following errors occurred. Please address them and try again."
And I should see ""3" is not a valid categorical option for the field "gender""

Scenario: # C.3.30.1000.0100: The system shall preserve the order of allocation entries within each stratification group as uploaded, and use that order for assignment.
#Test: Upload an allocation table with shuffled or non-numeric redcap_randomization_number values. Validate that runtime assignment follows row upload order.
#Setup Rand_group randomization with shuffled values.
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the icon labeled "Setup" in the row labeled "1"
And I upload a "csv" format file located at "AlloRand rand_groupshuffle.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
Then I should see "Success"

##Verify records randomized from same gender (stratification group) are assigned to the expected allocation - the first man should be in Placebo and the second man should be Drug A
When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Randomization Group"
And I select "Man" on the radio field labeled "Do you describe yourself as a man, a woman, or in some other way?"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "6" was randomized for the field "Randomization group" and assigned the value "Placebo" (3)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Randomization Group"
And I select "Man" on the radio field labeled "Do you describe yourself as a man, a woman, or in some other way?"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "7" was randomized for the field "Randomization group" and assigned the value "Drug A" (1)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

#Verify records allocated to a different stratification group are not assigned simple the next code in the list, but instead assigned the next code for their stratification group.  The next record in the Other group should be assigned to Group A and not to Group B.
When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Randomization Group"
And I select "Other" on the radio field labeled "Do you describe yourself as a man, a woman, or in some other way?"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "8" was randomized for the field "Randomization group" and assigned the value "Drug A" (1)." 
And I should NOT see a dialog containing the following text: "Record ID "8" was randomized for the field "Randomization group" and assigned the value "Drug B" (2)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

Scenario: # C.3.30.1000.0200: The system shall assign the next available allocation entry sequentially to each new record.
# Test: Upload a table with duplicate values or text labels in redcap_randomization_number. Confirm that upload succeeds and assignments function correctly.
#Setup automatic randomization with duplicat, non numerical values.
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the icon labeled "Setup" in the row labeled "2"
And I upload a "csv" format file located at "AlloRand auto_randtextduplicate.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
Then I should see "Success"

#Verify records randomized from same gender (stratification group) are assigned to the expected allocation (next sequential allocation for that strat group) - the first man should be in Group 1 (A) and the second man should also be in Group 1 (A)
When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Automatic Randomization"
And I select "Man" on the radio field labeled "Do you describe yourself as a man, a woman, or in some other way?"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "9" was randomized for the field "Automatic Randomization" and assigned the value "Group 1" (A)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Automatic Randomization"
And I select "Man" on the radio field labeled "Do you describe yourself as a man, a woman, or in some other way?"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "10" was randomized for the field "Automatic Randomization" and assigned the value "Group 1" (A)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

And I logout
#End
