
# A Swedish Bank Account with a clearing number Schema

```
https://open-broker.org/schema/v0/se/BankAccount
```

A Swedish bank account consisting of a clearing number and an
account number.


| Abstract | Extensible | Status | Identifiable | Custom Properties | Additional Properties | Defined In |
|----------|------------|--------|--------------|-------------------|-----------------------|------------|
| Can be instantiated | No | Experimental | No | Forbidden | Forbidden | [BankAccount.json](BankAccount.json) |

# A Swedish Bank Account with a clearing number Properties

| Property | Type | Required | Defined by |
|----------|------|----------|------------|
| [accountNo](#accountno) | `string` | **Required** | A Swedish Bank Account with a clearing number (this schema) |
| [clearingNo](#clearingno) | `string` | **Required** | A Swedish Bank Account with a clearing number (this schema) |

## accountNo
### Account Number

The account number within the bank (+ branch) identified by the clearingNo.


`accountNo`
* is **required**
* type: `string`
* defined in this schema

### accountNo Type


`string`
* minimum length: 1 characters





## clearingNo
### Clearing number identifying the bank &amp; branch.

The clearing number, also known as the sort code identifies, the
bank along with the branch.


`clearingNo`
* is **required**
* type: `string`
* defined in this schema

### clearingNo Type


`string`
* minimum length: 4 characters
* maximum length: 4 characters
All instances must conform to this regular expression 
(test examples [here](https://regexr.com/?expression=%5E%5B1-9%5D%5B0-9%5D%7B3%7D%24)):
```regex
^[1-9][0-9]{3}$
```





