# Uce.js

## Location

uce.js is located at [priv/www/lib/uce.js](https://github.com/AF83/ucengine/blob/master/priv/www/lib/uce.js).

## Dependencies

* jQuery 1.4.4

## Full example

The following example show you how to subscribe to events and do something with them :

```javascript
var client = uce.createClient();
client.auth('uce@example.org', 'pwd', function(err, result) {
    var meeting = client.meeting('demo');
    meeting.on(chat.message.new', function(event) {
        // do something with event
    });
    meeting.startLoop(); // start long polling
});
```

## Create a client

Create a new U.C.Engine client. Return a `UCEngine` instance.

*uce.createClient(baseUrl)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`baseUrl`                              | Base url of API

### Example

```javascript
var client = uce.createClient();
```

## U.C.Engine client

## Properties

Property                               | Description
---------------------------------------|---------------------------------------
`connected`                            | true/false. True if currently connected on API.
`uid`                                  | Current user uid. Null if not connected.

## Register an user (with password)

*UCEngine.user.registerWithPassword(uid, credential, metadata, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`uid`                                  | User id
`credential`                           | Password
`metadata`                             | Metadata attached to the user
`callback`                             |

### Example

```javascript
var client = uce.createClient();
client.user.register("ucengine@example.com", "p4ssw0rd", {location: 'Paris'}, function(err, result) {
    // user registered
});
```

## Register an user (generic)

*UCEngine.user.register(uid, auth, credential, metadata, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`uid`                                  | User id
`auth`                                 | The authentification method (token, password, etc.)
`credential`                           | Password
`metadata`                             | Metadata attached to the user
`callback`                             |

### Example

```javascript
var client = uce.createClient();
client.user.register("ucengine@example.com", "token", "NDQ0MzI2NDQzXzUwMTUwCg", {location: 'Paris'}, function(err, result) {
    // user registered
});
```

## Create a presence

*UCEngine.auth(uid, credential[, metadata], callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`uid`                                  | User id
`credential`                           | Password
`metadata`                             | metadata attached to your presence
`callback`                             |

### Example

```javascript
var client = uce.createClient();
client.auth("ucengine@example.com", "p4ssw0rd", {nickname: "ucengine"}, function(err, result) {
    // presence created
});
```

## Get presence informations

*UCEngine.presence(callback)*

### Parameters

```javascript
var client = uce.createClient();
client.auth("ucengine@example.com", "p4ssw0rd", {nickname: "ucengine"}, function(err, result) {
    client.presence(function(err, presence) {
        // presence exists
    });
)};
```

## Attach presence

Attach a presence to an `UCEngine` instance. It will be used in all next requests.

You can store result of `UCEngine.auth` in localStorage and reuse it later (after hard refresh for example).

*UCEngine.attachPresence(presence)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`presence`                             | A presence object returned by the [method to create a presence](#create-a-presence)

### Example

```javascript
var client = uce.createClient();
client.attachPresence(JSON.parse(window.localStorage.previousPresence));
```

## Get domain informations

*UCEngine.infos.get(callback)*

### Example

```javascript
var client = uce.createClient();
client.infos.get(function(err, infos) {
    // do something with infos
});
```

## Update domain informations

*UCEngine.infos.post(metadata, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`metadata`                             | A flat Object wich represents the metadata attached to the domain
`callback`                             |

### Example

```javascript
var client = uce.createClient();
client.infos.post({description: 'my desc'}, function(err, result) {
    // Info updated
});
```

## Search events in all meetings

*UCEngine.search(terms, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`terms`                                | Javascript hash. See example and [[Search events in U.C.Engine|api#search-events-in-ucengine]],
`callback`                             |

### Example

```javascript
var client = uce.createClient();
client.search({query: 'I want this string',
               type: ['chat.message.new', 'internal.meeting.add']}, function(err, result) {

});
```

## Retrieve a meeting as an object

*UCEngine.meeting(meeting)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting

### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
// do something with meeting
```

## Join a meeting

*UCEngine.meeting(meeting).join(callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`callback`                             |

### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.join(function() {
    // Do something in the meeting
});
```

## Leave a meeting

*UCEngine.meeting(meeting).leave(callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`callback`                             |

### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.join(function() {
    // Do something in the meeting

    meeting.leave(function() {
        // You have left the meeting
    });
});
```

## List the users of a meeting

*UCEngine.meeting(meeting).getRoster(callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`callback`                             |

### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.getRoster(function(err, roster) {
    // The roster is a list of user
    roster.forEach(function(user) {
        // do something with user
    });
});
```

## Push an event

*UCEngine.meeting(meeting).push(type, metadata, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`type`                                 | Type of the event
`metadata`                             | Metadata attached to the event
`callback`                             |

### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.push('my.event', {property: 'some property'}, function(err, result) {
    // event pushed to the server
});
```

## Start long polling

Subscribe to meetings events in long polling.

*UCEngine.meeting(meeting).startLoop(start)*

Parameter                              | Description
---------------------------------------|---------------------------------------
`start`                                |

### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.on('chat.message.new', function(event) {
});
meeting.startLoop();
```

## Wait events

*UCEngine.meeting(meeting).waitEvents(params, callback, one_shot)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`params`                               | See the [events API of U.C.Engine](/api.html#events)
`callback`                             |
`oneshot`                              | Either or not the method should keep looping

## Get events

*UCEngine.meeting(meeting).getEvents(params, callback, onEachEvent)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`params`                               | See the [events API of U.C.Engine](/api.html#events)
`callback`                             | A function to call after all the events have been retrieved
`onEachEvent`                          | A function to call on each retrieved event

## Attach event handler

*UCEngine.meeting(meeting).on(type, callback)*

*UCEngine.meeting(meeting).on(callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`type`                                 | The type of the event to bind
`callback`                             | A function to call on each retrieved event

## Search meeting events

*UCEngine.meeting(meeting).search(terms, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`terms`                                | Javascript hash. See example and [[Search events in U.C.Engine|api#search-events-in-ucengine]],
`callback`                             |

### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.search({query: 'I want this string',
               type: ['chat.message.new', 'internal.meeting.add']}, function(err, result) {

});
```
