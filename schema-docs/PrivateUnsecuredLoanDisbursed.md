
# PrivateUnsecuredLoanDisbursed Schema

```
https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanDisbursed
```

An event indicating that a private unsecured loan has been
disbursed


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Forbidden | [PrivateUnsecuredLoanDisbursed.json](PrivateUnsecuredLoanDisbursed.json) |
## Schema Hierarchy

* PrivateUnsecuredLoanDisbursed `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanDisbursed`
  * [reference](reference.md) `https://open-broker.org/schema/v0/se/reference`


# PrivateUnsecuredLoanDisbursed Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [amountBrokered](#amountbrokered) | `integer` | **Required** | PrivateUnsecuredLoanDisbursed (this schema) |
| [amountDisbursed](#amountdisbursed) | `integer` | **Required** | PrivateUnsecuredLoanDisbursed (this schema) |
| [brokerReference](#brokerreference) | reference | **Required** | PrivateUnsecuredLoanDisbursed (this schema) |

## amountBrokered
### Amount considered brokered by the lender

The amount the lender considers the broker to have
brokered. For example, the amount disbursed exclusive
of loans refinanced within the lender.


`amountBrokered`
* is **required**
* type: `integer`
* defined in this schema

### amountBrokered Type


`integer`
* minimum value: `0`






## amountDisbursed
### Amount disbursed

The total amount disbursed to
the customer of the loan being brokered


`amountDisbursed`
* is **required**
* type: `integer`
* defined in this schema

### amountDisbursed Type


`integer`
* minimum value: `0`






## brokerReference
### A reference-id used by the broker

`brokerReference`
* is **required**
* type: reference
* defined in this schema

### brokerReference Type


* [reference](reference.md) – `https://open-broker.org/schema/v0/se/reference`




