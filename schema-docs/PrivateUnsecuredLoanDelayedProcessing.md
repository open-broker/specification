
# PrivateUnsecuredLoanDelayedProcessing Schema

```
https://open-broker.org/schema/v0/se/PrivateUnsecuredDelayedProcessing
```

An event indicating that the application was rejected


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Forbidden | [PrivateUnsecuredLoanDelayedProcessing.json](PrivateUnsecuredLoanDelayedProcessing.json) |

# PrivateUnsecuredLoanDelayedProcessing Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [broker](#broker) | `string` | **Required** | PrivateUnsecuredLoanDelayedProcessing (this schema) |
| [brokerReference](#brokerreference) | `string` | **Required** | PrivateUnsecuredLoanDelayedProcessing (this schema) |
| [delayReason](#delayreason) | `enum` | Optional | PrivateUnsecuredLoanDelayedProcessing (this schema) |

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





## delayReason
### the reason for the delay

`delayReason`
* is optional
* type: `enum`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#delayreason-known-values).

### delayReason Known Values
| Value | Description |
|-------|-------------|
| `HOLIDAY` | The application will be processed later because of a holiday |
| `MANUAL_PROCESSING` | The application is being processed manually |
| `OPERATIONAL_ISSUES` | The service provider is experiencing operational issues and processing will be delayed. |



