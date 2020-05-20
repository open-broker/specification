## Private Unsecured Loans - Sweden

Private unsecured loans, also known as consumer loans, are one of the
products supported by the specification.

The following events are defined for private unsecured loans:

- Application created - [org.open-broker.v0.se.PrivateUnsecuredLoanApplicationCreated](schema/PrivateUnsecuredLoanApplicationCreated.yaml)
- Delayed processing  - [org.open-broker.v0.se.PrivateUnsecuredLoanDelayedProcessing](schema/PrivateUnsecuredLoanDelayedProcessing.yaml)
- Offering - [org.open-broker.v0.se.PrivateUnsecuredLoanOffering](schema/PrivateUnsecuredLoanOffering.yaml)
- Rejection - [org.open-broker.v0.se.PrivateUnsecuredLoanRejection](schema/PrivateUnsecuredLoanRejection.yaml)
- Offer accepted - [org.open-broker.v0.se.PrivateUnsecuredLoanOfferAccepted](schema/PrivateUnsecuredLoanOfferAccepted.yaml)
- Offer rejected - [org.open-broker.v0.se.PrivateUnsecuredLoanOfferRejected](schema/PrivateUnsecuredLoanOfferRejected.yaml)
- Status updated - [org.open-broker.v0.se.PrivateUnsecuredLoanStatusUpdated](schema/PrivateUnsecuredLoanStatusUpdated.yaml)
- Disbursed - [org.open-broker.v0.se.PrivateUnsecuredLoanDisbursed](schema/PrivateUnsecuredLoanDisbursed.yaml)
- Message - [org.open-broker.v0.se.PrivateUnsecuredLoanMessage](schema/PrivateUnsecuredLoanMessage.yaml)

An example of an event-flow between broker and service provider could look like this:

1. Broker sends an application created event
2. The service provider sends a processing delayed event indicating that the case will be processed manually.
3. The service provider then sends a loan offering or a rejection event.
4. The customer sends an offer accepted event, indicating that the customer would like to sign for the offered loan.
4. The service provider sends a status updated event indicating that the customer has signed the documents.
5. The service provider sends a loan disbursed event indicating that the loan has been disbursed.
6. [END]

Alternate flows:

Service provider denies the application:

- 3.a. A rejection event is sent in response to the application
- 3.b. [END]

Customer rejects the service provider's offer:

- 4.a. The broker sends an offer rejected event

### Direction of Events
Each event type can only be sent in one direction. In other words, each _event type_ can only be sent from
a broker to a service provider _or_ from a service provider to a broker, but never both ways.

#### Events from Broker to Service Provider
- Application created
- Offer accepted
- Offer rejected

#### Events from Service Provider to Broker
- Delayed processing
- Offering
- Rejection
- Status updated
- Disbursed
- Message