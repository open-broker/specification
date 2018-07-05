
# PrivateUnsecuredLoanOfferAccepted Schema

```
https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOfferAccepted
```

An event indicating that an offer has been accepted by the customer or the broker
on behalf of the customer


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Forbidden | [PrivateUnsecuredLoanOfferAccepted.json](PrivateUnsecuredLoanOfferAccepted.json) |
## Schema Hierarchy

* PrivateUnsecuredLoanOfferAccepted `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOfferAccepted`
  * [A Swedish Bank Account with a clearing number](BankAccount.md) `https://open-broker.org/schema/v0/se/BankAccount`
  * [reference](reference.md) `https://open-broker.org/schema/v0/se/reference`


# PrivateUnsecuredLoanOfferAccepted Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [bankAccount](#bankaccount) | A Swedish Bank Account with a clearing number | Optional | PrivateUnsecuredLoanOfferAccepted (this schema) |
| [brokerReference](#brokerreference) | reference | **Required** | PrivateUnsecuredLoanOfferAccepted (this schema) |
| [requestedCredit](#requestedcredit) | `integer` | Optional | PrivateUnsecuredLoanOfferAccepted (this schema) |

## bankAccount
### The bank acccount to pay out the money to

The broker may include an updated bank account for the
applicant. The service provider may ignore this updated field if
not unsupported.


`bankAccount`
* is optional
* type: A Swedish Bank Account with a clearing number
* defined in this schema

### bankAccount Type


* [A Swedish Bank Account with a clearing number](BankAccount.md) – `https://open-broker.org/schema/v0/se/BankAccount`





## brokerReference
### The reference used for the offer being accepted

`brokerReference`
* is **required**
* type: reference
* defined in this schema

### brokerReference Type


* [reference](reference.md) – `https://open-broker.org/schema/v0/se/reference`





## requestedCredit
### Amount of credit wanted by the customer

The amount of credit requested by the user. A service-provider
use this value to set the size of the actual loan within the
bounds set in the loan offer. If this field is missing or
outside the bounds set in the loan offer service-providers
should use the `offeredCredit` value.


`requestedCredit`
* is optional
* type: `integer`
* defined in this schema

### requestedCredit Type


`integer`
* minimum value: `0`





