
# PrivateUnsecuredLoanDisbursed Schema

```
https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanDisbursed
```

An event indicating that a private unsecured loan has been
disbursed


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Forbidden | [PrivateUnsecuredLoanDisbursed.json](PrivateUnsecuredLoanDisbursed.json) |

# PrivateUnsecuredLoanDisbursed Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [amountBrokered](#amountbrokered) | `integer` | **Required** | PrivateUnsecuredLoanDisbursed (this schema) |
| [amountDisbursed](#amountdisbursed) | `integer` | **Required** | PrivateUnsecuredLoanDisbursed (this schema) |
| [broker](#broker) | `string` | **Required** | PrivateUnsecuredLoanDisbursed (this schema) |
| [brokerReference](#brokerreference) | `string` | **Required** | PrivateUnsecuredLoanDisbursed (this schema) |

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






## broker
### Domain-name of the broker, in reverse order

Reversed DNS name for the broker, for example, example.com becomes com.example

`broker`
* is **required**
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

`brokerReference`
* is **required**
* type: `string`
* defined in this schema

### brokerReference Type


`string`
* minimum length: 1 characters




