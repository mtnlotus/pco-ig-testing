
Instance: test01Patient
InstanceOf: USCorePatientProfile
Title: "Test 01" 
Description: "Goal Identification: NO. Not a PCO Goal."
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda1db5"
* name.family = "Lopez"
* name.given[0] = "Camila"
* gender = #female
* birthDate = "1955-07-16"

Instance: test01GoalPainLevelExample
InstanceOf: PCOGoalProfile
Title: "Test 01 Not a PCO goal"
Usage: #example
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* subject = Reference(test01Patient)
* expressedBy = Reference(pcoPractitionerAnderson)
* startDate = "2024-02-15"
* target.dueDate = "2024-06-30"
* description.text = "Maintain pain level below 5 while walking"
