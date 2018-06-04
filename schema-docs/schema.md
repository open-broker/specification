
#  Schema

```
https://open-broker.org/schema/v0/
```


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | Yes | Experimental | No | Forbidden | Forbidden | [schema.json](schema.json) |

#  Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [application](#application) | `object` | **Required** |  (this schema) |
| [broker](#broker) | `string` | Optional |  (this schema) |
| [brokerReference](#brokerreference) | `string` | Optional |  (this schema) |
| [dataProtectionContext](#dataprotectioncontext) | `enum` | **Required** |  (this schema) |

## application


`application`
* is **required**
* type: `object`
* defined in this schema

### application Type


`object` with following properties:


| Property | Type | Required | Default |
|----------|------|----------|---------|
| `applicant`|  | **Required** |  |
| `coApplicant`|  | Optional |  |
| `existingLoans`| array | Optional |  |
| `extensions`|  | Optional |  |
| `loanAmount`| integer | **Required** |  |
| `loanPurpose`| string | **Required** | `"OTHER"` |
| `refinanceAmount`| integer | Optional |  |
| `termMonths`| integer | **Required** |  |



#### applicant

undefined

`applicant`
* is **required**
* type: `undefined`

##### applicant Type


* []() – `#/definitions/applicant`







#### coApplicant

undefined

`coApplicant`
* is optional
* type: `undefined`

##### coApplicant Type


* []() – `#/definitions/applicant`







#### existingLoans

undefined

`existingLoans`
* is optional
* type: `array`


##### existingLoans Type


Array type: `array`

All items must be of the type:
* []() – `#/definitions/ExistingLoan`










#### extensions

undefined

`extensions`
* is optional
* type: `undefined`

##### extensions Type


* []() – `#/definitions/ExtensionPoint`







#### loanAmount
##### Amount to borrow

The amount that the customer wishes to borrow

`loanAmount`
* is **required**
* type: `integer`

##### loanAmount Type


`integer`
* minimum value: `1`




##### loanAmount Example

```json
50000
```




#### loanPurpose
##### Purpose of the loan

REFINANCE	refinancing existing debt
HOME_REMODELLING	Home remodelling or renovation
HEALTHCARE_EXPENSES	To finance health-care costs.
DIVORCE_PROCEEDINGS	To finance costs relating to a divorce.
HOME_DOWNPAYMENT	To finance a downpayment for a loan
EDUCATION	To finance education of some kind
TRAVEL	To finance a vacation or other travel expenses
CAR	To finance the purchase of a car or similar
OTHER	Purpose not fitting the above categories


`loanPurpose`
* is **required**
* type: `string`
* default: `"OTHER"`

The value of this property **must** be equal to one of the [known values below](#application-known-values).

##### loanPurpose Known Values
| Value | Description |
|-------|-------------|






#### refinanceAmount
##### The amount being refinanced

Must be less than the loanAmount

`refinanceAmount`
* is optional
* type: `integer`

##### refinanceAmount Type


`integer`





##### refinanceAmount Example

```json
25000
```




#### termMonths
##### Number of monthly terms

The number 1-month terms that the applicant desires to pay off the loan over

`termMonths`
* is **required**
* type: `integer`

##### termMonths Type


`integer`
* minimum value: `1`




##### termMonths Example

```json
3
```







## broker
### Domain-name of the broker, in reverse order

Reversed DNS name for the broker, for example, example.com becomes com.example

`broker`
* is optional
* type: `string`
* defined in this schema

### broker Type


`string`


All instances must conform to this regular expression 
(test examples [here](https://regexr.com/?expression=%5E((%5Ba-zA-Z0-9%5D%7C%5Ba-zA-Z0-9%5D%5Ba-zA-Z0-9-%5D%5Ba-zA-Z0-9%5D).)(%5BA-Za-z0-9%5D%7C%5BA-Za-z0-9%5D%5BA-Za-z0-9-%5D*%5BA-Za-z0-9%5D))):
```regex
^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9-][a-zA-Z0-9]).)([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9-]*[A-Za-z0-9])
```






## brokerReference
### Reference number for the broker

An arbitrary ID specified by the broker

`brokerReference`
* is optional
* type: `string`
* defined in this schema

### brokerReference Type


`string`






## dataProtectionContext
### The data-protection context of the application

REAL -  Production data consisting concerning real data-subjects
FICTIONAL	- Fictional data, does not concern real data-subjects

Consumers MAY reject or refuse to process data sent in the REAL
data protection context if the consumer deems it cannot secure
the data being sent. Additionally consumers may reject FICTIONAL
data if processing may affect real persons, for example,
ordering a hard credit inquiry.


`dataProtectionContext`
* is **required**
* type: `enum`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#dataprotectioncontext-known-values).

### dataProtectionContext Known Values
| Value | Description |
|-------|-------------|
| `REAL` |  |
| `FICTIONAL` |  |




#  Definitions

| Property | Type | Group |
|----------|------|-------|
| [accountNo](#accountno) | `string` | `https://open-broker.org/schema/v0/#/definitions/BankAccount` |
| [address](#address) | `string` | `https://open-broker.org/schema/v0/#/definitions/Address` |
| [applicant](#applicant) | reference | `https://open-broker.org/schema/v0/#/definitions/application` |
| [bankAccount](#bankaccount) | reference | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [careOf](#careof) | `string` | `https://open-broker.org/schema/v0/#/definitions/Address` |
| [childSupportPaidMonthly](#childsupportpaidmonthly) | `integer` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [childSupportReceivedMonthly](#childsupportreceivedmonthly) | `integer` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [citizenships](#citizenships) | reference | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [city](#city) | `string` | `https://open-broker.org/schema/v0/#/definitions/Address` |
| [clearingNo](#clearingno) | `string` | `https://open-broker.org/schema/v0/#/definitions/BankAccount` |
| [coApplicant](#coapplicant) | reference | `https://open-broker.org/schema/v0/#/definitions/application` |
| [countriesOfResidence](#countriesofresidence) | reference | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [dependentChildren](#dependentchildren) | `integer` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [emailAddress](#emailaddress) | `string` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [employer](#employer) | `string` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [employerPhone](#employerphone) | `string` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [employmentStatus](#employmentstatus) | `enum` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [employmentStatusSinceMonth](#employmentstatussincemonth) | `integer` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [employmentStatusSinceYear](#employmentstatussinceyear) | `integer` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [existingLoanType](#existingloantype) | `enum` | `https://open-broker.org/schema/v0/#/definitions/ExistingLoan` |
| [existingLoans](#existingloans) | reference | `https://open-broker.org/schema/v0/#/definitions/application` |
| [extensions](#extensions) | reference | `https://open-broker.org/schema/v0/#/definitions/application` |
| [firstName](#firstname) | `string` | `https://open-broker.org/schema/v0/#/definitions/Address` |
| [housingCostPerMonth](#housingcostpermonth) | `integer` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [housingType](#housingtype) | `enum` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [lastName](#lastname) | `string` | `https://open-broker.org/schema/v0/#/definitions/Address` |
| [loanAmount](#loanamount) | `integer` | `https://open-broker.org/schema/v0/#/definitions/application` |
| [loanPurpose](#loanpurpose) | `enum` | `https://open-broker.org/schema/v0/#/definitions/application` |
| [maritalStatus](#maritalstatus) | `enum` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [monthlyPayment](#monthlypayment) | `integer` | `https://open-broker.org/schema/v0/#/definitions/ExistingLoan` |
| [phone](#phone) | `string` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [postalCode](#postalcode) | `string` | `https://open-broker.org/schema/v0/#/definitions/Address` |
| [refinanceAmount](#refinanceamount) | `integer` | `https://open-broker.org/schema/v0/#/definitions/application` |
| [responsibility](#responsibility) | `enum` | `https://open-broker.org/schema/v0/#/definitions/ExistingLoan` |
| [secondaryPhone](#secondaryphone) | `string[]` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [shouldRefinance](#shouldrefinance) | `boolean` | `https://open-broker.org/schema/v0/#/definitions/ExistingLoan` |
| [ssn](#ssn) | `string` | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [taxResidentOf](#taxresidentof) | reference | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [tentativeAddress](#tentativeaddress) | reference | `https://open-broker.org/schema/v0/#/definitions/applicant` |
| [termMonths](#termmonths) | `integer` | `https://open-broker.org/schema/v0/#/definitions/application` |

## accountNo


`accountNo`
* is optional
* type: `string`
* defined in this schema

### accountNo Type


`string`
* minimum length: 1 characters





## address


`address`
* is optional
* type: `string`
* defined in this schema

### address Type


`string`
* minimum length: 1 characters





## applicant


`applicant`
* is optional
* type: reference
* defined in this schema

### applicant Type


* []() – `#/definitions/applicant`





## bankAccount
### Applicant&#39;s bank account

`bankAccount`
* is optional
* type: reference
* defined in this schema

### bankAccount Type


* []() – `#/definitions/BankAccount`





## careOf


`careOf`
* is optional
* type: `string`
* defined in this schema

### careOf Type


`string`
* minimum length: 1 characters





## childSupportPaidMonthly
### Money paid for child-support each month

`childSupportPaidMonthly`
* is optional
* type: `integer`
* defined in this schema

### childSupportPaidMonthly Type


`integer`
* minimum value: `0`






## childSupportReceivedMonthly
### Money received for child-support each month

`childSupportReceivedMonthly`
* is optional
* type: `integer`
* defined in this schema

### childSupportReceivedMonthly Type


`integer`
* minimum value: `0`






## citizenships
### Countries that the applicant is a citizen of

`citizenships`
* is optional
* type: reference
* defined in this schema

### citizenships Type


* []() – `#/definitions/countryCodeArray`





## city


`city`
* is optional
* type: `string`
* defined in this schema

### city Type


`string`
* minimum length: 1 characters





## clearingNo


`clearingNo`
* is optional
* type: `string`
* defined in this schema

### clearingNo Type


`string`
* minimum length: 4 characters
* maximum length: 4 characters
All instances must conform to this regular expression 
(test examples [here](https://regexr.com/?expression=%5E%5B1-9%5D%5B0-9%5D%7B3%7D%24)):
```regex
^[1-9][0-9]{3}$
```






## coApplicant


`coApplicant`
* is optional
* type: reference
* defined in this schema

### coApplicant Type


* []() – `#/definitions/applicant`





## countriesOfResidence
### Countries that the applicant is a resident of

`countriesOfResidence`
* is optional
* type: reference
* defined in this schema

### countriesOfResidence Type


* []() – `#/definitions/countryCodeArray`





## dependentChildren
### Number of dependent children

Number of child dependents under the age of 18. If greater than 15 then 15 is sent.

`dependentChildren`
* is optional
* type: `integer`
* default: `0`
* defined in this schema

### dependentChildren Type


`integer`
* minimum value: `0`
* maximum value: `15`





## emailAddress
### Email address to the applicant

`emailAddress`
* is optional
* type: `string`
* defined in this schema

### emailAddress Type


`string`
* format: `email` – email address (according to [RFC 5322, section 3.4.1](https://tools.ietf.org/html/rfc5322))






## employer
### The company name of the employer

`employer`
* is optional
* type: `string`
* defined in this schema

### employer Type


`string`





### employer Example

```json
"ACME AB"
```


## employerPhone


`employerPhone`
* is optional
* type: `string`
* defined in this schema

### employerPhone Type


`string`


All instances must conform to this regular expression 
```regex
^\+[1-9][0-9]{1,14}$
```

* test example: [+465069158975](https://regexr.com/?expression=%5E%5C%2B%5B1-9%5D%5B0-9%5D%7B1%2C14%7D%24&text=%2B465069158975)




### employerPhone Example

```json
"+465069158975"
```


## employmentStatus
### The employment situatuib of the applicant

EARLY_RETIRED
HOURLY	Formally permanently employed, hired by the hour
HOURLY	Works fewer than 40h per week
OTHER
RETIRED	Retired due to age
SELF_EMPLOYED
STUDENT	Signed up to a university or other higher education
TEMPORARY	Non-full time employment pertaining to a project
TRIAL	Trial employment sv. Provanställning
UNEMPLOYED
FULL_TIME


`employmentStatus`
* is optional
* type: `enum`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#employmentstatus-known-values).

### employmentStatus Known Values
| Value | Description |
|-------|-------------|
| `EARLY_RETIRED` |  |
| `HOURLY` |  |
| `OTHER` |  |
| `RETIRED` |  |
| `SELF_EMPLOYED` |  |
| `STUDENT` |  |
| `TEMPORARY` |  |
| `TRIAL` |  |
| `UNEMPLOYED` |  |
| `FULL_TIME` |  |




## employmentStatusSinceMonth
### Month in which the applicant entered into his or her current employment status

`employmentStatusSinceMonth`
* is optional
* type: `integer`
* defined in this schema

### employmentStatusSinceMonth Type


`integer`
* minimum value: `1`
* maximum value: `12`




### employmentStatusSinceMonth Example

```json
3
```


## employmentStatusSinceYear
### Year in which the applicant entered into his or her current employment status

`employmentStatusSinceYear`
* is optional
* type: `integer`
* defined in this schema

### employmentStatusSinceYear Type


`integer`
* minimum value: `1900`
* maximum value: `3000`




### employmentStatusSinceYear Example

```json
2014
```


## existingLoanType


`existingLoanType`
* is optional
* type: `enum`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#existingloantype-known-values).

### existingLoanType Known Values
| Value | Description |
|-------|-------------|
| `CAR_LOAN` |  |
| `CHECK_CREDIT` |  |
| `CREDIT_CARD` |  |
| `MORTGAGE` |  |
| `STUDENT_LOAN` |  |
| `UNSECURED_LOAN` |  |
| `OTHER` |  |




## existingLoans


`existingLoans`
* is optional
* type: reference

* defined in this schema

### existingLoans Type


Array type: reference

All items must be of the type:
* []() – `#/definitions/ExistingLoan`








## extensions


`extensions`
* is optional
* type: reference
* defined in this schema

### extensions Type


* []() – `#/definitions/ExtensionPoint`





## firstName


`firstName`
* is optional
* type: `string`
* defined in this schema

### firstName Type


`string`
* minimum length: 1 characters





## housingCostPerMonth
### Housing-related costs per month

`housingCostPerMonth`
* is optional
* type: `integer`
* default: `0`
* defined in this schema

### housingCostPerMonth Type


`integer`
* minimum value: `0`




### housingCostPerMonth Example

```json
8000
```


## housingType
### Housing type for the applicant

The form of housing in which the applicant resides
RENTED
OWN_APARTMENT the applicant owns his or her apartment
OWN_HOUSE the applicant owns his or her house
LIVE_IN the applicant doesn\'t directly rent or own a house but is rather a lodger


`housingType`
* is optional
* type: `enum`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#housingtype-known-values).

### housingType Known Values
| Value | Description |
|-------|-------------|
| `RENTED` |  |
| `OWN_APARTMENT` |  |
| `OWN_HOUSE` |  |
| `LIVE_IN` |  |




## lastName


`lastName`
* is optional
* type: `string`
* defined in this schema

### lastName Type


`string`
* minimum length: 1 characters





## loanAmount
### Amount to borrow

The amount that the customer wishes to borrow

`loanAmount`
* is optional
* type: `integer`
* defined in this schema

### loanAmount Type


`integer`
* minimum value: `1`




### loanAmount Example

```json
50000
```


## loanPurpose
### Purpose of the loan

REFINANCE	refinancing existing debt
HOME_REMODELLING	Home remodelling or renovation
HEALTHCARE_EXPENSES	To finance health-care costs.
DIVORCE_PROCEEDINGS	To finance costs relating to a divorce.
HOME_DOWNPAYMENT	To finance a downpayment for a loan
EDUCATION	To finance education of some kind
TRAVEL	To finance a vacation or other travel expenses
CAR	To finance the purchase of a car or similar
OTHER	Purpose not fitting the above categories


`loanPurpose`
* is optional
* type: `enum`
* default: `"OTHER"`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#loanpurpose-known-values).

### loanPurpose Known Values
| Value | Description |
|-------|-------------|
| `REFINANCE` |  |
| `HOME_REMODELLING` |  |
| `HEALTHCARE_EXPENSES` |  |
| `HOME_DOWNPAYMENT` |  |
| `EDUCATION` |  |
| `TRAVEL` |  |
| `CAR` |  |
| `OTHER` |  |




## maritalStatus
### The marital status of the applicant

`maritalStatus`
* is optional
* type: `enum`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#maritalstatus-known-values).

### maritalStatus Known Values
| Value | Description |
|-------|-------------|
| `SINGLE` |  |
| `MARRIED` |  |
| `COHABITING` |  |




## monthlyPayment


`monthlyPayment`
* is optional
* type: `integer`
* defined in this schema

### monthlyPayment Type


`integer`
* minimum value: `1`






## phone
### Phone number to the applicant

`phone`
* is optional
* type: `string`
* defined in this schema

### phone Type


`string`


All instances must conform to this regular expression 
```regex
^\+[1-9][0-9]{1,14}$
```

* test example: [+467015114441](https://regexr.com/?expression=%5E%5C%2B%5B1-9%5D%5B0-9%5D%7B1%2C14%7D%24&text=%2B467015114441)




### phone Example

```json
"+467015114441"
```


## postalCode


`postalCode`
* is optional
* type: `string`
* defined in this schema

### postalCode Type


`string`
* minimum length: 1 characters





## refinanceAmount
### The amount being refinanced

Must be less than the loanAmount

`refinanceAmount`
* is optional
* type: `integer`
* defined in this schema

### refinanceAmount Type


`integer`





### refinanceAmount Example

```json
25000
```


## responsibility


`responsibility`
* is optional
* type: `enum`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#responsibility-known-values).

### responsibility Known Values
| Value | Description |
|-------|-------------|
| `MainApplicant` |  |
| `CoApplicant` |  |
| `Shared` |  |




## secondaryPhone
### List of alternate phone numbers

`secondaryPhone`
* is optional
* type: `string[]`

* defined in this schema

### secondaryPhone Type


Array type: `string[]`

All items must be of the type:
`string`


All instances must conform to this regular expression 
(test examples [here](https://regexr.com/?expression=%5E%5C%2B%5B1-9%5D%5B0-9%5D%7B1%2C14%7D%24)):
```regex
^\+[1-9][0-9]{1,14}$
```









## shouldRefinance


`shouldRefinance`
* is optional
* type: `boolean`
* defined in this schema

### shouldRefinance Type


`boolean`





## ssn
### 12-digit Social Security Number (sv. Personnr) with

a Swedish Social-security number on the 12-digit format. YYYYMMDD-XXXX 

`ssn`
* is optional
* type: `string`
* defined in this schema

### ssn Type


`string`
* minimum length: 12 characters
* maximum length: 12 characters
All instances must conform to this regular expression 
```regex
^[0-9]{12}$
```

* test example: [195911057916](https://regexr.com/?expression=%5E%5B0-9%5D%7B12%7D%24&text=195911057916)




### ssn Example

```json
"195911057916"
```


## taxResidentOf
### Countries that the applicant is a resident of for tax-purposes

`taxResidentOf`
* is optional
* type: reference
* defined in this schema

### taxResidentOf Type


* []() – `#/definitions/countryCodeArray`





## tentativeAddress
### Address of the applicant for display purposes

All actors are expected to perform proper due diligence in establishing the identity of the applicant

`tentativeAddress`
* is optional
* type: reference
* defined in this schema

### tentativeAddress Type


* []() – `#/definitions/Address`





## termMonths
### Number of monthly terms

The number 1-month terms that the applicant desires to pay off the loan over

`termMonths`
* is optional
* type: `integer`
* defined in this schema

### termMonths Type


`integer`
* minimum value: `1`




### termMonths Example

```json
3
```

