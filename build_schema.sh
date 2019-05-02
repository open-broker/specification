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

YAMLTOJSON < se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanApplicationCreated.yaml > se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanApplicationCreated.json
YAMLTOJSON < se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanDisbursed.yaml > se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanDisbursed.json
YAMLTOJSON < se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanStatusUpdated.yaml > se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanStatusUpdated.json
YAMLTOJSON < se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanRejection.yaml > se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanRejection.json
YAMLTOJSON < se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanDelayedProcessing.yaml > se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanDelayedProcessing.json
YAMLTOJSON < se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanOffering.yaml > se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanOffering.json
YAMLTOJSON < se/PrivateUnsecuredLoan/schema/reference.yaml > se/PrivateUnsecuredLoan/schema/reference.json
YAMLTOJSON < se/PrivateUnsecuredLoan/schema/BankAccount.yaml > se/PrivateUnsecuredLoan/schema/BankAccount.json
YAMLTOJSON < se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanOfferAccepted.yaml > se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanOfferAccepted.json
YAMLTOJSON < se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanOfferRejected.yaml > se/PrivateUnsecuredLoan/schema/PrivateUnsecuredLoanOfferRejected.json
