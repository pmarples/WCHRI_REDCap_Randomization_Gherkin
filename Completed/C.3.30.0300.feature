Feature: C.3.30.0300 User Interface: The system shall allow user rights configuration to create and manage Randomization Setup.
#Scenario: C.3.30.0300.0100. User with Randomization Setup rights can use Randomization Module Setup Configuration page.  
#Scenario: C.3.30.0300.0200. User without Randomization Setup rights cannot use Randomization Module Setup Configuration page.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP project with no randomization enabled - "Project 3.30 norand.xml"
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.0300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project 3.30 norand.xml", and clicking the "Create Project" button

#SETUP Randomization and User Rights (Give User all Rand Rights)
Scenario:
When I click on the link labeled "Project Setup"
And I click on "Enable" in the "Randomization module" row in the "Enable optional modules and customizations" section

When I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Edit User Privileges"
And I check a checkbox labeled "Setup"
And I check a checkbox labeled "Dashboard"
And I check a checkbox labeled "Randomize"
And I save changes within the context of User Rights

#FUNCTIONAL_REQUIREMENT C.3.30.0300.0100. User with Randomization Setup rights can use Randomization Module Setup Configuration page.
Scenario:
When I click on the link labeled "Randomization"
Then I should see a button labeled "Add new randomization module"

##VERIFY User with Randomization Setup rights can use Randomization Module Setup Configuration page.
When I click on a button labeled "Add new randomization model"
#HOW TO EXPLAIN THIS NEXT LINE?
Then I should see a tab labeled "Setup" 
And I should see "STEP 1: Define your randomization model" 

#SETUP User Rights (Takeaway User Rand - Setup Rights)
Scenario: 
When I click on the link labeled "User Rights"
And I click on the link labeled "Test User1"
And I click on the button labeled "Edit User Privileges"
And I uncheck a checkbox labeled "Setup"
And I save changes within the context of User Rights

#FUNCTIONAL_REQUIREMENT C.3.30.0300.0200. User without Randomization Setup rights cannot use Randomization Module Setup Configuration page.
Scenario:
When I click on the link labeled "Randomization"
##VERIFY User without Randomization Setup rights cannot use Randomization Module Setup Configuration page.
Then I NOT should see a button labeled "Add new randomization module"
And I log out
#END






