Feature: C.3.30.1400 – User Interface: The system shall support single randomization per model and multiple randomizations per record.
# Randomization
C.3.30.1400.0100. A record can be randomized across distinct models (e.g., Model A, Model B).
C.3.30.1400.0200. The system shall prevent a record from being randomized more than once within the same model.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1400" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

#C.3.30.1400.0100. A record can be randomized across distinct models (e.g., Model A, Model B).
# This means: A record can be randomized more than once, but each randomization must come from a different model (e.g., Model A for Intervention Arm, Model B for Drug Dosage).


#C.3.30.1400.0200. The system shall prevent a record from being randomized more than once within the same model.
# This means: The system must prevent re-randomizing a record to the same model once it's been randomized.
