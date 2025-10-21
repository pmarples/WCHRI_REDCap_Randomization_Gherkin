#X.3.N.6.0300 The system shall support the ability to use conditional logic to disable specific data entry forms in repeating events (does not apply to repeating instruments)

Scenario:#SETUP - Create new project
Given I login to REDCap with the user "Test_User1"
And I create a new project named "X.3.N.6.0300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "X.3.N.6.0300.xml", and clicking the "Create Project" button

#X.3.N.6.0300.0100 form displays/hides when form in repeating event is configured for form display logic and the condition is outside the repeating event.
#X.3.N.6.0300.0200 form displays/hides when form in repeating event is configured for form display logic and the condition is inside the repeating event.

#Scenario:#SETUP - Create new project
Given I login to REDCap with the user "Test_User1"
And I click on the link labeled "+New Project"
And I enter "X.3.N.6.0300 Form Display Logic" into the project title field
And I select "Other" for "Project's purpose"
And I enter "Validation" into the "Please specify" field
And I select "Upload a REDCap project XML file" 
And I click on the button labeled "Choose File" 
And I select the file titled " X3N60300FormDisplay.REDCap.xml"
And I click the button labeled "Open" And I click on the button labeled "Create Project"
Then I should see a new project created titled "X.3.N.6.0300 Form Display Logic" in the project dashboard.

Scenario: #SETUP Confirm all instruments are enabled
Given I click on the link labeled “Record Status Dashboard” 
#VERIFY: The grey status icons for all instruments are enabled (not greyed out)

Scenario: #SETUP: Confirm all instruments are enabled in a repeated event
Given I click on the link labeled “Medication Log”  for the event labeled " Daily Data Week 1" in the row labeled "1"
And I click the button labeled "Save & Exit Form"
#Then I should see the Record Home Page for New Participant ID 1
And I click the button labeled "Add new" near "Daily Data Week 1"
#VERIFY: The grey status icons for all instruments are enabled (not greyed out) in the new repeat of the event.

Scenario: #X.3.N.6.0300.0100 form displays/hides when form in repeating event is configured for form display logic and the condition is outside the repeating event.
#SETUP- Configure form display logic to enable form(s)
Given I click on the link labeled “Designer” 
And I click on the button labeled “Form Display Logic”
And I click on the link labeled “Edit Form Display Logic”
Then I should see the Form Display Logic Editor

Given I click on “Medication Log (Daily Data Week 1)” under “Keep the following forms enabled” for Condition 1
And I click on the field labeled “...when the logic below is TRUE”
And I enter: [initial_data_arm_1][meds]='1', into the Logic Editor
And I click on the button labeled “Update and Close Editor”
And I Click the button labeled "Add another condition"
And I click on “Medication Log (Daily Data Week 2)” under “Keep the following forms enabled” for Condition 2
And I click on the text field under “..when the logic below is TRUE”
And I enter: [initial_data_arm_1][meds]='0', into the Logic Editor
And I click on the button labeled “Update and Close Editor”
And I click on the button labeled “Save” on the Form Display Editor
Then I should see a dialogue box with the message “Your form display logic settings have been successfully saved”.

Scenario: #Verify that forms are enabled/disabled when conditions are met/not met
Given I click on the link labeled “1" in the first row of the table
Then I should see the Record Home Page for "New Participant"
#VERIFY: the status icons for the Medication Log instrument for Daily Data Week 1 are active (not greyed out) and the status icon for the Medication Log instrument for Daily Data Week 2 are greyed out.

Scenario: #Verify that forms are enabled/disabled when conditions are met/not met for the repeated event
Given I click on the link labeled “Daily Data Week 1" in the row labeled "Participant Morale questionnaire"
And I click on the button labeled "Save & Exit Form”
And I click on the link labeled “Daily Data Week 2" in the row labeled "Participant Morale questionnaire"
And I click on the button labeled "Save & Exit Form”
And I click on the button labeled "+Add new" near "Daily Data Week 1"
And I click on the button labeled "+Add new" near "Daily Data Week 2"

#VERIFY: the status icons for the Medication Log instrument for the repeated events for Daily Data Week 1 are active (not greyed out) and the status icon for the Medication Log instrument for Daily Data Week 2 are greyed out.

Scenario: #X.3.N.6.0300.0200 form displays/hides when form in repeating event is configured for form display logic and the condition is inside the repeating event.

#SETUP form display logic for condition inside the repeating event
Given I click on the link labeled "Designer" 
And I click on the button labeled "Form Display Logic" 
And I click on the link labeled "Edit form Display Logic"
And I click on the "x" near "Condition 1"
And I click on the "x" near "Condition 2"
And I click on the button labeled "+ Add another condition"
And I select "Participant Morale Questionnaire [All Events]" in the field labeled "Keep the following forms enabled"
And I enter " [medadd]='0' "
And I click the button labeled "Update & Close Editor"
And I click the button labeled "Save"
Then I should see “Your form display logic settings have been successfully saved”.

#Check that the Participant Morale questionnaires are hidden before the conditional data is entered.
Given I click on the link labeled “Record Status Dashboard” 
And I click on the link labeled "3"
#VERIFY: 
Then I should see that the Participant Morale Questionnaire is hidden for all events.
And I click on the button labeled "Save & Exit Form"
Then I should see that the Participant Morale questionnaire is enabled for Daily Data Week 1
And I should see that the Participant Morale questionnaire is disabled for Daily Data Week 2

#Check that the forms/ show / hide in the repeat instance


Given I click on the button labeled "+Add new" near "Daily Data Week 1"
And I click on the button labeled (New) in the row labeled "Medication Log"
And I select the radio "Yes" for the field "Are there any Medications to add?"
And I click on the button labeled "Save & Exit Form"
Then I should see that the Participant Morale questionnaire is disabled (greyed out) for Daily Data Week 1 (#2)

Given I click on the button labeled "Daily Data Week 2" in the row labeled "Medication Log" 
And I Click the button labeled "Save & Exit Form"
Then I should see that the Participant Morale questionnaire is disabled (greyed out) for Daily Data Week 2 

Given I click on the button labeled "+Add new" near "Daily Data Week 2" 
And I click on the button labeled (New) in the row labeled "Medication Log"
And I select the radio "No" for the field "Are there any Medications to add?"
And I click on the button labeled "Save & Exit Form"
Then I should see that the Participant Morale questionnaire is enabled for Daily Data Week 2 (#2)

Given I logout
#END
