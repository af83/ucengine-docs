# Uce.js

## Full example

The following example show you how to subscribe to events and do something with them :

```javascript
uce.presence.create("p4ssw0rd", "ucengine@example.com", "uce", function(err, result) {
    var presence = uce.attachPresence(result);
    var meeting = presence.meeting('demo');

    meeting.bind("my.event", function(event) {
        // do something with event
    });
    meeting.startLoop();
});
```

## Register an user (with password)

*uce.user.registerWithPassword(uid, credential, metadata, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`uid`                                  | User id
`credential`                           | Password
`metadata`                             | Metadata attached to the user
`callback`                             |

### Example

```javascript
uce.user.register("ucengine@example.com", "p4ssw0rd", {location: 'Paris'}, function(err, result) {
    // user registered
});
```

## Register an user (generic)

*uce.user.register(uid, auth, credential, metadata, callback)*

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
uce.user.register("ucengine@example.com", "token", "dWlkXzYzNDQ0MzI2NDQzXzUwMTUwCg", {location: 'Paris'}, function(err, result) {
    // user registered
});
```

## Create a presence

*uce.presence.create(credential, uid, nickname, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`credential`                           | Password
`uid`                                  | User id
`nickname`                             | The nickname visible in the meeting
`callback`                             |

### Example

```javascript
uce.presence.create("p4ssw0rd", "ucengine@example.com", "uce", function(err, result) {
    // presence created
});
```

## Attach presence

Attach a new presence. It will be used in all next requests.

*uce.attachPresence(presence)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`presence`                             | A presence object returned by the [method to create a presence](#create-a-presence)

### Example

```javascript
uce.presence.create("p4ssw0rd", "ucengine@example.com", "uce", function(err, result) {
    var presence = uce.attachPresence(result);
    // do something with your presence
});
```

## Get domain informations

*uce.infos.get(callback)*

### Example

```javascript
uce.infos.get(function(err, infos) {
    // do something with infos
});
```

## Update domain informations

*uce.infos.post(metadata, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`metadata`                             | A flat Object wich represents the metadata attached to the domain
`callback`                             |

### Example

```javascript
uce.infos.post({description: 'my desc'}, function(err, result) {
    // Info updated
});
```

## Retrieve a meeting as an object

*uce.meeting(meeting)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting

### Example

```javascript
var meeting = uce.meeting('demo');
// do something with meeting
```

## Join a meeting

*uce.meeting(meeting).join(callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`callback`                             |

### Example

```javascript
var meeting = uce.meeting('demo');
meeting.join(function() {
    // Do something in the meeting
});
```

## Leave a meeting

*uce.meeting(meeting).leave(callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`callback`                             |

### Example

```javascript
var meeting = uce.meeting('demo');
meeting.join(function() {
    // Do something in the meeting

    meeting.leave(function() {
        // You have left the meeting
    });
});
```

## List the users of a meeting

*uce.meeting(meeting).getRoster(callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`callback`                             |

### Example

```javascript
var meeting = uce.meeting('demo');
meeting.getRoster(function(roster) {
    // The roster is a list of user
    for(var i in roster) {
        var user = roser[i];
        // do something with user
    }
});
```

## Push an event

*uce.meeting(meeting).push(type, metadata, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`type`                                 | Type of the event
`metadata`                             | Metadata attached to the event
`callback`                             |

### Example

```javascript
var meetint = uce.meeting('demo')
meeting.push('my.event', {property: 'some property'}, function(err, result) {
    // event pushed to the server
});
```

## Wait events

*uce.meeting(meeting).waitEvents(params, callback, one_shot)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`params`                               | See the [events API of U.C.Engine](/api.html#events)
`callback`                             |
`oneshot`                              | Either or not the method should keep looping

## Get events

*uce.meeting(meeting).getEvents(params, callback, onEachEvent)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`params`                               | See the [events API of U.C.Engine](/api.html#events)
`callback`                             | A function to call after all the events have been retrieved
`onEachEvent`                          | A function to call on each retrieved event

## Attach event handler

*uce.meeting(meeting).bind(type, callback)*

*uce.meeting(meeting).bind(callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`type`                                 | The type of the event to bind
`callback`                             | A function to call on each retrieved event

