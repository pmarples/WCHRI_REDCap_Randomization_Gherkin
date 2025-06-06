Feature: A.3.30.0100 Control Center: The system shall support enabling or disabling the Randomization module system-wide.
#Scenario: A.3.30.0100.0100   Enabled at system level allows randomization module option at the project level.
#Scenario: A.3.30.0100.0200   Disabled at system level removes randomization module option at the project level.

As a REDCap end user
I want to see that Randomization is functioning as expected

Scenario: #SETUP
Given I login to REDCap with the user "Test_Admin"
And I create a new project named "A.3.30.0100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Amanda_randomization.xml", and clicking the "Create Project" button
When I click on the link labeled "My Projects"
And I click on the link labeled " A.3.30.0100"

Scenario: #FUNCTIONAL_REQUIREMENT A.3.30.0100.0200 Control Center: The system shall support enabling or disabling the Randomization module system-wide. Disabled at system level removes randomization module option at the project level.
##ACTION: Disable Randomization Module
When I click on the link labeled "Control Center"
And I click on the link labeled "Modules/Services Configuration"
Then I should see "Settings pertaining to the External Module Framework"
When I select "Disabled" on the dropdown field labeled "Randomization"
And I click on the button labeled "Save Changes"

##VERIFY Randomization Module Disabled
Then I should see "Your system configuration values have now been changed!"
When I click on the link labeled "My Projects"
And I click on the link labeled "A.3.30.0100"
When I click on the link labeled "Project Setup"
Then I verify I cannot see “Randomization module”

Scenario: #FUNCTIONAL_REQUIREMENT A.3.30.0100.0100 Control Center: The system shall support enabling or disabling the Randomization module system-wide. Enabled at system level allows randomization module option at the project level.
##ACTION: Enable Randomization Module 
When I click on the link labeled "Control Center"
 And I click on the link labeled "Modules/Services Configuration"
Then I should see "Settings pertaining to the External Module Framework"
When I select "Enabled" on the dropdown field labeled "Randomization"
And I click on the button labeled "Save Changes"

##VERIFY Randomization Module Enabled
Then I should see "Your system configuration values have now been changed!"
When I click on the link labeled "My Projects"
 And I click on the link labeled "A.3.30.0100"
When I click on the link labeled "Project Setup"
Then I can see “Randomization module”
And I log out
