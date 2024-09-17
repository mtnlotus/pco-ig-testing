#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-cli-3.4.0.jar
input_cache_path=./input-cache
ig_ini_path=$PWD/ig.ini

bundle_args="-BundleResources -ptd=fsh-generated/resources -op=bundles/test-data -v=r4 -bid=pco-ig-test-data"

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
	java -jar $tooling $bundle_args
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		java -jar $tooling $bundle_args
	else
		echo BundleResources NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi
