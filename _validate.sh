#!/bin/bash
validator_jar=validator_cli.jar
input_cache_path=./input-cache
ig_ini_path=$PWD/ig.ini

# resources_path=$PWD/bundles/test-data
resources_path=$PWD/fsh-generated/resources
html_path=$PWD/fsh-generated/validate.html

# resources_path=$PWD/bundles-app-data/resources
# html_path=$PWD/bundles-app-data/validation.html

# level=warnings
level=errors

# Documentation: https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator

validate_args="-version 4.0 -ig hl7.fhir.us.pco#dev -allow-example-urls true"

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
	java -jar $tooling $resources_path $validate_args -html-output $html_path -level $level
else
	tooling=../$validator_jar
	echo $tooling
	if test -f "$tooling"; then
		java -jar $tooling $resources_path $validate_args -html-output $html_path -level $level
	else
		echo validator-cli.jar NOT FOUND in input-cache or parent folder.  Aborting...
	fi
fi
