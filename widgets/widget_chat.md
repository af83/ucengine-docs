# Chat widget

The chat widget enables a public conversation between the attendants.
It is also integrated with:

* the translation brick: translate the conversation from one language to another
* the twitter brick: display tweet with the designated hashtag

## Location

Chat widget is located at *priv/www/lib/chat/chat.ui.js*.

## Dependencies

* jQuery UI

## Options

* ucemeeting: current meeting
* title
* lang
* langs

## Methods

* clear
* destroy

## Examples

```javascript
$("#placeholder").chat({ucemeeting: meeting, uceclient: client});
```

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
