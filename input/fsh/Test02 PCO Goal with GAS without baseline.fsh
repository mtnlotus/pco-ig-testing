
Instance: test02Patient
InstanceOf: USCorePatientProfile
Title: "Test 02" 
Description: "Goal Identification: NO. Has a PCO GAS goal, but without a baseline score or care plan."
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda1db5"
* name.family = "Lopez"
* name.given[0] = "Camila"
* gender = #female
* birthDate = "1955-07-16"

Instance: test02GoalWithGAS
InstanceOf: PCOGoalAttainmentScaleProfile
Title: "Test 02 PCO Goal with GAS"
Usage: #example
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category[goal-domain] = PCOGoalDomains#physical-function "Physical Function"
* subject = Reference(test02Patient)
* expressedBy = Reference(test02Patient)
* startDate = "2024-04-03"
* target.dueDate = "2024-09-30"
* description.text = "Walk dog outside once a week"
* extension[gas-scaling][0].extension[level].valueCoding = $LNC#LA6113-0 "2 or more"
* extension[gas-scaling][0].extension[text].valueString = "Walk dog outside three times a week"
* extension[gas-scaling][1].extension[level].valueCoding = $LNC#LA6112-2 "1"
* extension[gas-scaling][1].extension[text].valueString = "Walk dog outside twice a week"
* extension[gas-scaling][2].extension[level].valueCoding = $LNC#LA6111-4 "0"
* extension[gas-scaling][2].extension[text].valueString = "Walk dog outside once a week"
* extension[gas-scaling][3].extension[level].valueCoding = $LNC#gas-less-than-expected "Less than expected"
* extension[gas-scaling][3].extension[text].valueString = "Does not walk dog but goes outside with dog"
* extension[gas-scaling][4].extension[level].valueCoding = $LNC#gas-much-less-than-expected "Much less than expected"
* extension[gas-scaling][4].extension[text].valueString = "Unable to go outside with dog"

