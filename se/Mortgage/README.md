# Open Broker for Mortgage Brokering in Sweden
This specification defines events and content of these events for handling communication between a broker
and a provider on behalf of a cutomer that has a mortgage which they want to refinance.

## Versions of OpenBroker Specification for Mortgage
 - [v0](v0) - Status: *Under development*

## How to Use The Open Broker Specification
## Events
The following event are defined by the Open Broker specification

- Application created - the broker sends an application for refinancing a mortgage to the provider
- Rejection - the application was rejected by the provider
- Offering - the provider sends an offer
- Offer accepted - the broker informs the provider that the applicant has accepted the offer
- Offer rejected - the broker informs the provider that the applicant has rejected the offer
- Contract sent - the provider has sent a contract to the applicant
- Contract signed - the provider informs the broker that the applicant has signed the contract
- Disbursed - the loan has been paid out the applicant's bank account
- Message - a human readable message from the provider to the broker

Each event type can only be sent in one direction, either from broker to provider or from provider to broker,
but never in both direction.
### Broker Events
A broker event is an event originating from a broker which is sent to a provider.

- Application created
- Offer accepted
- Offer rejected
### provider Events
A provider event is an event originating from a provider which is sent to a broker.

- Application rejection
- Offering
- Contract sent
- Contract signed
- Disbursed
- Message