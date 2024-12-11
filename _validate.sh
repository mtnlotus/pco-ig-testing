#!/bin/bash
validator_jar=validator_cli.jar
input_cache_path=./input-cache
ig_ini_path=$PWD/ig.ini
# resources_path=$PWD/bundles/test-data
# resources_path=$PWD/bundles-app-data/*.json
resources_path=$PWD/fsh-generated/resources

# Documentation: https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator

validate_args="-version 4.0 -ig hl7.fhir.us.pco#dev -profile http://hl7.org/fhir/us/pco/StructureDefinition/pco-goal-profile -html-output c:\temp\validation.html -allow-example-urls true -level errors"
# validate_args="-version 4.0 -ig hl7.fhir.us.core#6.1.0 -html-output temp\validation.html -allow-example-urls true -level errors"

set -e
echo Checking internet connection...
wget -q --spider tx.fhir.org

if [ $? -eq 0 ]; then
	echo "Online"
	fsoption=""
else
	echo "Offline"
	fsoption=""
fi

echo "$fsoption"

tooling=$input_cache_path/$validator_jar
if test -f "$tooling"; then
	java -jar $tooling $resources_path $validate_args
else
	tooling=../$validator_jar
	echo $tooling
	if test -f "$tooling"; then
		java -jar $tooling $resources_path $validate_args
	else
		echo validator-cli.jar NOT FOUND in input-cache or parent folder.  Aborting...
	fi
fi
