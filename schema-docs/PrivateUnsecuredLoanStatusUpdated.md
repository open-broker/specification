
# PrivateUnsecuredLoanStatusUpdated Schema

```
https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanStatusUpdated
```

An event indicating an update to the status of a loan being brokered


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Forbidden | [PrivateUnsecuredLoanStatusUpdated.json](PrivateUnsecuredLoanStatusUpdated.json) |
## Schema Hierarchy

* PrivateUnsecuredLoanStatusUpdated `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanStatusUpdated`
  * [reference](reference.md) `https://open-broker.org/schema/v0/se/reference`


# PrivateUnsecuredLoanStatusUpdated Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [brokerReference](#brokerreference) | reference | **Required** | PrivateUnsecuredLoanStatusUpdated (this schema) |
| [status](#status) | `enum` | **Required** | PrivateUnsecuredLoanStatusUpdated (this schema) |

## brokerReference
### A reference-id used by the broker

`brokerReference`
* is **required**
* type: reference
* defined in this schema

### brokerReference Type


* [reference](reference.md) – `https://open-broker.org/schema/v0/se/reference`





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



