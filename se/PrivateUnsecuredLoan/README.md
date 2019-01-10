## Private Unsecured Loans - Sweden

Private unsecured loans also known as consumer loans is one of the
products supported by the specification.

The following events are defined for private unsecured loans:

- Application created - [org.open-broker.v0.se.PrivateUnsecuredLoanApplicationCreated](schema-docs/PrivateUnsecuredLoanApplicationCreated.md)
- Processing delayed - [org.open-broker.v0.se.PrivateUnsecuredLoanDelayedProcessing](schema-docs/PrivateUnsecuredLoanDelayedProcessing.md)
- Loan offering - [org.open-broker.v0.se.PrivateUnsecuredLoanOffering](schema-docs/PrivateUnsecuredLoanOffering.md)
- Rejection - [org.open-broker.v0.se.PrivateUnsecuredLoanRejection](schema-docs/PrivateUnsecuredLoanRejection.md)
- Offer accepted - [org.open-broker.v0.se.PrivateUnsecuredLoanOfferAccepted](schema-docs/PrivateUnsecuredLoanOfferAccepted.md)
- Offer rejected - [org.open-broker.v0.se.PrivateUnsecuredLoanOfferRejected](schema-docs/PrivateUnsecuredLoanOfferRejected.md)
- Status updated - [org.open-broker.v0.se.PrivateUnsecuredLoanStatusUpdated](schema-docs/PrivateUnsecuredLoanStatusUpdated.md)
- Loan disbursed - [org.open-broker.v0.se.PrivateUnsecuredLoanDelayedProcessing](schema-docs/PrivateUnsecuredLoanDisbursed.md)
- Bank message - [org.open-broker.v0.se.PrivateUnsecuredLoanBankMessage](schema/PrivateUnsecuredLoanBankMessage.yaml)
- Broker message - [org.open-broker.v0.se.PrivateUnsecuredLoanBrokerMessage](schema/PrivateUnsecuredLoanBrokerMessage.yaml)

An example of an event-flow between broker and service provider could look like this:

1. Broker sends an application created event
2. The service provider sends a processing delayed event indicating that the case will be processed manually.
3. The service provider the sends a loan offering or a rejection event.
4. The customer sends an offer accepted event, indicating that the customer would like to sign for the offered loan.
4. The service provider sends a status updated event indicating that the customer has signed the documents
5. The service provider sends a loan disbursed event indicating that the loan has been disbursed.
6. [END]

Alternate flows:

Service provider denies the application:

- 3.a. A rejection event is sent in response to the application
- 3.b. [END]

Customer rejects the service provider's offer.

- 4.a. The broker sends an offer rejected event

### Direction of Events
Each event type can only be sent in one direction. In other words, each _event type_ can only be sent from
a broker to a bank _or_ from a bank to a broker, but never both ways.

#### Events from Broker to Bank
- Application created
- Offer accepted
- Offer rejected
- Broker message

#### Events from Bank to Broker
- Processing delayed
- Loan offering
- Rejection
- Status updated
- Loan disbursed
- Bank message
