
Instance: test04Patient
InstanceOf: USCorePatientProfile
Title: "Test 04" 
Description: "Goal Identification: YES. Goal Follow-up: YES. Goal Achievement: NO. Has a PCO GAS goal. Has follow-up score, but not achieved."
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda1db5"
* name.family = "Lopez"
* name.given[0] = "Camila"
* gender = #female
* birthDate = "1955-07-16"

Instance: test04GoalWithGAS
InstanceOf: PCOGoalAttainmentScaleProfile
Title: "Test 04 PCO Goal with GAS"
Usage: #example
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category[domainCategory] = PCOGoalDomains#physical-function "Physical Function"
* subject = Reference(test04Patient)
* expressedBy = Reference(test04Patient)
* startDate = "2024-04-03"
* target.dueDate = "2024-09-30"
* description.text = "Walk dog outside once a week"
// exclude optional GAS extensions

Instance: test04GASScoretBaseline
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "Test 04 GAS Baseline Score"
Usage: #example
* status = #final 
* category[survey] = OBSCAT#survey "Survey"
* subject = Reference(test04Patient)
* performer = Reference(pcoPractitionerGonzalez)
* effectiveDateTime = "2024-04-03T10:15:00Z"
* code = $LNC#68489 "Goal attainment scale"
* focus = Reference(test04GoalWithGAS)
* valueCodeableConcept = $LNC#gas-less-than-expected "Less than expected"

Instance: test04CarePlan
InstanceOf: PCOCarePlan
Title: "Test 04 Care Plan for GAS goal"
Usage: #example
* status = #active
* intent = #plan
* subject = Reference(test04Patient)
* goal = Reference(test04GoalWithGAS)
* activity[0].reference = Reference(test04WalkOutsideActionStep)
* period.start = "2024-04-03"
* period.end = "2024-10-31"

Instance: test04WalkOutsideActionStep
InstanceOf: USCoreServiceRequestProfile
Title: "Test 04 Care plan action step"
Usage: #example
* status = #active
* intent = #plan
* subject = Reference(test04Patient)
* requester = Reference(pcoPractitionerGonzalez)
* performer = Reference(test04Patient)
* code.text = "Walk outside without my dog"
* patientInstruction = "Start with a short walk to the corner of your block to gain confidence in your walking."
* extension[pertainsToGoal].valueReference = Reference(test04GoalWithGAS)
* authoredOn = "2024-04-03"
* occurrenceTiming.repeat.boundsPeriod.start = "2024-04-03"
* occurrenceTiming.repeat.boundsPeriod.end = "2024-04-30"
* occurrenceTiming.repeat.frequency = 2
* occurrenceTiming.repeat.periodUnit = #wk

Instance: test04GASScorePatientFollowupExample
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "Test 04 Patient GAS Follow-up Score, not achieved."
Usage: #example
* status = #final 
* category[survey] = OBSCAT#survey "Survey"
* subject = Reference(test04Patient)
* performer = Reference(test04Patient)
* effectiveDateTime = "2024-05-10T10:15:00Z"
* code = $LNC#68491 "Patient follow-up goal attainment scaling score"
* focus = Reference(test04GoalWithGAS)
* valueCodeableConcept = $LNC#gas-less-than-expected "Less than expected"
