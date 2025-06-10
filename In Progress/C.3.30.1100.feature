Feature: C.3.30.1100.	User Interface: The system shall ensure users with Randomize rights can execute record randomization.
# Randomization 
#C.3.30.1100.0100. User without randomize rights cannot randomize record.  
#C.3.30.1100.0200. User with randomize rights can randomize record.  
#C.3.30.1100.0300. Record's randomized value matches allocation table.  (Also tested in C.3.30.1000 as part of proving sequential assignment)
#C.3.30.1100.0400 User with randomize rights cannot modify randomized record.

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.OneRand.xml", and clicking the "Create Project" button

#C.3.30.1100.0100. User without randomize rights cannot randomize record.  
#C.3.30.1100.0200. User with randomize rights can randomize record.  
#C.3.30.1100.0300. Record's randomized value matches allocation table.  (Also tested in C.3.30.1000 as part of proving sequential assignment)
#C.3.30.1100.0400 User with randomize rights cannot modify randomized record.
