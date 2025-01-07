#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-cli-3.6.0.jar
input_cache_path=./input-cache
ig_ini_path=$PWD/ig.ini

input_path=$PWD/bundles-app-data/MyLotusData_CamilaLopez.json
output_path=$PWD/bundles-app-data/resources

# mvn exec:java -Dexec.args="[-BundleToResources] [Bundle file path] (output encoding)

bundle_args="-BundleToResources -e=json"

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

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	java -jar $tooling $bundle_args -p=$input_path -op=$output_path
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		java -jar $tooling $bundle_args -p=$input_path -op=$output_path
	else
		echo BundleToResources NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi
