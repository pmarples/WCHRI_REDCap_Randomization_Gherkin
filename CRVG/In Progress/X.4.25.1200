Feature: X.4.25.1200 The system shall support assigning users that are both in the record's DAG and assigned to the record's DAG via DAG Switcher to data queries about the record.
#Data Quality 
#Scenarios in this document:
#X.4.25.1200.0100  User in the same DAG as record can be assigned to a query for the record
#X.4.25.1200.0200  User in different DAG as record and no access to other DAGs via the DAG 
#switcher cannot be assigned to a query for the record.
#X.4.25.1200.0300 User in different DAG as record but has access the same DAG as record via 
#the DAG switcher can be assigned to a query for the record.
#X.4.25.1200.0400  User in a different DAG as the record, access to the DAG switcher, but 
#not access to the same DAG as record via the DAG switcher cannot be assigned to a query for the record.

##NOTE##
## Not knowing the correct Gherkin Syntax, I've denoted the lines I think are wrong and I made up "English" with '#EN#' 
##annotations so they are easier to find when someone goes through to correct the Gherkin
## The English lines with a single "#" annotation are meant to stay in the Gherkin script as comments.
########

As a REDCap end user
I want to see that Data Quality is functioning as expected

Scenario:#SETUP - Create new project
Given I login to REDCap with the user "Test_User1"
And I create a new project named "X.4.25.1200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "X.2.25.1200 Simple.xml", and clicking the "Create Project" button

#Scenario: #SETUP- Assign rights for primary User / No DAG
#Test User 1 to 1_FullRights / No DAG Assignment.
Given I click on the link labeled "User Rights"
And I click on the link labeled "Test_User1" 
And I click on the button labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "select role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User1" has been successfully ASSIGNED to the user role "1_FullRights"."

Scenario: #SETUP- Assign rights for user in a DAG / No DAG Switcher
#Test User 2 to Alberta DAG
Given I click on the link labeled "User Rights"
And I click on the link labeled "Test_User2" 
And I click on the button labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "select role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User2" has been successfully ASSIGNED to the user role "1_FullRights"."
When I click on the link labeled "Data Access Groups"
And I select "Test_User2" on the dropdown field labeled "Select User"
And I select "Alberta" on the dropdown field labeled "[No Assignment]"
And I click on the button labeled exactly "Assign"
#EN# Then I should see "Test_User2" in the row labeled "Alberta"

Scenario: #SETUP Assign rights for User in different DAG and another DAG with the DAG Switcher
#TEST User 3 to Ontario and no DAG Switcher
Given I click on the link labeled "User Rights"
And I enter "Test_User3" into the field labeled "Assign new user to role"
And I click on the button labeled "Assign to role"
And I select "2_Edit_FullExport" and click the button labeled "Assign to role"
Then I should see "User "Test_User3" has been successfully ASSIGNED to the user role "2_Edit_FullExport"."
When I click on the link labeled "Data Access Groups"
And I select "Test_User3" on the dropdown field labeled "Select User"
And I select "Ontario" on the dropdown field labeled "[No Assignment]"
And I click on the button labeled exactly "Assign"
#EN# Then I should see "Test_User2" in the row labeled "Ontario"

Scenario: #SETUP- Assign rights for user in a different DAG / DAG Switcher in Same DAG
#Test User 4 to Ontario and DAG Switcher to Alberta
Given I click on the link labeled "User Rights"
And I enter "Test_User4" into the field labeled "Assign new user to role"
And I click on the button labeled "Assign to role"
And I select "2_Edit_FullExport" and click the button labeled "Assign to role"
Then I should see "User "Test_User4" has been successfully ASSIGNED to the user role "2_Edit_FullExport"."
When I click on the link labeled "Data Access Groups"
And I select "Test_User4" on the dropdown field labeled "Select User"
And I select "Ontario" on the dropdown field labeled "[No Assignment]"
And I click on the button labeled exactly "Assign"
#EN# Then I should see "Test_User4" in the row labeled "Ontario"
#EN# When I click on "Alberta" for the user "Test_User4" in the DAG Switcher 
#EN# Then I should see a checkbox in the row labeled "Alberta" in the column labeled "Test_User4" in the DAGs Switcher

Scenario: #SETUP- Assign rights for user in a different DAG and another different DAG with DAG Switcher
#Test User 5 to Ontario and in DAG Switcher:British Columbia
Given I click on the link labeled "User Rights"
And I enter "Test_User5" into the field labeled "Assign new user to role"
And I click on the button labeled "Assign to role"
And I select "2_Edit_FullExport" and click the button labeled "Assign to role"
Then I should see "User "Test_User5" has been successfully ASSIGNED to the user role "2_Edit_FullExport"."
When I click on the link labeled "Data Access Groups"
And I select "Test_User5" on the dropdown field labeled "Select User"
And I select "Ontario" on the dropdown field labeled "[No Assignment]"
And I click on the button labeled exactly "Assign"
#EN# Then I should see "Test_User5" in the row labeled "Ontario"
#EN# When I click on "British Columbia" for the user "Test_User5" in the DAG Switcher 
#EN# Then I should see a checkbox in the row labeled "British Columbia" in the column labeled "Test_User5" in the DAGs Switcher

