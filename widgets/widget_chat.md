# Chat

## Options

* ucemeeting: current meeting
* title
* lang
* langs

## Methods

* toggleMode
* clear
* destroy

## Events
### chat.message.new

Sent by an user. It allow to post a new message on a chatroom

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
text           | The message content
lang           | The language of the message

Example:

```javascript
{ "type"     : "chat.message.new",
  "datetime" : 1292601125202,
  "id"       : "91918360913598370296768635184375",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "text":"Bienvenue sur U.C.Engine",
    "lang":"fr"
  }
}
```
