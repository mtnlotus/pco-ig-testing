#!/bin/bash

# Load all resource bundles into a FHIR server

# arg1 = FHIR server endpoint URL
# . ./load-all https://localhost:8080/fhir

for i in */*.json; do
  echo
  echo Loading bundle from $i
  curl -X POST $1 -H 'Content-type: application/fhir+json' -H 'Accept: application/fhir+json' --data-binary @$i
done
