# Rationale

The lack of a standard way of transfering information between brokers
and consumer banking companies, leads to wasted effort in integrating
systems and increased operational risks used by various actors. This
specification, building, upon established and modern internet standard
aims provide an extensible, validatable method of integrating system
efficiently.

The design allows for middlewares and is suitable for microservice
architectures. Additionally, a design goal is ease of implementation
while not compromising on the semantics.

**Current Status:** Under development

# Overview

This specification defines a number of events that can occur in the
broker - service provider relationship, and how these events should be
transferred between two systems.

The service provider is defined as the party providing a service,
defined in this specification. This might for example be a loan, an
insurance product or a mortgage.

The broker is defined as the actor sending a tender for offers for a
customer to the service provider. Such a tender may be sent to
multiple service providers.

The typical interaction with a broker may include two-way
communication, that is the service provider sending events to the
broker and vice versa. This means that both the service provider and
broker will act as consumers and producers of the events. For the
purposes of this standard the terms consumer and producer are defined
as in the CloudEvents specification. The producer creates events and
the consumer reads events created by the producer.

All interactions between the service provider and the broker are
communicated as well-formed events as defined in the CloudEvents
specification. This separates concerns of transmission, parsing and
semantics, thereby dividing the specification into levels of
processing. These are:

- Transport: Defines how messages are transferred between two parties, ensuring mutual authentication and secrecy.
- Envelope: Defines meta-data and senders for events and handles dispatch based on message types.
- Message: Defines the semantic content of the messages themselves.

# Transport

For transport over the network messages should be sent as HTTP
requests. Transport must be conducted over an encrypted channel such
as TLS, and the identity of the receiver must be authenticated.

The HTTP-request should use the `POST` method and may performed to a
URL decided by consumer and publisher.

Publisher authentication is provided by sending an authorization token
as a bearer token using the authorization header in the HTTP
protocol. To illustrate, `Authorization: Bearer [Base64 encoded
token]`. The bearer token may take two formats, either a valid JWT
token signed by an agreed third party, or an arbitrary secret agreed
by the publisher and consumer.

Example HTTP Request headers

```
POST /open-broker HTTP/1.1
Content-Type: application/json
Authorization: Bearer Tm90ZVRoaXNJc0FuRXhhbXBsZVRva2VuRgo=
```

# Envelopes

The events specified in this document are to be sent using the
CloudEvents format. Implementations should use the JSON-format.

As the CloudEvents format is specified elsewhere we simply refer to it
in the present document.

