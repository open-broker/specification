
# reference Schema

```
https://open-broker.org/schema/v0/se/reference
```

A reference used for identification of an event. Consisting of two
parts an issuer domain name of the form `com.example`, and an
arbitrary id string. The values, taken together must be unique.

In other words, the issuing organization can issue an ID once only.


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Forbidden | [reference.json](reference.json) |

# reference Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [id](#id) | `string` | Optional | reference (this schema) |
| [issuer](#issuer) | `string` | Optional | reference (this schema) |

## id
### Reference number for the broker

An arbitrary reference string that is unique

`id`
* is optional
* type: `string`
* defined in this schema

### id Type


`string`






## issuer
### Domain-name of the issuer of the reference, in reverse order

Reversed DNS name for the broker, for example, example.com becomes com.example

`issuer`
* is optional
* type: `string`
* defined in this schema

### issuer Type


`string`


All instances must conform to this regular expression 
(test examples [here](https://regexr.com/?expression=%5E((%5Ba-zA-Z0-9%5D%7C%5Ba-zA-Z0-9%5D%5Ba-zA-Z0-9-%5D%5Ba-zA-Z0-9%5D).)(%5BA-Za-z0-9%5D%7C%5BA-Za-z0-9%5D%5BA-Za-z0-9-%5D*%5BA-Za-z0-9%5D))):
```regex
^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9-][a-zA-Z0-9]).)([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9-]*[A-Za-z0-9])
```





