#!/usr/bin/env bash

~/go/bin/yaml2json < schema/se/PrivateUnsecuredLoanApplicationCreated.yaml > schema/se/PrivateUnsecuredLoanApplicationCreated.json
~/go/bin/yaml2json < schema/se/PrivateUnsecuredLoanDisbursed.yaml > schema/se/PrivateUnsecuredLoanDisbursed.json
~/go/bin/yaml2json < schema/se/PrivateUnsecuredLoanStatusUpdated.yaml > schema/se/PrivateUnsecuredLoanStatusUpdated.json
~/go/bin/yaml2json < schema/se/PrivateUnsecuredLoanRejection.yaml > schema/se/PrivateUnsecuredLoanRejection.json
~/go/bin/yaml2json < schema/se/PrivateUnsecuredLoanDelayedProcessing.yaml > schema/se/PrivateUnsecuredLoanDelayedProcessing.json
~/go/bin/yaml2json < schema/se/PrivateUnsecuredLoanOffering.yaml > schema/se/PrivateUnsecuredLoanOffering.json
