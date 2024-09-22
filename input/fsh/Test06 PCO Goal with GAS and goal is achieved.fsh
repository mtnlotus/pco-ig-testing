
Instance: test06Patient
InstanceOf: USCorePatientProfile
Title: "Test 06" 
Description: "Goal Identification: YES. Goal Follow-up: YES. Goal Achievement: YES. Has a PCO GAS goal. Has 2 follow-up scores, and goal is achieved."
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda1db5"
* name.family = "Lopez"
* name.given[0] = "Camila"
* gender = #female
* birthDate = "1955-07-16"

Instance: test06GoalWithGAS
InstanceOf: PCOGoalAttainmentScaleProfile
Title: "Test 06 PCO Goal with GAS"
Usage: #example
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category[pcoCategory] = NCQAGoalDomains#physical-function "Physical Function"
* subject = Reference(test06Patient)
* expressedBy = Reference(test06Patient)
* startDate = "2024-04-03"
* target.dueDate = "2024-09-30"
* description.text = "Walk dog outside once a week"
// exclude optional GAS extensions

Instance: test06GASScoretBaseline
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "Test 06 GAS Baseline Score"
Usage: #example
* status = #final 
* subject = Reference(test06Patient)
* performer = Reference(pcoPractitionerGonzalez)
* effectiveDateTime = "2024-04-03T10:15:00Z"
* code = $LNC#68489 "Goal attainment scale"
* focus = Reference(test06GoalWithGAS)
* valueCodeableConcept = $LNC#gas-less-than-expected "Less than expected"

Instance: test06CarePlan
InstanceOf: PCOCarePlan
Title: "Test 06 Care Plan for GAS goal"
Usage: #example
* status = #active
* intent = #plan
* subject = Reference(test06Patient)
* category[pcoCategory][0] = NCQAGoalDomains#physical-function "Physical Function"
* category[pcoCategory][1] = NCQAGoalDomains#independence "Independence"
* goal = Reference(test06GoalWithGAS)
* activity[0].reference = Reference(test06WalkOutsideActionStep)
* period.start = "2024-04-03"
* period.end = "2024-10-31"

Instance: test06WalkOutsideActionStep
InstanceOf: USCoreServiceRequestProfile
Title: "Test 06 Care plan action step"
Usage: #example
* status = #active
* intent = #plan
* subject = Reference(test06Patient)
* requester = Reference(pcoPractitionerGonzalez)
* performer = Reference(test06Patient)
* code.text = "Walk outside without my dog"
* patientInstruction = "Start with a short walk to the corner of your block to gain confidence in your walking."
* extension[pertainsToGoal].valueReference = Reference(test06GoalWithGAS)
* authoredOn = "2024-04-03"
* occurrenceTiming.repeat.boundsPeriod.start = "2024-04-03"
* occurrenceTiming.repeat.boundsPeriod.end = "2024-04-30"
* occurrenceTiming.repeat.frequency = 2
* occurrenceTiming.repeat.periodUnit = #wk

Instance: test06GASScorePatientFollowupExample
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "Test 06 Patient GAS Follow-up Score, not achieved."
Usage: #example
* status = #final 
* subject = Reference(test06Patient)
* performer = Reference(test06Patient)
* effectiveDateTime = "2024-05-10T10:15:00Z"
* code = $LNC#68491 "Patient follow-up goal attainment scaling score"
* focus = Reference(test06GoalWithGAS)
* valueCodeableConcept = $LNC#gas-less-than-expected "Less than expected"

Instance: test06GASScorePractitionerFollowupExample
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "Test 06 Practitioner GAS Follow-up Score, goal is achieved."
Usage: #example
* status = #final 
* subject = Reference(test06Patient)
* performer = Reference(pcoPractitionerGonzalez)
* effectiveDateTime = "2024-07-16T10:15:00Z"
* code = $LNC#68490 "Practitioner follow-up goal attainment scaling score"
* focus = Reference(test06GoalWithGAS)
* valueCodeableConcept = $LNC#LA6111-4 "Expected outcome"
