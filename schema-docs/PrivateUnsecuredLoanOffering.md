
# PrivateUnsecuredLoanOffering Schema

```
https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering
```

An offer for a loan


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | Yes | Experimental | No | Forbidden | Forbidden | [PrivateUnsecuredLoanOffering.json](PrivateUnsecuredLoanOffering.json) |
## Schema Hierarchy

* PrivateUnsecuredLoanOffering `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering`
  * [reference](reference.md) `https://open-broker.org/schema/v0/se/reference`


# PrivateUnsecuredLoanOffering Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [brokerReference](#brokerreference) | reference | **Required** | PrivateUnsecuredLoanOffering (this schema) |
| [loanInsuranceOffer](#loaninsuranceoffer) | `object` | Optional | PrivateUnsecuredLoanOffering (this schema) |
| [offer](#offer) | `object` | **Required** | PrivateUnsecuredLoanOffering (this schema) |

## brokerReference
### A reference-id used by the broker

`brokerReference`
* is **required**
* type: reference
* defined in this schema

### brokerReference Type


* [reference](reference.md) – `https://open-broker.org/schema/v0/se/reference`





## loanInsuranceOffer


`loanInsuranceOffer`
* is optional
* type: `object`
* defined in this schema

### loanInsuranceOffer Type


`object` with following properties:


| Property | Type | Required |
|----------|------|----------|
| `descriptiveText`| string | Optional |
| `insuredAmount`| integer | **Required** |
| `monthlyPremium`| integer | **Required** |



#### descriptiveText
##### A text to be displayed along with the offer.

undefined

`descriptiveText`
* is optional
* type: `string`

##### descriptiveText Type


`string`








#### insuredAmount
##### The amount insured

undefined

`insuredAmount`
* is **required**
* type: `integer`

##### insuredAmount Type


`integer`
* minimum value: `1`








#### monthlyPremium
##### The monthly premium to be paid

undefined

`monthlyPremium`
* is **required**
* type: `integer`

##### monthlyPremium Type


`integer`
* minimum value: `1`











## offer


`offer`
* is **required**
* type: `object`
* defined in this schema

### offer Type


`object` with following properties:


| Property | Type | Required |
|----------|------|----------|
| `arrangementFee`| integer | **Required** |
| `effectiveInterestRate`| string | **Required** |
| `invoiceFee`| integer | **Required** |
| `maxOfferedCredit`| integer | **Required** |
| `minOfferedCredit`| integer | **Required** |
| `mustRefinance`| integer | **Required** |
| `nominalInterestRate`| string | **Required** |
| `offeredCredit`| integer | **Required** |
| `termFee`| integer | **Required** |
| `termMonths`| integer | **Required** |



#### arrangementFee
##### Arrangement fee for the customer

An arrangement fee is a one-time fee taken by the customer
charged by the lender for setting up the loan. Use 0 to indicate
that no arrangement fee is charged.


`arrangementFee`
* is **required**
* type: `integer`

##### arrangementFee Type


`integer`
* minimum value: `0`








#### effectiveInterestRate
##### Effective interest rate (APR)

The effective annual interest rate of the loan
formatted as a string so as to avoid problems
floating-point numbers.


`effectiveInterestRate`
* is **required**
* type: `string`

##### effectiveInterestRate Type


`string`


All instances must conform to this regular expression 
(test examples [here](https://regexr.com/?expression=%5E%5B0-9%5D%2B(.%5B0-9%5D%2B)%3F%24)):
```regex
^[0-9]+(.[0-9]+)?$
```








#### invoiceFee
##### Fee charged for particular invoicing solutions

undefined

`invoiceFee`
* is **required**
* type: `integer`

##### invoiceFee Type


`integer`
* minimum value: `0`








#### maxOfferedCredit
##### Maximum offered credit

The largest loan that this customer is approved for under
the current interest rate.

This value can be equal to both the minOfferedCredit and
offeredCredit. Indicating that this is the only possible
amount offered.


`maxOfferedCredit`
* is **required**
* type: `integer`

##### maxOfferedCredit Type


`integer`
* minimum value: `1`








#### minOfferedCredit
##### Minimum offered credit

The minimum amount for which the lender the lender is
willing to offer this interest rate for.

This value can be equal to both the minOfferedCredit and
offeredCredit. Indicating that this is the only possible
amount offered.


`minOfferedCredit`
* is **required**
* type: `integer`

##### minOfferedCredit Type


`integer`
* minimum value: `1`








#### mustRefinance
##### Amount that must be refinanced

Amount the customer must use to refinance other loans.
Use zero to indicate that no refinancing is required.


`mustRefinance`
* is **required**
* type: `integer`

##### mustRefinance Type


`integer`
* minimum value: `0`








#### nominalInterestRate
##### Nominal interest rate

The nominal annual interest rate of the loan
formatted as a string so as to avoid problems
floating-point numbers.


`nominalInterestRate`
* is **required**
* type: `string`

##### nominalInterestRate Type


`string`


All instances must conform to this regular expression 
(test examples [here](https://regexr.com/?expression=%5E%5B0-9%5D%2B(.%5B0-9%5D%2B)%3F%24)):
```regex
^[0-9]+(.[0-9]+)?$
```








#### offeredCredit
##### Offered credit

The amount the customer applied for or the highest number
the customer is approved for, if this number is lower than
what was originally applied for.

This value can be equal to both the minOfferedCredit and
offeredCredit. Indicating that this is the only possible
amount offered.


`offeredCredit`
* is **required**
* type: `integer`

##### offeredCredit Type


`integer`
* minimum value: `1`








#### termFee
##### Fixed fee charged per term

Fixed fees to be paid along with amortisation and interest
every month. This fee must be included in the calculation of
effective interest. This field should be used for
unavoidable fees that the customer cannot be reduced by
choosing other billing arrangements.

0 indicates that there is no per-term fee.


`termFee`
* is **required**
* type: `integer`

##### termFee Type


`integer`
* minimum value: `0`








#### termMonths
##### Number of monthly terms

The number of month-terms required to payback the loan at
the offered interest and offered amount.


`termMonths`
* is **required**
* type: `integer`

##### termMonths Type


`integer`
* minimum value: `1`











# PrivateUnsecuredLoanOffering Definitions

| Property | Type | Group |
|----------|------|-------|
| [arrangementFee](#arrangementfee) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/Offer` |
| [descriptiveText](#descriptivetext) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/LoanInsuranceOffer` |
| [effectiveInterestRate](#effectiveinterestrate) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/Offer` |
| [insuredAmount](#insuredamount) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/LoanInsuranceOffer` |
| [invoiceFee](#invoicefee) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/Offer` |
| [maxOfferedCredit](#maxofferedcredit) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/Offer` |
| [minOfferedCredit](#minofferedcredit) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/Offer` |
| [monthlyPremium](#monthlypremium) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/LoanInsuranceOffer` |
| [mustRefinance](#mustrefinance) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/Offer` |
| [nominalInterestRate](#nominalinterestrate) | `string` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/Offer` |
| [offeredCredit](#offeredcredit) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/Offer` |
| [termFee](#termfee) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/Offer` |
| [termMonths](#termmonths) | `integer` | `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOffering#/definitions/Offer` |

## arrangementFee
### Arrangement fee for the customer

An arrangement fee is a one-time fee taken by the customer
charged by the lender for setting up the loan. Use 0 to indicate
that no arrangement fee is charged.


`arrangementFee`
* is optional
* type: `integer`
* defined in this schema

### arrangementFee Type


`integer`
* minimum value: `0`






## descriptiveText
### A text to be displayed along with the offer.

`descriptiveText`
* is optional
* type: `string`
* defined in this schema

### descriptiveText Type


`string`






## effectiveInterestRate
### Effective interest rate (APR)

The effective annual interest rate of the loan
formatted as a string so as to avoid problems
floating-point numbers.


`effectiveInterestRate`
* is optional
* type: `string`
* defined in this schema

### effectiveInterestRate Type


`string`


All instances must conform to this regular expression 
(test examples [here](https://regexr.com/?expression=%5E%5B0-9%5D%2B(.%5B0-9%5D%2B)%3F%24)):
```regex
^[0-9]+(.[0-9]+)?$
```






## insuredAmount
### The amount insured

`insuredAmount`
* is optional
* type: `integer`
* defined in this schema

### insuredAmount Type


`integer`
* minimum value: `1`






## invoiceFee
### Fee charged for particular invoicing solutions

`invoiceFee`
* is optional
* type: `integer`
* defined in this schema

### invoiceFee Type


`integer`
* minimum value: `0`






## maxOfferedCredit
### Maximum offered credit

The largest loan that this customer is approved for under
the current interest rate.

This value can be equal to both the minOfferedCredit and
offeredCredit. Indicating that this is the only possible
amount offered.


`maxOfferedCredit`
* is optional
* type: `integer`
* defined in this schema

### maxOfferedCredit Type


`integer`
* minimum value: `1`






## minOfferedCredit
### Minimum offered credit

The minimum amount for which the lender the lender is
willing to offer this interest rate for.

This value can be equal to both the minOfferedCredit and
offeredCredit. Indicating that this is the only possible
amount offered.


`minOfferedCredit`
* is optional
* type: `integer`
* defined in this schema

### minOfferedCredit Type


`integer`
* minimum value: `1`






## monthlyPremium
### The monthly premium to be paid

`monthlyPremium`
* is optional
* type: `integer`
* defined in this schema

### monthlyPremium Type


`integer`
* minimum value: `1`






## mustRefinance
### Amount that must be refinanced

Amount the customer must use to refinance other loans.
Use zero to indicate that no refinancing is required.


`mustRefinance`
* is optional
* type: `integer`
* defined in this schema

### mustRefinance Type


`integer`
* minimum value: `0`






## nominalInterestRate
### Nominal interest rate

The nominal annual interest rate of the loan
formatted as a string so as to avoid problems
floating-point numbers.


`nominalInterestRate`
* is optional
* type: `string`
* defined in this schema

### nominalInterestRate Type


`string`


All instances must conform to this regular expression 
(test examples [here](https://regexr.com/?expression=%5E%5B0-9%5D%2B(.%5B0-9%5D%2B)%3F%24)):
```regex
^[0-9]+(.[0-9]+)?$
```






## offeredCredit
### Offered credit

The amount the customer applied for or the highest number
the customer is approved for, if this number is lower than
what was originally applied for.

This value can be equal to both the minOfferedCredit and
offeredCredit. Indicating that this is the only possible
amount offered.


`offeredCredit`
* is optional
* type: `integer`
* defined in this schema

### offeredCredit Type


`integer`
* minimum value: `1`






## termFee
### Fixed fee charged per term

Fixed fees to be paid along with amortisation and interest
every month. This fee must be included in the calculation of
effective interest. This field should be used for
unavoidable fees that the customer cannot be reduced by
choosing other billing arrangements.

0 indicates that there is no per-term fee.


`termFee`
* is optional
* type: `integer`
* defined in this schema

### termFee Type


`integer`
* minimum value: `0`






## termMonths
### Number of monthly terms

The number of month-terms required to payback the loan at
the offered interest and offered amount.


`termMonths`
* is optional
* type: `integer`
* defined in this schema

### termMonths Type


`integer`
* minimum value: `1`





