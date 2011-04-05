# Management widget

The management widget facilitates the management of users, their rights and their interactions.

## Location

Management widget is located at *priv/www/lib/management/management.ui.js*.

## Dependencies

* jQuery UI

## Options

* ucemeeting: current meeting
* title

## Methods

* clear
* destroy

## Examples

```javascript
$("#placeholder").management({ucemeeting: meeting, uceclient: client});
```

## Events
### roster.nickname.update

Sent by an user to set his new nickname

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
nickname       | The new nickname

Example:

```javascript
{ "type"     : "roster.nickname.update",
  "datetime" : 1292601125202,
  "id"       : "91918360913598370296768635184375",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "nickname": "The Dude"
  }
}
```

### meeting.lead.request

Sent by an user to request the lead of the meeting to the `owner`.

Example:

```javascript
{ "type"     : "meeting.lead.request",
  "datetime" : 1292601125202,
  "id"       : "91918360913598370296768635184375",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {}
}
```

### meeting.lead.refuse

Sent by the meeting owner to warn the user that its lead request was refused.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
user           | The id of the user who sent the lead request

Example:

```javascript
{ "type"     : "meeting.lead.refuse",
  "datetime" : 1292601125202,
  "id"       : "91918360913598370296768635184375",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "user"   : "uid_9340329840_41321"
  }
}
```
