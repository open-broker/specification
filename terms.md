# Technical terms
## Event driven
//This might be a bit on-the-nose but I think that it might be useful to clarify what and why.

## Producer
The party sending a particular event. This term should be interpreted as defined in the CloudEvents specification.
In this specification a producer should send a message by instigating a connection over the http-protocol as specified in [Cloud events HTTP transportbinding](https://github.com/cloudevents/spec/blob/master/http-transport-binding.md)

## Consumer
The party receiving an event. This term should be interpreted as defined in the CloudEvents specification.
In this specification a producer should send a message by receiving a http-connection on a specific endpoint as specified in [Cloud events HTTP transportbinding](https://github.com/cloudevents/spec/blob/master/http-transport-binding.md)

# Organisational terms [this is a bad name, todo, come up with a better one]
## Customer
The benefactor of the current loan-application (a juridical or physical person).

## Broker
A third party managing the communication of loans and terms between one customer and one to many providers.

## Provider
A lender providing a loan or service to a Customer.
