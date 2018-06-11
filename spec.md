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

## Event Types

All events specified in this working-copy of the spec shall be in the
namespace `org.open-broker.v0.COUNTRYCODE` where country-code is a two
letter ISO-3166-1 code referring to the country in which the product
is brokered. If this specification were to specify an event for
services brokered within Sweden called `example` its event-type would
be `org.open-broker.v0.SE.example`.

# Event data

The contents of the data attribute is the event data. The definition
of the event depends on the type of the event. The various types of
events are specified and documented in this specification.

The events are to be formatted as JSON and to agree with a strict
format. The root of each event must be a JSON-object.

Each event-type provides a JSON-schema using which the event-data for
a particular event may be validated using that schema.

### Sweden
#### Private unsecured loans

Private unsecured loans also known as consumer loans is one of the
products supported by the specification.

The following events are defined for private unsecured loans:

- Application created - [org.open-broker.v0.se.PrivateUnsecuredLoanApplicationCreated](schema-docs/PrivateUnsecuredLoanApplicationCreated.md)
- Processing delayed - [org.open-broker.v0.se.PrivateUnsecuredLoanDelayedProcessing](schema-docs/PrivateUnsecuredLoanDelayedProcessing.md)
- Loan offering - [org.open-broker.v0.se.PrivateUnsecuredLoanRejection](schema-docs/PrivateUnsecuredRejection.md)
- Rejection - [org.open-broker.v0.se.PrivateUnsecuredLoanOffering](schema-docs/PrivateUnsecuredLoanRejection.md)
- Status updated - [org.open-broker.v0.se.PrivateUnsecuredLoanStatusUpdated](schema-docs/PrivateUnsecuredLoanStatusUpdated.md)
- Loan disbursed - [org.open-broker.v0.se.PrivateUnsecuredLoanDelayedProcessing](schema-docs/PrivateUnsecuredLoanDisbursed.md)

An example of an event-flow between broker and service provider could look like this:

1. Broker sends an application created event
2. The service provider sends a processing delayed event indicating that the case will be processed manually.
3. The service provider the sends a loan offering or a rejection event.
4. The service provider sends a status updated event indicating that the customer has signed the documents
5. The service provider sends a loan disbursed event indicating that the loan has been disbursed.

## Extensibility

Events may, depending on their type, define extension
points. Extension points provide a means of adding extensions to an
object consisting of vendor specific information. An extension point
can consist of any number of such extensions, each identified by the
reversed DNS name of organization adding the extension. For example,
if `example.com` its extension would be identified by the key
`com.example`. Organizations are free to use any sub-domain to
distinguish extensions created within the organization.

Extensions should be used sparingly to add functionality, and should
only be required in special cases. If the functionality could be
considered common it should instead be submitted as a proposal to this
specification.

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
