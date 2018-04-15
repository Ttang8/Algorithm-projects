## Restful API
  - REST stands for Representational State Transfer
  - Roy T Fielding coined the term in 2000, in his PhD dissertation Architectural Styles and the Design of Network-based Software Architectures.
### Fielding Constraints
  - Architectural constraints that a system must satisfy to be considered RESTful
#### Client-server
  - Network must be made up of clients and servers.
  - opposite of non-Restful architecture where there is not one to one communication rather a broadcasting and eavesdropping method
  - RESTful requires one to one communication.
#### Stateless
  - Both connections do not keep track of each other's states.
#### Uniform Interface
  - common language between servers and clients that allows each part to be swapped out or modified without breaking the entire system.
  - 4 sub constraints( identification of resources, manipulation of resources through representations, self-descriptive messages, and hypermedia)
##### Identification of resources
  - "stable" identifier, does not change across interactions.
##### Manipulation of resources through representations
  - When client wishes to make changes to resource, it sends the server a representation.  Server still has ultimate control
  - Server can send back a response of whether the post was created or problem.
  - Non-restful, client may be sending literal instructions for operations such as "add a new line"
##### Self-descriptive messages
  - Contains all the information that the recipient needs to understand.
##### hypermedia
  - data sent from the server to the client that contains information about what the client can do next.

#### Caching
  - server responses should be labelled as either cacheable or non-cacheable.
#### Layered system
  - there can be more components than just servers and clients
#### Code on demand
  - optional constraint
    - refers to the ability for a server to send executable code to the clients
    - example is HTML's script tag
      - when HTML document is loaded, the browser automatically fetches the javascript from the server and executes it locally
