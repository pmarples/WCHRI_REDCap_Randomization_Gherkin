#Question
#In the Community, https://redcap.vumc.org/community/post.php?id=243308, 1400 has the same .0100 Scenario as 1300 
#which I think is a mistake... Is there an updated Functional requirement list I can refer to?

Feature: C.3.30.1400.	User Interface: The system shall support single randomization per model and multiple randomizations per record.
# Randomization C.3.30.1400.0100

As a REDCap end user
I want to see that Randomization is functioning as expected

#SETUP - Create new project
Scenario:
Given I login to REDCap with the user "Test_User1"
And I create a new project named "C.3.30.1400" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "C.3.30.Rand.xml", and clicking the "Create Project" button

#C.3.30.1400.0100. Export data with randomized values is accurate to allocation table
