
# PrivateUnsecuredLoanOfferRejected Schema

```
https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOfferRejected
```

An event that may be sent by the broker to indicate that the offer
has been rejected.


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Forbidden | [PrivateUnsecuredLoanOfferRejected.json](PrivateUnsecuredLoanOfferRejected.json) |
## Schema Hierarchy

* PrivateUnsecuredLoanOfferRejected `https://open-broker.org/schema/v0/se/PrivateUnsecuredLoanOfferRejected`
  * [reference](reference.md) `https://open-broker.org/schema/v0/se/reference`


# PrivateUnsecuredLoanOfferRejected Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [providerOfferReference](#providerofferreference) | reference | **Required** | PrivateUnsecuredLoanOfferRejected (this schema) |

## providerOfferReference
### The reference used for the offer being rejected

`providerOfferReference`
* is **required**
* type: reference
* defined in this schema

### providerOfferReference Type


* [reference](reference.md) – `https://open-broker.org/schema/v0/se/reference`




