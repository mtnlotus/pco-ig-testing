
Instance: test03Patient
InstanceOf: USCorePatientProfile
Title: "Test 03" 
Description: "Goal Identification: YES. Goal Follow-up: NO. Has a PCO GAS goal with both a baseline score and a care plan. No follow-up scores."
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda1db5"
* name.family = "Lopez"
* name.given[0] = "Camila"
* gender = #female
* birthDate = "1955-07-16"

Instance: test03GoalWithGAS
InstanceOf: PCOGoalAttainmentScaleProfile
Title: "Test 03 PCO Goal with GAS"
Usage: #example
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category[pcoCategory] = NCQAGoalDomains#physical-function "Physical Function"
* subject = Reference(test03Patient)
* expressedBy = Reference(test03Patient)
* startDate = "2024-04-03"
* target.dueDate = "2024-09-30"
* description.text = "Walk dog outside once a week"

Instance: test03GASScoretBaseline
InstanceOf: PCOGoalAttainmentScoreObservation
Title: "Test 03 GAS Baseline Score"
Usage: #example
* status = #final 
* subject = Reference(test03Patient)
* performer = Reference(pcoPractitionerGonzalez)
* effectiveDateTime = "2024-04-03T10:15:00Z"
* code = $LNC#68489 "Goal attainment scale"
* focus = Reference(pcoGoalWalkDogExample)
* valueCodeableConcept = $LNC#gas-less-than-expected "Less than expected"

Instance: test03CarePlan
InstanceOf: PCOCarePlan
Title: "Test 03 Care Plan for GAS goal"
Usage: #example
* status = #active
* intent = #plan
* subject = Reference(test03Patient)
* category[pcoCategory][0] = NCQAGoalDomains#physical-function "Physical Function"
* category[pcoCategory][1] = NCQAGoalDomains#independence "Independence"
* goal = Reference(test03GoalWithGAS)
* activity[0].reference = Reference(test03WalkOutsideActionStep)
* period.start = "2024-04-03"
* period.end = "2024-10-31"

Instance: test03WalkOutsideActionStep
InstanceOf: USCoreServiceRequestProfile
Title: "Test 03 Care plan action step"
Usage: #example
* status = #active
* intent = #plan
* subject = Reference(test03Patient)
* requester = Reference(pcoPractitionerGonzalez)
* performer = Reference(test03Patient)
* code.text = "Walk outside without my dog"
* patientInstruction = "Start with a short walk to the corner of your block to gain confidence in your walking."
* extension[pertainsToGoal].valueReference = Reference(test03GoalWithGAS)
* authoredOn = "2024-04-03"
* occurrenceTiming.repeat.boundsPeriod.start = "2024-04-03"
* occurrenceTiming.repeat.boundsPeriod.end = "2024-04-30"
* occurrenceTiming.repeat.frequency = 2
* occurrenceTiming.repeat.periodUnit = #wk
