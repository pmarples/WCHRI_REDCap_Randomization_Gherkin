#Question:
#I'm not convinced that #C.3.30.1300.0100. Export data with randomized values is accurate to allocation table is any 
#different from a normal export - we already proved in #C.3.30.1100.0300. Record's randomized value matches allocation 
#table. (Also tested in C.3.30.1000 as part of proving sequential assignment and #C.3.30.1100.0200. User with randomize 
#rights can randomize record. and #C.3.30.1100.0400 User with randomize rights cannot modify randomized record. where the 
#Value saved is checked) - how will testing the export be any different from ensuring that data saved is exported 
#accurately?

#ANSWER:
Thanks for raising this, @pmarples — I agree with your assessment.

The requirement C.3.30.1300.0100 — “Export data with randomized values is accurate to allocation table” — is already covered by previous testing efforts:

C.3.30.1000.0200 verifies that allocation entries are assigned sequentially and correctly from the uploaded table.
C.3.30.1100.0300 confirms that the randomized value saved to the record matches the allocation table.
C.3.30.1100.0400 ensures that once assigned, randomized values cannot be modified by users, preserving data integrity.
Since REDCap exports reflect the values stored in the underlying data table — and do not transform or recalculate them on export — confirming the correct value is saved is functionally equivalent to confirming the export value is correct.

Recommendation:

Mark this feature as redundant in the Redundancy Matrix, referencing coverage from 1000.0200, 1100.0300, and 1100.0400.
########################################################################################################################################

Feature: C.3.30.1300.	User Interface: The system shall support inclusion of randomization values in data export.
# Randomization C.3.30.1300.0100

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

#C.3.30.1300.0100. Export data with randomized values is accurate to allocation table
