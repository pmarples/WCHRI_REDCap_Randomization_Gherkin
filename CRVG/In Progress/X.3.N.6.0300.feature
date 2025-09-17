#X.3.N.6.0300 The system shall support the ability to use conditional logic to disable specific data entry forms in repeating events (does not apply to repeating instruments)

Scenario:#SETUP - Create new project
Given I login to REDCap with the user "Test_User1"
And I create a new project named "X.3.N.6.0300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "X.3.N.6.0300.xml", and clicking the "Create Project" button


#X.3.N.6.0300.0100 form displays when form in repeating event is configured to show
#X.3.N.6.0300.0200 form disabled when form in repeating event should be disabled.
