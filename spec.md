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
defined in this specification.

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
semantics.

Events MUST be transmitted according to the [CloudEvents webhook specification](https://github.com/cloudevents/spec/blob/master/http-webhook.md).

The payload of the bodies transfered using CloudEvents MUST be a valid body according to the [CloudEvents json format](https://github.com/cloudevents/spec/blob/master/json-format.md)

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
