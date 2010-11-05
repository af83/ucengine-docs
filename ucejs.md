# Uce.js

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

Attach presence for next requests. 

*uce.attachPresence(presence)*

```javascript
uce.presence.create("password", "pwd", "yourorg", "foo@example.net", "foo bar", function(err, result) {
    var session = uce.attachPresence(presence);
});
```

## Get meeting

*uce.org(name).meeting(meetingname)*
