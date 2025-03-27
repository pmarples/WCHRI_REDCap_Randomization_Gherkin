Feature: C.3.30.1500.	User Interface: The system shall support blinded and open randomization models, with access to allocation details based on user permissions and model setup.
# Randomization C.3.30.1500.0100 to C.3.30.1500.0400

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1500" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

#C.3.30.1500.0100. For a blinded model, users without setup rights will see only a concealed allocation code in the record and reports, with no visible group assignment.  
#C.3.30.1500.0200. For an open model, users without setup rights can view the assigned group allocation directly in the record and reports.  
#C.3.30.1500.0300. All users with export rights can export randomized records, seeing the allocation assigned to each record as displayed in the record view.  
#C.3.30.1500.0400. Only users with setup rights or admin privileges can access and export the full allocation table directly from the setup interface, regardless of model type.
