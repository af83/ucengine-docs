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

*uce.presence.create(auth, credential, org, uid, nickname, callback)*

### Params

* auth: string "password"
* credential: password
* org: organization
* uid: your login
* nickname: visible nickname
* callback

### Example

```javascript
var ucengine = uce.presence.create("password", "pwd", "yourorg", "foo@example.net", "foo bar", function(err, result) {
// do something
});
```

## Attach presence

Attach presence used in all next requests.

*uce.attachPresence(presence)*

```javascript
uce.presence.create("password", "pwd", "yourorg", "foo@example.net", "foo bar", function(err, result) {
    var session = uce.attachPresence(result);
});
```

## Get meeting

*uce.org(name).meeting(meetingname)*
