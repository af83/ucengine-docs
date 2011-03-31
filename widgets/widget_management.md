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
