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
broker-bank relationship, and how these events should be transferred
between two systems.

The standard defines the behaviour of two actors, the producer and the
consumer, as defined in the CloudEvents specification. The producer
creates events and the consumer reads events created by the
producer. In order to ensure an engaging end user experience both parties
will act in both roles as defined by this standard.

Additionally behaviour in this specification is defined on three
levels of operations.

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
- Type: Lower-case indicates built-in types: `string`, `number`,
  `boolean`, A type specified in `CamelCase` refers to a definition as
  follows below.
- Version (V.): The first version of the spec that it was included in.

## PrivateUnsecuredLoanApplicationCreated

This event pertains to the application or tender for offer for Swedish
unsecured loan customers.

Event (root element)

| Name        | C. | Type        | V. | Remark                        |
|-------------|----|-------------|----|-------------------------------|
| application | 1  | Application | v0 | Contains the loan application |


Application

| Name            | C.   | Type           | V. | Remark                              |
|-----------------|------|----------------|----|-------------------------------------|
| loanAmount      | 1    | number         | v0 | Total N/o SEK applied for           |
| termYears       | 1    | number         | v0 | N/o desired years term for loan     |
| refinanceAmount | 0..1 | number         | v0 | N/o SEK which are refinanced        |
| applicant       | 1    | Applicant      | v0 | Main applicant                      |
| coApplicant     | 0..1 | Applicant      | v0 | co-Applicant                        |
| loanPurpose     | 1    | LoanPurpose    | v0 | Primary purpose of getting the loan |
| extensions      | 0..1 | ExtensionPoint | v0 |                                     |

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

Applicant

| Name                       | C.   | Type             | V. | Remark                                                  |
|----------------------------|------|------------------|----|---------------------------------------------------------|
| ssn                        | 1    | string           | v0 | Swedish Social Security Number, with century, 12 digits |
| phone                      | 0..1 | string           | v0 | Phonenumber formatted as E.164                          |
| emailAddress               | 0..1 | string           | v0 | Email address on the form local.part@host.tld           |
| employmentStatus           | 1    | EmploymentStatus | v0 |                                                         |
| employmentStatusSinceYear  | 1    | number           | v0 | Year since common era                                   |
| employmentStatusSinceMonth | 1    | number           | v0 | Number beteween 1 and 12                                |
| dependentChildren          | 1    | number           | v0 | Range may be truncated by receiving party               |
| housingType                | 1    | HousingType      | v0 |                                                         |
| housingCostPerMonth        | 1    | number           | v0 | Cost relating to housing in SEK                         |
| maritalStatus              | 1    | MaritalStatus    | v0 |                                                         |
| employerName               | 0..1 | string           | v0 | Name of the primary employer                            |
| employerPhone              | 0..1 | string           | v0 | PhoneNo to primary employer as  E.164                   |
| extensions                 | 0..1 | ExtensionPoint   | v0 |                                                         |

EmploymentStatus.

| String value  | Remark                                           |
|---------------|--------------------------------------------------|
| FULLTIME      |                                                  |
| TRIAL         | Trial employment sv. Provanställning             |
| RETIRED       | Retired due to age                               |
| HOURLY        | Works fewer than 40h per week                    |
| PROJECT       | Non-full time employment pertaining to a project |
| SELF_EMPLOYED |                                                  |


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
        "phone": "+464315114441",
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
