# Chat widget

The chat widget enables a public conversation between the attendants.
It is also integrated with:

* the [[translation brick|brick_translation]]: translate chat messages from one language to another
* the [[twitter brick|brick_twitter]]: display tweets of a particular hashtag

## Location

https://github.com/AF83/ucengine-widgets

## Dependencies

* [[jQuery UI|http://jqueryui.com/]]
* [[UCE widget|https://github.com/AF83/ucengine/blob/master/priv/www/lib/ucewidget.js]]

## Options

Option         | Description
---------------|---------------------------------------------------------------
ucemeeting     | The current meeting
uceclient      | The client
title          | The title to display in the widget header
lang           | The default language
langs          | The available languages

## Methods

Method         | Description
---------------|---------------------------------------------------------------
clear          | Reinitialize the widget
destroy        | Destroy the widget

## Javascript Events

Name         | Description
-------------|---------------------------------------------------------------
updated      | called when a new message is received

## Examples

```javascript
$("#placeholder").chat({ucemeeting: meeting, uceclient: client});
```

## Events
### chat.message.new

Sent by a user. It allow to post a new message on a chatroom.

Metadata       | Description
---------------|---------------------------------------------------------------
text           | The message content
lang           | The language of the message

Example:

```javascript
{ "type"     : "chat.message.new",
  "domain"   : "localhost",
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

### twitter.hashtag.add

Sent by a user. It allow you to say that you want a new hashtag to be minitored.
See the [[Twitter brick|brick_twitter]] for more informations.

Metadata       | Description
---------------|---------------------------------------------------------------
hashtag        | The hashtag you want to monitor

Example:

```javascript
{ "type"     :"twitter.hashtag.add",
  "domain"   : "localhost",
  "datetime" :1302532593023,
  "id"       :"24535972794006181696054633929989",
  "location" :"demo",
  "from"     :"82435388420458600092293846199231",
  "metadata" : {
    "hashtag" : "#ucengine"
  }
}
```
