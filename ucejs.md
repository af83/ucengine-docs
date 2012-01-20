# Uce.js

## Location

uce.js is located at [wwwroot/lib/uce.js](https://github.com/AF83/ucengine/blob/master/wwwroot/lib/uce.js).

## Dependencies

* jQuery >= 1.4.4

## Full example

The following example show you how to subscribe to events and do something with them :

```javascript
var client = uce.createClient();
client.auth('uce@example.org', 'pwd', function(err, result) {
    var meeting = client.meeting('demo');
    meeting.on('chat.message.new', function(event) {
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
var client = uce.createClient("http://demo.ucengine.org"); // works only if your browser support cors.
```

## U.C.Engine client

## Properties

Property                               | Description
---------------------------------------|---------------------------------------
`connected`                            | true/false. True if currently connected on API.
`uid`                                  | Current user uid. Null if not connected.

## Register a user (with password)

*UCEngine.user.registerWithPassword(name, credential, metadata, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`name`                                 | User name
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

## Register a user (generic)

*UCEngine.user.register(name, auth, credential, metadata, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`name`                                 | User name
`auth`                                 | The authentification method (password, none, etc.)
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

## Add an existing role to a user

*UCEngine.user.addRole(uid, role, location, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`uid`                                  | User id
`role`                                 | The name of the role to give to the user
`location`                             | The location/meeting where the role applies
`callback`                             |

### Example

```javascript
var client = uce.createClient();
client.user.addRole("91020740579212808535843549778848", "speaker", "demo", function(err, result) {
   // Role added to the user
});
```

## Delete a role from a user

*UCEngine.user.delRole(uid, role, location, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`uid`                                  | User id
`role`                                 | The name of the role to give to the user
`location`                             | The location/meeting where the role applies
`callback`                             |

### Example

```javascript
var client = uce.createClient();
client.user.delRole("91020740579212808535843549778848", "speaker", "demo", function(err, result) {
   // Role deleted from a user
});
```

## Add a new role

*UCEngine.role.add(name, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`name`                                 | The name of the new role
`callback`                             |

### Example

```javascript
var client = uce.createClient();
client.role.add("speaker", function(err, result) {
   // Role added
});
```

## Delete a role

*UCEngine.role.del(name, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`name`                                 | The name of the role to delete
`callback`                             |

### Example

```javascript
var client = uce.createClient();
client.role.del("speaker", function(err, result) {
   // Role deleted
});
```

## Add an access right to an existing role

*UCEngine.role.addAccess(role, action, object, conditions, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`role`                                 | The name of the role
`action`                               | The action to allow
`object`                               | The object on which the `action` is performed
`conditions`                           | A dictionary of conditions
`callback`                             |

### Notes

See the [[ACL|acl]] page for a list of all the available
`actions`, `objects` and `conditions`.

### Example

```javascript
var client = uce.createClient();
client.role.addAccess("speaker", "add", "event", {'type': 'chat.message.new'}, function(err, result) {
   // The access right has been added
   // Now all the users with the role 'speaker' can push an event with a `chat.message.new` type.
});
```

## Delete an access right from an existing role

*UCEngine.role.delAccess(role, action, object, conditions, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`role`                                 | The name of the role
`action`                               | The action to allow
`object`                               | The object on which the `action` is performed
`conditions`                           | A dictionary of conditions
`callback`                             |

### Notes

See the [[ACL|acl]] page for a list of all the available
`actions`, `objects` and `conditions`.

### Example

```javascript
var client = uce.createClient();
client.role.deleteAccess("speaker", "add", "event", {'type': 'chat.message.new'}, function(err, result) {
   // The access right has been deleted
   // Now, the users with the role 'speaker' cannot push an event with a 'chat.message.new' type anymore.
});
```

## Check access rights

*UCEngine.user.can(uid, action, object, conditions, location, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`uid`                                  | The user id
`action`                               | The action to allow
`object`                               | The object on which the `action` is performed
`conditions`                           | A dictionary of conditions
`location`                             | The location
`callback`                             |

### Notes

See the [[ACL|acl]] page for a list of all the available
`actions`, `objects` and `conditions`.

### Example

```javascript
var client = uce.createClient();
client.user.can('user@example.com', 'add', 'event', {'type': 'chat.message.new'}, 'meetingname', function(err, result) {
   // if 'result' is true the user has the right to add an event of type 'chat.message.new'
});
```

## Create a presence

*UCEngine.auth(name, credential[, metadata], callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`name`                                 | User name
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

## Search events in all meetings

*UCEngine.search(terms, [options, ]callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`terms`                                | Javascript hash. See example and [[Search events in U.C.Engine|api#search-events-in-ucengine]],
`options`                              | Javascript hash for pagination and order
`callback`                             |

### Example

```javascript
var client = uce.createClient();
client.search({query: 'I want this string',
               type: ['chat.message.new', 'internal.meeting.add']}, {order: 'desc'}, function(err, result) {

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

*UCEngine.meeting(meeting).join(metadata, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`metadata`                             | Metadata associated to the internal.roster.add
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

## Delete a file uploaded on the meeting

*UCEngine.meeting(meeting).delFile(id, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`id`                                   | The id of the file to delete
`callback`                             |

### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.delFile("file_id", function(err, result) {
  // The file is deleted
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

## Push a private event

*UCEngine.meeting(meeting).pushTo(to, type, metadata, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`type`                                 | Type of the event
`to`                                   | The user uid of the recipient
`metadata`                             | Metadata attached to the event
`callback`                             |

### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.pushTo('recipient@example.com', 'my.event', {property: 'some property'}, function(err, result) {
    // event pushed to the server
});
```

## Start retrieving live events

Subscribe to meetings events with long polling or streaming api..

*UCEngine.meeting(meeting).startLoop([start, transports])*

Parameter                              | Description
---------------------------------------|---------------------------------------
`start`                                | datetime of last event
`transports`                           | transports to retrieve events (see waitEvents)

### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.on('chat.message.new', function(event) {
});
meeting.startLoop();
```

## Wait events

*UCEngine.meeting(meeting).waitEvents(params, callback, [one_shot, transports])*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`params`                               | See the [events API of U.C.Engine](/api.html#events)
`callback`                             |
`oneshot`                              | Either or not the method should keep looping
`transports`                           | Transports to retrieve events (*longpolling* or *eventsource*). Default is all transports.

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

*UCEngine.meeting(meeting).search(terms, [options, ]callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`terms`                                | Javascript hash. See example and [[Search events in U.C.Engine|api#search-events-in-ucengine]]
`options`                              | Javascript hash for pagination and order
`callback`                             |

### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.search({query: 'I want this string',
               type: ['chat.message.new', 'internal.meeting.add']}, function(err, result) {

});
```

## ACL in meeting

*UCEngine.meeting(meeting).can(uid, action, object, conditions, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`uid`                                  | The user id
`action`                               | The action to allow
`object`                               | The object on which the `action` is performed
`conditions`                           | A dictionary of conditions
`callback`                             |


### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.can('test@example.com', 'update', 'meeting', {}, function(err, result) {
 // result is true or false
});
```

## ACL for the current user in meeting

*UCEngine.meeting(meeting).canCurrentUser(action, object, conditions, callback)*

### Parameters

Parameter                              | Description
---------------------------------------|---------------------------------------
`meeting`                              | The name of the meeting
`action`                               | The action to allow
`object`                               | The object on which the `action` is performed
`conditions`                           | A dictionary of conditions
`callback`                             |


### Example

```javascript
var client = uce.createClient();
var meeting = client.meeting('demo');
meeting.canCurrentUser('update', 'meeting', {}, function(err, result) {
 // result is true or false
});
```
