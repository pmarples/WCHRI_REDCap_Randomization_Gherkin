#Question - Aren't .100 and .200 the same?

Feature: C.3.30.1000.	User Interface: The system shall support the sequential assignment of allocation table entries to participants based on stratification.
# Randomization 
# C.3.30.1000.100: The system shall allocate an entry for a record with specified stratification values following the order in which the entries for the stratum were uploaded into the allocation table.
# C.3.30.1000.200: The system shall assign the next available allocation entry sequentially to each new record.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1000" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.OneRand.xml", and clicking the "Create Project" button
#SETUP User Rights

#SETUP- Give User 1 full rights
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test_User1" 
And I click on the button labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "select role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User1" has been successfully ASSIGNED to the user role "1_FullRights"."

C.3.30.1000.100 – The system shall allocate an entry for a record with specified stratification values following the order in which the entries for the stratum were uploaded into the allocation table.  
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the icon labeled "Setup" in the row labeled "1"
And I upload a "csv" format file located at "AlloRand rand_group nonseq.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
Then I should see (#rejection is expected, but have been unable to determine what file that is non-sequential and rejected looks like)
And I upload a "csv" format file located at "AlloRand rand_group nonseq.csv", by clicking the button near "Upload allocation table (CSV file) for use in PRODUCTION status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
Then I should see (#rejection)

C.3.30.1000.200: The system shall assign the next available allocation entry sequentially to each new record.
Scenario:
When I click on the link labeled "Project Setup"
And I click on the button labeled "Setup randomization"
And I click on the icon labeled "Setup" in the row labeled "1"
And I upload a "csv" format file located at "AlloRand rand_group5.csv", by clicking the button near "Upload allocation table (CSV file) for use in DEVELOPMENT status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I upload a "csv" format file located at "AlloRand rand_group6.csv", by clicking the button near "Upload allocation table (CSV file) for use in PRODUCTION status" to browse for the file, and clicking the button labeled "Upload File" to upload the file
Then I should see "Project status: Development"

#Verify records randomized from same gender (stratification group) are assigned to the expected allocation (next sequential allocation for that strat group) - the first man should be in Drug A and the second man should be Drug B
When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Randomization Group"
And I select "Man" on the radio field labeled "Do you describe yourself as a man, a woman, or in some other way?"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "6" was randomized for the field "Randomization group" and assigned the value "Drug A" (1)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Randomization Group"
And I select "Man" on the radio field labeled "Do you describe yourself as a man, a woman, or in some other way?"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "7" was randomized for the field "Randomization group" and assigned the value "Drug B" (2)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

#Verify records randomized from different genders (stratification groups) are assigned to the expected allocation (next sequential allocation for their strat group) - the first man should be Placebo and the First Woman should be Placebo
When I click on the link labeled "Project Setup"
And I click on the button labeled "Move project to production"
And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
And I click on the button labeled "Ok"
Then I should see Project status: "Production"

When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Randomization Group"
And I select "Man" on the radio field labeled "Do you describe yourself as a man, a woman, or in some other way?"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "8" was randomized for the field "Record ID "8" was randomized for the field "Randomization group" and assigned the value "Placebo" (3)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

When I click on the link labeled "Add/Edit Records"
And I click on the button labeled "Add new record"
And I click on the icon labeled "Status" for the row labeled "Randomization" 
And I click on a button labeled "Randomize" for the field labeled "Randomization Group"
And I select "Woman" on the radio field labeled "Do you describe yourself as a man, a woman, or in some other way?"
And I click on the button labeled "Randomize"
Then I should see a dialog containing the following text: "Record ID "9" was randomized for the field "Randomization group" and assigned the value "Placebo" (3)." 
And I click on the button labeled "Close"
And I click on the button labeled "Save & Exit Form"

And I logout
#End
