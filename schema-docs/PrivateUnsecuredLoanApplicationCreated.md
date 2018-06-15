
# PrivateUnsecuredLoanApplicationCreated Schema

```
https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated
```

An event indicating the creation of an application for
a private unsecure loan.


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | Yes | Experimental | No | Forbidden | Forbidden | [PrivateUnsecuredLoanApplicationCreated.json](PrivateUnsecuredLoanApplicationCreated.json) |

# PrivateUnsecuredLoanApplicationCreated Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [application](#application) | `object` | **Required** | PrivateUnsecuredLoanApplicationCreated (this schema) |
| [broker](#broker) | `string` | Optional | PrivateUnsecuredLoanApplicationCreated (this schema) |
| [brokerReference](#brokerreference) | `string` | Optional | PrivateUnsecuredLoanApplicationCreated (this schema) |
| [dataProtectionContext](#dataprotectioncontext) | `enum` | **Required** | PrivateUnsecuredLoanApplicationCreated (this schema) |

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
##### Applicant

The primary applicant to the loan

`applicant`
* is **required**
* type: `undefined`

##### applicant Type


* [applicant]() – `#/definitions/applicant`







#### coApplicant
##### Co-applicant

A secondary applicant for the loan, if any.

`coApplicant`
* is optional
* type: `undefined`

##### coApplicant Type


* [applicant]() – `#/definitions/applicant`







#### existingLoans
##### Information about existing loans relevant to the applicant

undefined

`existingLoans`
* is optional
* type: `array`


##### existingLoans Type


Array type: `array`

All items must be of the type:
* [ExistingLoan]() – `#/definitions/ExistingLoan`










#### extensions
##### Custom, vendor-specific extensions to the schema

undefined

`extensions`
* is optional
* type: `undefined`

##### extensions Type


* [ExtensionPoint]() – `#/definitions/ExtensionPoint`







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

Categorical label for the purpose of the loan being applied for

`loanPurpose`
* is **required**
* type: `string`
* default: `"OTHER"`

The value of this property **must** be equal to one of the [known values below](#application-known-values).

##### loanPurpose Known Values
| Value | Description |
|-------|-------------|
| `CAR` | To finance the purchase of a car or similar |
| `DIVORCE_PROCEEDINGS` | To finance costs relating to a divorce. |
| `EDUCATION` | To finance education of some kind |
| `HEALTHCARE_EXPENSES` | To finance health-care costs. |
| `HOME_DOWNPAYMENT` | To finance a downpayment for a loan |
| `HOME_REMODELLING` | Home remodelling or renovation |
| `OTHER` | Purpose not fitting the above categories |
| `REFINANCE` | Refinancing existing debt |
| `TRAVEL` | To finance a vacation or other travel expenses |






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
| `FICTIONAL` | Fictional data, does not concern real data-subjects |
| `REAL` | Production data consisting concerning real data-subjects |




# PrivateUnsecuredLoanApplicationCreated Definitions

| Property | Type | Group |
|----------|------|-------|
| [accountNo](#accountno) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/BankAccount` |
| [address](#address) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/Address` |
| [applicant](#applicant) | applicant | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/application` |
| [bankAccount](#bankaccount) | BankAccount | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [careOf](#careof) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/Address` |
| [childSupportPaidMonthly](#childsupportpaidmonthly) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [childSupportReceivedMonthly](#childsupportreceivedmonthly) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [citizenships](#citizenships) | CountryCodeArray | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [city](#city) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/Address` |
| [clearingNo](#clearingno) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/BankAccount` |
| [coApplicant](#coapplicant) | applicant | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/application` |
| [countriesOfResidence](#countriesofresidence) | CountryCodeArray | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [dependentChildren](#dependentchildren) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [emailAddress](#emailaddress) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [employer](#employer) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [employerPhone](#employerphone) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [employmentStatus](#employmentstatus) | `enum` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [employmentStatusSinceMonth](#employmentstatussincemonth) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [employmentStatusSinceYear](#employmentstatussinceyear) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [existingLoanType](#existingloantype) | `enum` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/ExistingLoan` |
| [existingLoans](#existingloans) | ExistingLoan | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/application` |
| [extensions](#extensions) | ExtensionPoint | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/application` |
| [firstName](#firstname) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/Address` |
| [housingCostPerMonth](#housingcostpermonth) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [housingType](#housingtype) | `enum` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [lastName](#lastname) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/Address` |
| [loanAmount](#loanamount) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/application` |
| [loanPurpose](#loanpurpose) | `enum` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/application` |
| [maritalStatus](#maritalstatus) | `enum` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [monthlyPayment](#monthlypayment) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/ExistingLoan` |
| [phone](#phone) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [postalCode](#postalcode) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/Address` |
| [refinanceAmount](#refinanceamount) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/application` |
| [responsibility](#responsibility) | `enum` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/ExistingLoan` |
| [secondaryPhone](#secondaryphone) | `string[]` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [shouldRefinance](#shouldrefinance) | `boolean` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/ExistingLoan` |
| [ssn](#ssn) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [taxResidentOf](#taxresidentof) | CountryCodeArray | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [tentativeAddress](#tentativeaddress) | Address | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/applicant` |
| [termMonths](#termmonths) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanApplicationCreated#/definitions/application` |

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
### Applicant

The primary applicant to the loan

`applicant`
* is optional
* type: applicant
* defined in this schema

### applicant Type


* [applicant]() – `#/definitions/applicant`





## bankAccount
### Applicant&#39;s bank account

`bankAccount`
* is optional
* type: BankAccount
* defined in this schema

### bankAccount Type


* [BankAccount]() – `#/definitions/BankAccount`





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
* type: CountryCodeArray
* defined in this schema

### citizenships Type


* [CountryCodeArray]() – `#/definitions/countryCodeArray`





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
### Co-applicant

A secondary applicant for the loan, if any.

`coApplicant`
* is optional
* type: applicant
* defined in this schema

### coApplicant Type


* [applicant]() – `#/definitions/applicant`





## countriesOfResidence
### Countries that the applicant is a resident of

`countriesOfResidence`
* is optional
* type: CountryCodeArray
* defined in this schema

### countriesOfResidence Type


* [CountryCodeArray]() – `#/definitions/countryCodeArray`





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
### The employment situation of the applicant

`employmentStatus`
* is optional
* type: `enum`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#employmentstatus-known-values).

### employmentStatus Known Values
| Value | Description |
|-------|-------------|
| `EARLY_RETIRED` | Retried earlier before the usual retirement age |
| `FULL_TIME` | Employed full-time |
| `HOURLY` | Formally permanently employed, hired by the hour |
| `OTHER` | An employment status not falling neatly in to any of the other categories |
| `RETIRED` | Retired due to age |
| `SELF_EMPLOYED` | The applicant is a sole proprietor or works for his or her own company |
| `STUDENT` | Signed up to a university or other higher education |
| `TEMPORARY` | Non-full time employment pertaining to a project |
| `TRIAL` | Trial employment (sv. Provanställning) |
| `UNEMPLOYED` | Not currently employed |




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
| `CAR_LOAN` | A loan for a car or similar vehicle |
| `CHECK_CREDIT` | A revolving credit, other than a credit-card. |
| `CREDIT_CARD` | A credit-card |
| `MORTGAGE` | A home mortgage |
| `OTHER` | Any other debt not falling into any of the other categories. |
| `STUDENT_LOAN` | A student loan |
| `UNSECURED_LOAN` | An unsecured loan, not falling into any of the other categories, for example a consumer loan. |




## existingLoans
### Information about existing loans relevant to the applicant

`existingLoans`
* is optional
* type: ExistingLoan

* defined in this schema

### existingLoans Type


Array type: ExistingLoan

All items must be of the type:
* [ExistingLoan]() – `#/definitions/ExistingLoan`








## extensions
### Custom, vendor-specific extensions to the schema

`extensions`
* is optional
* type: ExtensionPoint
* defined in this schema

### extensions Type


* [ExtensionPoint]() – `#/definitions/ExtensionPoint`





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

`housingType`
* is optional
* type: `enum`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#housingtype-known-values).

### housingType Known Values
| Value | Description |
|-------|-------------|
| `LIVE_IN` | the applicant doesn&#39;t directly rent or own a house but is rather a lodger |
| `OWN_APARTMENT` | The applicant owns his or her apartment |
| `OWN_HOUSE` | The applicant owns his or her house |
| `RENTED` | The applicant rents his or her place of residence |




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

Categorical label for the purpose of the loan being applied for

`loanPurpose`
* is optional
* type: `enum`
* default: `"OTHER"`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#loanpurpose-known-values).

### loanPurpose Known Values
| Value | Description |
|-------|-------------|
| `CAR` | To finance the purchase of a car or similar |
| `DIVORCE_PROCEEDINGS` | To finance costs relating to a divorce. |
| `EDUCATION` | To finance education of some kind |
| `HEALTHCARE_EXPENSES` | To finance health-care costs. |
| `HOME_DOWNPAYMENT` | To finance a downpayment for a loan |
| `HOME_REMODELLING` | Home remodelling or renovation |
| `OTHER` | Purpose not fitting the above categories |
| `REFINANCE` | Refinancing existing debt |
| `TRAVEL` | To finance a vacation or other travel expenses |




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
| `CoApplicant` | The co-applicant is responsible for this loan |
| `MainApplicant` | The main applicant is responsible for this loan |
| `Shared` | The loan is a shared responsibility for the applicants |




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
* type: CountryCodeArray
* defined in this schema

### taxResidentOf Type


* [CountryCodeArray]() – `#/definitions/countryCodeArray`





## tentativeAddress
### Address of the applicant for display purposes

All actors are expected to perform proper due diligence in establishing the identity of the applicant

`tentativeAddress`
* is optional
* type: Address
* defined in this schema

### tentativeAddress Type


* [Address]() – `#/definitions/Address`





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