```
{
    "cloudEventsVersion" : "0.1",
    "eventType" : "org.open-broker.v0.se.PrivateUnsecuredLoanApplication",
    "eventTypeVersion" : "v0",
    "source" : "/mycontext",
    "eventID" : "C234-1234-1234",
    "eventTime" : "2018-04-05T17:31:00Z",
    "extensions" : {
      "comExampleExtension" : "value"
    },
    "contentType" : "application/json",
    "data" : <JSON OBJECT>`
}
```

# Events

The contents of the data attribute is the event. The definition of the
event depends on the type of the event. The various types of events
are specified in the following section.

The events are to be formatted as JSON and to agree with a strict
format. The root of each event must be a JSON-object.

## Extensibility

Events may, depending on their type, define extension
points. Extension points provide a means of adding extensions to an
object consisting of vendor specific information. An extension point
can consist of any number of such extensions, each identified by the
reversed DNS name of organization adding the extension. For example,
if `example.com` its extension would be identified by the key
`com.example`. Organizations are free to use any sub-domain to
distinguish extensions created within the organization.

The content of the extension MUST be a JSON-object containing a
valid JSON subtree; it's structure defined by the extending
organization. Extensions SHOULD NOT be used to overload data that
already exists in the specification.

Extension points can only be used when a defined event type contains a
value of the type `ExtensionPoint`, in those cases an extension point
is defined it's name shall be `extensions`. Its cardinaility shall be
`0..1`, that is the field can be null, indicating that no extensions
were added.

```
{
  "extensions": {
    "com.example": {
      "someField": "foo"
    }
  }
}
```

# Defined Event Types

All events specified in this working-copy of the spec shall be in
namespace `org.open-broker.v0.COUNTRYCODE` where country-code is a two
letter ISO-3166-1 code referring to the country in which the new loan
is requested. If this specification were to specify an event for
services brokered within Sweden called `example` its event-type would
be `org.open-broker.v0.SE.example`.

- Name: the name of the field in the JSON format
- Cardinality (C.): `0..1` indicates an optional field. `1` indicates a
  required field. `0..*` indicates a list of at least zero elements.
  `1..*` indicates a list of atleast one element. `1..2` indicates a
  list of one or two elements.
- Type: As defined in the field types section below.
- Version (V.): The first version of the spec that it was included in.

## Field types

There are three kinds of types considered in this specification. The
first kind of types include the primitive types defined in JSON,
`string`, `number` and `boolean`, these are written in lower-case.

The second kind of types are constrained primitives and are
constrained versions of the primitive types. The constrained types are
written in lower-case.

The constrained primitive types are

| Name           | Primitive | Description                                               | Constraint type | Constraint                                            |
|----------------|-----------|-----------------------------------------------------------|-----------------|-------------------------------------------------------|
| reverse-dns    | string    | Reverse domain name notation                              | regex           | [dns-regex](#dns-regex)                               |
| decimal-number | string    | Decimal number protected from float-parsing in json layer | regex           | [decimal-regex](#decimal-regex)                       |
| e164           | string    | Phone number formatted according to the E.164             | regex           | [e164-regex](#e164-regex)                             |
| country-code   | string    | Two letter, ISO 3166-1 alpha-2 country code               | regex           | [iso-3166-1-alpha-2-regex](#iso-3166-1-alpha-2-regex) |

- <b id="dns-regex">dns-regex:</b>  ^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$
- <b id="decimal-regex">decimal-regex:</b> ^[0-9]+(\.[0-9]+)?$
- <b id="e164-regex">e164-regex:</b> ^\+[1-9][0-9]{1,14}$
- <b id="iso-3166-1-alpha-2-regex">iso-3166-1-alpha-2-regex:</b> ^[A-Z]{2}$

The third kind of types are complex objects, these are written in
`CamelCase` and defined as they are used in the specification.


## PrivateUnsecuredLoanApplicationCreated

This event pertains to the application or tender for offer for Swedish
unsecured loan customers.

Event (root element)

| Name                  | C.   | Type                      | V. | Remark                                   |
|-----------------------|------|---------------------------|----|------------------------------------------|
| application           | 1    | Application               | v0 | Contains the loan application            |
| broker                | 0..1 | reverse-dns               | v0 | Domain-name of the broker                |
| brokerReference       | 0..1 | string                    | v0 | Per-broker unique, not globally          |
| dataProtectionContext | 1    | DataProtectionContext | v0 | Sets data-protection rules for the event |

Application

| Name            | C.   | Type           | V. | Remark                              |
|-----------------|------|----------------|----|-------------------------------------|
| loanAmount      | 1    | number         | v0 | Total N/o SEK applied for           |
| termMonths      | 1    | number         | v0 | N/o desired years term for loan     |
| refinanceAmount | 0..1 | number         | v0 | N/o SEK which are refinanced        |
| applicant       | 1    | Applicant      | v0 | Main applicant                      |
| coApplicant     | 0..1 | Applicant      | v0 | co-Applicant                        |
| loanPurpose     | 1    | LoanPurpose    | v0 | Primary purpose of getting the loan |
| extensions      | 0..1 | ExtensionPoint | v0 |                                     |

DataProtectionContext

| String value | Remark                                                   |
|--------------|----------------------------------------------------------|
| REAL         | Production data consisting concerning real data-subjects |
| FICTIONAL    | Fictional data, does not concern real data-subjects      |

Consumers MAY reject or refuse to process data sent in the `REAL` data
protection context if the consumer deems it cannot secure the data
being sent. Additionally consumers may reject `FICTIONAL` data if
processing may affect real persons, for example, ordering a hard credit
inquiry.

LoanPurpose

| String value        | Remark                                         |
|---------------------|------------------------------------------------|
| REFINANCE           | refinancing existing debt                      |
| HOME_REMODELLING    | Home remodelling or renovation                 |
| HEALTHCARE_EXPENSES | To finance health-care costs.                  |
| DIVORCE_PROCEEDINGS | To finance costs relating to a divorce.        |
| HOME_DOWNPAYMENT    | To finance a downpayment for a loan            |
| EDUCATION           | To finance education of some kind              |
| TRAVEL              | To finance a vacation or other travel expenses |
| CAR                 | To finance the purchase of a car or similar    |
| OTHER               | Purpose not fitting the above categories       |

Applicant

| Name                        | C.   | Type             | V. | Remark                                                  |
|-----------------------------|------|------------------|----|---------------------------------------------------------|
| ssn                         | 1    | string           | v0 | Swedish Social Security Number, with century, 12 digits |
| phone                       | 0..1 | e164             | v0 | Primary phone number                                    |
| secondaryPhone              | 0..* | e164             | v0 | Secondary phone numbers                                 |
| emailAddress                | 0..1 | string           | v0 | Email address on the form local.part@host.tld           |
| employmentStatus            | 1    | EmploymentStatus | v0 |                                                         |
| employmentStatusSinceYear   | 1    | number           | v0 | Year since common era                                   |
| employmentStatusSinceMonth  | 1    | number           | v0 | Number beteween 1 and 12                                |
| dependentChildren           | 1    | number           | v0 | Range may be truncated by receiving party               |
| housingType                 | 1    | HousingType      | v0 |                                                         |
| housingCostPerMonth         | 1    | number           | v0 | Cost relating to housing in SEK                         |
| maritalStatus               | 1    | MaritalStatus    | v0 |                                                         |
| employerName                | 0..1 | string           | v0 | Name of the primary employer                            |
| employerPhone               | 0..1 | e164             | v0 | Phone number of employer                                |
| extensions                  | 0..1 | ExtensionPoint   | v0 |                                                         |
| childSupportReceivedMonthly | 0..1 | number           | v0 | 0 - to indicate not received, missing field unknown     |
| childSupportPaidMonthly     | 0..1 | number           | v0 | 0 - to indicate not received, missing field unknown     |
| housingCostMonthly          | 0..1 | number           | v0 |                                                         |
| bankAccount                 | 0..1 | AccountNo        | v0 |                                                         |
| citizenships                | 0..* | country-code     | v0 |                                                         |
| countriesOfResidence        | 1..* | country-code     | v0 |                                                         |
| taxResidentOf               | 1..* | country-code     | v0 |                                                         |
| tentativeAddress            | 0..* | Address          | v0 | Tentative address information                           |

Address.

| Name       | C. | Type   | V. | Remark |
|------------|----|--------|----|--------|
| firstName  | 1  | String | v0 |        |
| lastName   | 1  | String | v0 |        |
| address    | 1  | String | v0 |        |
| city       | 1  | String | v0 |        |
| postalCode | 1  | String | v0 |        |
| careOf     | 1  | String | v0 |        |

AccountNo.

| Name       | C. | Type   | V. | Remark |
|------------|----|--------|----|--------|
| clearingNo | 1  | string | v0 |        |
| accountNo  | 1  | string | v0 |        |

EmploymentStatus.

| String value  | Remark                                               |
|---------------|------------------------------------------------------|
| FULL_TIME     |                                                      |
| TRIAL         | Trial employment sv. Provanställning                 |
| RETIRED       | Retired due to age                                   |
| HOURLY        | Works fewer than 40h per week                        |
| TEMPORARY     | Non-full time employment pertaining to a project     |
| SELF_EMPLOYED |                                                      |
| HOURLY        | Formally permanently employed, hired by the hour     |
| EARLY_RETIRED |                                                      |
| STUDENT       | Signed up to a university or other higher education  |
| UNEMPLOYED    |                                                      |
| OTHER         |                                                      |




HousingType

| String value  | Remark |
|---------------|--------|
| RENTED        |        |
| OWN_APARTMENT |        |
| OWN_HOUSE     |        |
| LIVE_IN       |        |

MaritalStatus

| String value | Remark |
|--------------|--------|
| SINGLE       |        |
| MARRIED      |        |
| COHABITING   |        |


# A complete example

``` json
{
  "cloudEventsVersion": "0.1",
  "eventType": "org.open-broker.v0.se.PrivateUnsecuredLoanApplication",
  "eventTypeVersion": "v0",
  "source": "broker.example/applications",
  "eventID": "60170DB35282F2",
  "eventTime": "2018-04-05T17:31:00Z",
  "contentType": "application/json",
  "data": {
    "application": {
      "loanAmount": 50000,
      "termYears": 3,
      "applicant": {
        "ssn": "195911057916",
        "phone": "+467015114441",
        "secondaryPhone": ["+465062718282"],
        "employmentStatus": "FULL_TIME",
        "employmentStatusSinceYear": 2014,
        "employmentStatusSinceMonth": 3,
        "dependentChildren": 0,
        "housingType": "OWN_HOUSE",
        "housingCostPerMonth": 8000,
        "maritalStatus": "MARRIED",
        "employer": "ACME AB",
        "employerPhone": "+465069158975"
      }
    }
  }
}
```


## PrivateUnsecuredLoanOffering

This event pertains to offers for unsecured loans for Swedish customers.

Event (root element)

| Name            | C.   | Type        | V. | Remark                          |
|-----------------|------|-------------|----|---------------------------------|
| offer           | 1    | Application | v0 | Contains the offer for loan     |
| broker          | 1    | reverse-dns | v0 | Domain-name of the broker       |
| brokerReference | 1    | string      | v0 | Per-broker unique, not globally |

Offer

| Name                  | C.   | Type               | V. | Remark                                                                         |
|-----------------------|------|--------------------|----|--------------------------------------------------------------------------------|
| effectiveInterestRate | 1    | decimal-number     | v0 | A number formatted as a string to reduce risk of rounding error                |
| nominalInterestRate   | 1    | decimal-number     | v0 | A number formatted as a string to reduce risk of rounding error                |
| minOfferedCredit      | 1    | number             | v0 | The smallest amount that can be offered at the current nominal interest rate * |
| offeredCredit         | 1    | number             | v0 | Offered amount, this is the value that the APR is based on.                    |
| maxOfferedCredit      | 1    | number             | v0 | The largest amount that can be offered at the current nominal interest rate *  |
| arrangementFee        | 1    | number             | v0 | The initial payment for establishment of the loan                              |
| termFee               | 1    | number             | v0 | Fixed fees to be paid along with amortisation and interest every month         |
| termMonths            | 1    | number             | v0 | The offered term of the loan expressed as months                               |
| loanInsuranceOffer    | 0..1 | LoanInsuranceOffer | v0 | If any optional insurance is offered along with the loan                       |

 ** If there is no leeway in the offer the min amount and the max amount should be set to the offeredCredit value


LoanInsuranceOffer

| Name           | C.   | Type       | V. | Remark
|----------------|------|------------|----|---------
| insuredAmount  | 1    | number     | v0 |
| monthlyPremium | 1    | number     | v0 |
| descriptiveText| 0..1 | string     | v0 |



## PrivateUnsecuredDelayedProcessing

This event signifies that the processing of a request will take longer time than usual
This is usually due to manual processing of the application.
This event is not needed but might be provided as a courtesy.

| Name            | C.   | Type        | V. | Remark                          |
|-----------------|------|-------------|----|---------------------------------|
| delayReason     | 0..1 | DelayReason | v0 | Contains the loan application   |
| broker          | 1    | reverse-dns | v0 | Domain-name of the broker       |
| brokerReference | 1    | string      | v0 | Per-broker unique, not globally |

DelayReason

| String value      | Remark |
|--------------------|--------|
| MANUAL_PROCESSING  |        |
| HOLIDAY            |        |
| OPERATIONAL_ISSUES |        |

## PrivateUnsecuredLoanRejection

This event pertains denials of unsecured loans for Swedish customers.

| Name            | C.   | Type        | V. | Remark                          |
|-----------------|------|-------------|----|---------------------------------|
| rejectionReason | 0..1 | Application | v0 | Contains the loan application   |
| broker          | 1    | reverse-dns | v0 | Domain-name of the broker       |
| brokerReference | 1    | string      | v0 | Per-broker unique, not globally |
