#!/usr/bin/env bash

if [ -x ~/go/bin/yaml2json ] ; then 
	YAMLTOJSON(){
		~/go/bin/yaml2json
	}
else
	YAMLTOJSON(){
		python -c "import json,yaml,sys;print(json.dumps(yaml.load(sys.stdin)))"
	}
fi

alias -p 

YAMLTOJSON < schema/se/PrivateUnsecuredLoanApplicationCreated.yaml > schema/se/PrivateUnsecuredLoanApplicationCreated.json
YAMLTOJSON < schema/se/PrivateUnsecuredLoanDisbursed.yaml > schema/se/PrivateUnsecuredLoanDisbursed.json
YAMLTOJSON < schema/se/PrivateUnsecuredLoanStatusUpdated.yaml > schema/se/PrivateUnsecuredLoanStatusUpdated.json
YAMLTOJSON < schema/se/PrivateUnsecuredLoanRejection.yaml > schema/se/PrivateUnsecuredLoanRejection.json
YAMLTOJSON < schema/se/PrivateUnsecuredLoanDelayedProcessing.yaml > schema/se/PrivateUnsecuredLoanDelayedProcessing.json
YAMLTOJSON < schema/se/PrivateUnsecuredLoanOffering.yaml > schema/se/PrivateUnsecuredLoanOffering.json
