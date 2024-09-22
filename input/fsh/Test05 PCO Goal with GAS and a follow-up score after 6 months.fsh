
Instance: test05Patient
InstanceOf: USCorePatientProfile
Title: "Test 05" 
Description: "Goal Identification: YES. Goal Follow-up: NO. Goal Achievement: NO. Has a PCO GAS goal. Has follow-up score after 6 months."
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda1db5"
* name.family = "Lopez"
* name.given[0] = "Camila"
* gender = #female
* birthDate = "1955-07-16"

Instance: test05GoalWithGAS
InstanceOf: PCOGoalAttainmentScaleProfile
Title: "Test 05 PCO Goal with GAS"
Usage: #example
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category[pcoCategory] = NCQAGoalDomains#physical-function "Physical Function"
* subject = Reference(test05Patient)
* expressedBy = Reference(test05Patient)
* startDate = "2024-02-03"
* target.dueDate = "2024-09-30"
* description.text = "Walk dog outside once a week"
// exclude optional GAS extensions

Instance: test05GASScoretBaseline
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "Test 05 GAS Baseline Score"
Usage: #example
* status = #final 
* subject = Reference(test05Patient)
* performer = Reference(pcoPractitionerGonzalez)
* effectiveDateTime = "2024-02-03T10:15:00Z"
* code = $LNC#68489 "Goal attainment scale"
* focus = Reference(test05GoalWithGAS)
* valueCodeableConcept = $LNC#gas-less-than-expected "Less than expected"

Instance: test05CarePlan
InstanceOf: PCOCarePlan
Title: "Test 05 Care Plan for GAS goal"
Usage: #example
* status = #active
* intent = #plan
* subject = Reference(test05Patient)
* category[pcoCategory][0] = NCQAGoalDomains#physical-function "Physical Function"
* category[pcoCategory][1] = NCQAGoalDomains#independence "Independence"
* goal = Reference(test05GoalWithGAS)
* activity[0].reference = Reference(test05WalkOutsideActionStep)
* period.start = "2024-04-03"
* period.end = "2024-10-31"

Instance: test05WalkOutsideActionStep
InstanceOf: USCoreServiceRequestProfile
Title: "Test 05 Care plan action step"
Usage: #example
* status = #active
* intent = #plan
* subject = Reference(test05Patient)
* requester = Reference(pcoPractitionerGonzalez)
* performer = Reference(test05Patient)
* code.text = "Walk outside without my dog"
* patientInstruction = "Start with a short walk to the corner of your block to gain confidence in your walking."
* extension[pertainsToGoal].valueReference = Reference(test05GoalWithGAS)
* authoredOn = "2024-04-03"
* occurrenceTiming.repeat.boundsPeriod.start = "2024-04-03"
* occurrenceTiming.repeat.boundsPeriod.end = "2024-04-30"
* occurrenceTiming.repeat.frequency = 2
* occurrenceTiming.repeat.periodUnit = #wk

Instance: test05GASScorePatientFollowupExample
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "Test 05 Patient GAS Follow-up Score, not achieved."
Usage: #example
* status = #final 
* subject = Reference(test05Patient)
* performer = Reference(test05Patient)
* effectiveDateTime = "2024-09-20T10:15:00Z"
* code = $LNC#68491 "Patient follow-up goal attainment scaling score"
* focus = Reference(test05GoalWithGAS)
* valueCodeableConcept = $LNC#LA6112-2 "Better than expected"