Scenario: #X.4.25.1200.0100  User in the same DAG as record can be assigned to a query for the record
#In Record 1, open query and assign to Test User 2
Given I click on the link labeled "Add/Edit Records"
And I Select "1" from the dropdown labled "Choose an existing Study ID"
And I click on the button labeled "Status" in the Row labeled "Demographics"
#EN# And I click on the bubble labled "View Data Resolution Workflow" near the field labeled "E-mail"
#EN# And I click on the radio button option "Open Query"
#EN# And I select the option "Test_User2" from the field labeled "Assign query to a user (optional):"
#EN# And I enter "Missing" in the field labeled "Comment"
#EN# And I click the button labeled "Open Query"
#EN# Then I should see "Saved"
Given I Logout.

Scenario: #VERIFY: Test User 2 can see the query
Given I login to REDCap with the user "Test_User2"
And I click on the link labeled "Data Quality"
And I click on the link labeled "Resolve Issues"
Then I should see a table header and rows containing the following values in a table:
  | Data Quality rule and/or Field   | User Assigned       |
  | Field: email                     | Test_User2          | 
When I click on the button labeld "comment"
#EN# Then I see a popup labeled "Data Resolution Workflow"
When I click on the button labeled "Cancel"

Given I logout

Scenario: #X.4.25.1200.0200  User in different DAG as record and no access to other DAGs via the DAG 
#switcher cannot be assigned to a query for the record.
#In Record 1, open query and attempt to assign to Test User 3 
Given I login to REDCap with the user "Test_User1"
And I click on the link labeled "Add/Edit Records"
And I Select "1" from the dropdown labled "Choose an existing Study ID"
And I click on the button labeled "Status" in the Row labeled "Demographics"
#EN# And I click on the bubble labled "View Data Resolution Workflow" near the field labeled "Comments"
#EN# And I click on the radio button option "Open Query"
#VERIFY: Unable to assign query to Test User 3
#EN# Then I DO NOT see the option "Test_User3" in the field labeled "Assign query to a user (optional):"
And I click on the button labeled "Cancel"

Given I Logout.

#X.4.25.1200.0300 User in diferent DAG as record but has access the same DAG as record via 
#the DAG switcher can be assigned to a query for the record.
#In Record 1, open query and assign to Test User 4

Given I login to REDCap with the user "Test_User1"
And I click on the link labeled "Add/Edit Records"
And I Select "1" from the dropdown labled "Choose an existing Study ID"
And I click on the button labeled "Status" in the Row labeled "Demographics"
#EN# And I click on the bubble labled "View Data Resolution Workflow" near the field labeled "Comments"
#EN# And I click on the radio button option "Open Query"
#EN# And I select the option "Test_User4" from the field labeled "Assign query to a user (optional):"
#EN# And I enter "Missing" in the field labeled "Comment"
#EN# And I click the button labeled "Open Query"
#EN# Then I should see "Saved"
Given I Logout.

Scenario: #VERIFY: Test User 4 can see the query
Given I login to REDCap with the user "Test_User4"
And I click on the link labeled "Data Quality"
And I click on the link labeled "Resolve Issues"
Then I should see a table header and rows containing the following values in a table:
  | Data Quality rule and/or Field   | User Assigned       |
  | Field: subject_comments          | Test_User4          | 
When I click on the button labeled "comment"
#EN# Then I see a popup labeled "Data Resolution Workflow"
When I click on the button labeled "Cancel"

#X.4.25.1200.0400  User in a different DAG as the record, access to the DAG switcher, but 
#not access to the same DAG as record via the DAG switcher cannot be assigned to a query for the record.

#In Record 1, open query and assign to Test User 5
Given I login to REDCap with the user "Test_User1"
And I click on the link labeled "Add/Edit Records"
And I Select "1" from the dropdown labled "Choose an existing Study ID"
And I click on the button labeled "Status" in the Row labeled "Demographics"
#EN# And I click on the bubble labled "View Data Resolution Workflow" near the field labeled "Comments"
#EN# And I click on the radio button option "Open Query"
#VERIFY: Unable to assign query to Test User 5
#EN# Then I DO NOT see the option "Test_User5" in the field labeled "Assign query to a user (optional):"
And I click on the button labeled "Cancel"

Given I logout
#END
