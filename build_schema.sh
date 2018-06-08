#!/usr/bin/env bash

~/go/bin/yaml2json < schema/se/PrivateUnsecuredLoanApplicationCreated.yaml > schema/se/PrivateUnsecuredLoanApplicationCreated.json
~/go/bin/yaml2json < schema/se/PrivateUnsecuredLoanDisbursed.yaml > schema/se/PrivateUnsecuredLoanDisbursed.json
~/go/bin/yaml2json < schema/se/PrivateUnsecuredLoanStatusUpdated.yaml > schema/se/PrivateUnsecuredLoanStatusUpdated.json
