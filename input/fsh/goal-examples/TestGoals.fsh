
Alias: $PCO-Goal = http://hl7.org/fhir/us/pco/StructureDefinition/pco-gas-goal-profile
Alias: $SDOH-Goal = http://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition/SDOHCC-Goal
Alias: $PFE-Goal = http://hl7.org/fhir/us/pacio-pfe/StructureDefinition/pfe-goal
Alias: $ADI-Goal = http://hl7.org/fhir/us/pacio-adi/StructureDefinition/ADI-PersonalGoal
Alias: $MCC-Goal = http://hl7.org/fhir/us/mcc/StructureDefinition/MCCGoal

Alias: $ELTSS-Goal = http://hl7.org/fhir/us/eltss/StructureDefinition/Goal-eltss
Alias: $ELTSS-Condition = http://hl7.org/fhir/us/eltss/StructureDefinition/Condition-eltss

Instance: pcoGoalPatient
InstanceOf: USCorePatientProfile
Title: "Test Goals Patient" 
Usage: #example
* identifier[0].use = #official
* identifier[0].system = "http://example.org"
* identifier[0].value = "ee8d4ac0-545c-4501-8d7e-646bfbda1db5"
* name.family = "Lopez"
* name.given[0] = "Camila"
* gender = #female
* birthDate = "1955-07-16"

/* PCO content for references
*/
Instance: pcoWhatMattersStatementExample
InstanceOf: WhatMattersAssessment
Title: "What Matters Statement: Family & Friends"
Description: "What Matters observation added by a Patient to record a free-text statement about a well-being focus area."
Usage: #example
* status = #final 
* category[what-matters] = WellBeingConcepts#what-matters "What Matters Most"
* code = VAWholeHealthExample#relationships "Family, Friends & Co-Workers"
* subject = Reference(pcoGoalPatient)
* performer = Reference(pcoGoalPatient)
* effectiveDateTime = "2024-03-27T14:30:00Z"
* valueString = "I would like to meet my friends again for morning walks, but my knee pain prevents me from doing that."

/* SDOH Goal
    - no additional requirements
*/
Instance: goal-PCO-SDOH
InstanceOf: PCOGoalAttainmentScaleProfile
Title: "Test 06 PCO Goal with GAS"
Usage: #example
* meta.profile = $SDOH-Goal
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category[goal-domain] = PCOGoalDomains#physical-function "Physical Function"
* subject = Reference(pcoGoalPatient)
* expressedBy = Reference(pcoGoalPatient)
* startDate = "2024-04-03"
* target.dueDate = "2024-09-30"
* description.text = "Walk dog outside once a week"

/* MCC Goal
    - addresses: Condition (MS, not required)
*/

/* PFE Goal
    - 
*/

/* ADI Goal
    - text is required
    - ADI category is required
*/

/* eLTSS Goal
    - no additional requirements
*/
Instance: goal-PCO-eLTSS
InstanceOf: PCOGoalAttainmentScaleProfile
Title: "PCO Goal with eLTSS elements"
Description: "Nothing added for eLTSS Goal"
Usage: #example
* meta.profile = $ELTSS-Goal
* lifecycleStatus = #active
* achievementStatus = $GoalAchievement#in-progress
* category[what-matters] = WellBeingConcepts#what-matters "What Matters"
* category[goal-domain] = PCOGoalDomains#physical-function "Physical Function"
* subject = Reference(pcoGoalPatient)
* expressedBy = Reference(pcoGoalPatient)
* startDate = "2024-04-03"
* target.dueDate = "2024-09-30"
* description.text = "Walk dog outside once a week"
* addresses = Reference(pcoWhatMattersStatementExample)
