# Uce.js

## Create user (with password)

*uce.user.registerWithPassword(uid, credential, metadata, callback)*

### Params

* uid: user id
* credential: password
* metadata
* callback

### Example

```javascript
var ucengine = uce.user.register("test@example.net", "password", {}, function(err, result) {
if (err) throw err;
alert("user created");
});
```

## Create user (generic)

*uce.user.register(uid, auth, credential, metadata, callback)*

### Params

* uid: user id
* auth: auth method (token, password, ...)
* credential: password
* metadata
* callback

## Create presence

*uce.presence.create(credential, uid, nickname, callback)*

### Params

* credential: password
* uid: your login
* nickname: visible nickname
* callback

### Example

```javascript
var ucengine = uce.presence.create("pwd", "foo@example.net", "foo bar", function(err, result) {
// do something
});
```

## Attach presence

Attach presence used in all next requests.

*uce.attachPresence(presence)*

```javascript
uce.presence.create("password", "pwd", "foo@example.net", "foo bar", function(err, result) {
    var session = uce.attachPresence(result);
});
```

## Get domain informations

*uce.infos.get(callback)*

```javascript
uce.infos.get(function(err, result) {
    if (err) throw err;
    else console.log(result);
});
```

## Update domain informations

*uce.infos.post(metadata, callback)*

```javascript
uce.infos.post({description: 'my desc'}, function(err, result) {
    if (err) throw err;
});
```

## Get meeting

*uce.meeting(meetingname)*

## Join meeting

*uce.meeting(meeting).join(callback)*

## Leave meeting

*uce.meeting(meeting).leave(callback)*

## Get Roster

*uce.meeting(meeting).getRoster(callback)*

## Push event

*uce.meeting(meeting).push(eventname, metadata, callback)*

```javascript
uce.meeting('demo').push('my_event', {my_property: 'my property'}, function(err, result) {
    if (err) throw err;
    console.log(result); // event recorded
});
```
## Wait events

*uce.meeting(meeting).waitEvents(params, callback, one_shot)*
