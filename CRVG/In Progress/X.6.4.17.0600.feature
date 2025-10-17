Feature: X.6.4.17.0600 The system shall support the ability for the Administrator to  change the  time between project deletion and purging the project from the system.
#Project Status and Other Functionality
#Scenarios in this document:
#X.6.4.17.0600.0100 time between project deletion and purging can be changed to 1 day (verify purge after 1 day)

##NOTE##
## Not knowing the correct Gherkin Syntax, I've denoted the lines I think are wrong and I made up "English" with '#EN#' 
##annotations so they are easier to find when someone goes through to correct the Gherkin
## The English lines with a single "#" annotation are meant to stay in the Gherkin script as comments.
########

As a REDCap end user
I want to see that Data Quality is functioning as expected

Scenario:#SETUP - Create new project
Given I login to REDCap with the user "Test_User1"
And I create a new project named "X.6.4.17.0600" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "X.6.4.17.0600.xml", and clicking the "Create Project" button

Scenario: #SETUP- Assign rights for primary User 
#Test User 1 to 1_FullRights 
Given I click on the link labeled "User Rights"
And I click on the link labeled "Test_User1" 
And I click on the button labeled "Assign to role"
And I select "1_FullRights" on the dropdown field labeled "select role"
And I click on the button labeled exactly "Assign"
Then I should see "User "Test_User1" has been successfully ASSIGNED to the user role "1_FullRights"."

Given I Logout.

Scenario:#X.6.4.17.0600.0100 time between project deletion and purging can be changed to 1 day (verify purge after 1 day)
#change the time between project deletion and purging from 30 days to 1 day.
Given I login to REDCap with the user "Admin_User"
And I click on the link labeled "Control Center"
And I click on the link labeled "General Configuration"
And I enter "1" in the field labeled "Number of days between project deletion and purging the project from the system
And I click "Save Changes"
Then I should see "Your system configuration values have now been changed!"

Given I Logout.

Scenario: #Delete project
Given I login to REDCap with the user "Test_User1"
And I click on the project link labeled "X.6.4.17.0600"
And I click on the link labeled "Project Home" 
And I click on the link labeled "Other Functionality"
And I click on the link labeled "Delete the Project"
And I enter "delete" in the field labeled "TYPE "DELETE" BELOW"
And I click the button labeled "Delete the project"
And I click the button labeled "CONFIRM DELETION"
Then I should see "Project successfully deleted!"
And I click the button labeled "Close"
Given I Logout

Scenario: #check that the project is scheduled for deletion in 1 day
Given I login to REDCap with the user "Admin_User"
And I click on the link labeled "Control Center"
And I click on the link labeled "Browse Projects"
And I enter "X.6.4.17.0600" into the field labeled "Search project title by keyworkd(s):"
And I click the button labeled "Search project title"
Then I should see "X.6.4.17.0600" 
And I should see "Will be permanently deleted on" #EN# with a date 24 hours from when the project was deleted.

Given I logout

#EN# And I wait until after the time specified

#VERIFY: Project purged after time specified
Given I login to REDCap with the user "Admin_User"
And I click on the link labeled "Control Center"
And I click on the link labeled "Browse Projects"
And I enter "X.6.4.17.0600" into the field labeled "Search project title by keyworkd(s):"
And I click the button labeled "Search project title"
Then I should NOT see "X.6.4.17.0600" 

Given I logout

#End
