
# PrivateUnsecuredLoanStatusUpdated Schema

```
https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanStatusUpdated
```

An event indicating an update to the status of a loan being brokered


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Forbidden | [PrivateUnsecuredLoanStatusUpdated.json](PrivateUnsecuredLoanStatusUpdated.json) |

# PrivateUnsecuredLoanStatusUpdated Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [broker](#broker) | `string` | **Required** | PrivateUnsecuredLoanStatusUpdated (this schema) |
| [brokerReference](#brokerreference) | `string` | **Required** | PrivateUnsecuredLoanStatusUpdated (this schema) |
| [status](#status) | `enum` | **Required** | PrivateUnsecuredLoanStatusUpdated (this schema) |

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





## status
### the new status of the application

`status`
* is **required**
* type: `enum`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#status-known-values).

### status Known Values
| Value | Description |
|-------|-------------|
| `CONTRACT_SENT_TO_CUSTOMER` | A contract has been sent to the customer |
| `CONTRACT_SIGNED` | The contract has been signed |



