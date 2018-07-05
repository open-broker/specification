
# PrivateUnsecuredLoanDelayedProcessing Schema

```
https://open-broker.org/schema/v0/se/PrivateUnsecuredDelayedProcessing
```

An event indicating that processing of the application is delayed


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Forbidden | [PrivateUnsecuredLoanDelayedProcessing.json](PrivateUnsecuredLoanDelayedProcessing.json) |
## Schema Hierarchy

* PrivateUnsecuredLoanDelayedProcessing `https://open-broker.org/schema/v0/se/PrivateUnsecuredDelayedProcessing`
  * [reference](reference.md) `https://open-broker.org/schema/v0/se/reference`


# PrivateUnsecuredLoanDelayedProcessing Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [brokerReference](#brokerreference) | reference | **Required** | PrivateUnsecuredLoanDelayedProcessing (this schema) |
| [delayReason](#delayreason) | `enum` | **Required** | PrivateUnsecuredLoanDelayedProcessing (this schema) |

## brokerReference
### A reference-id used by the broker

`brokerReference`
* is **required**
* type: reference
* defined in this schema

### brokerReference Type


* [reference](reference.md) – `https://open-broker.org/schema/v0/se/reference`





## delayReason
### the reason for the delay

`delayReason`
* is **required**
* type: `enum`
* defined in this schema

The value of this property **must** be equal to one of the [known values below](#delayreason-known-values).

### delayReason Known Values
| Value | Description |
|-------|-------------|
| `BANK_HOLIDAY` | The application will be processed later because of a holiday |
| `MANUAL_PROCESSING` | The application is being processed manually |
| `OPERATIONAL_ISSUES` | The service provider is experiencing operational issues and processing will be delayed. |
| `OTHER` | The application was delayed for some other reason |



