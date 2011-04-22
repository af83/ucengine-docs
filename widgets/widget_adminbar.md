# Admin Bar widget

The admin bar is a widget used by the meeting owner to organize the
meeting's workspace and features.

## Location

The admin bar widget is located at
*priv/www/demo/javascript/adminbar*.

## Depencies

* [[jQuery UI|http://jqueryui.com/]]
* [[jQuery Carousel Plugin|http://sorgalla.com/projects/jcarousel/]]

## Options

Option         | Description
---------------|---------------------------------------------------------------
widgets        | The list of available widgets
ucemeeting     | The current meeting
uceclient      | The client object returned by uce.createClient()

## Widgets parameter format

Option         | Description
---------------|---------------------------------------------------------------
title          | The widget title
description    | A small description of the widget
thumbnail      | A path to the widget's thumbnail

## Methods

Method         | Description
---------------|---------------------------------------------------------------
destroy        | Destroy the widget

## Events
### admin.meeting.close

Sent by the meeting owner to close the meeting of the participants

Example:
```javascript
{ "type"     : "admin.meeting.close",
  "domain"   : "localhost",
  "datetime" : 1292601125202,
  "id"       : "91918360913598370296768635184375",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {}
}
```

## Examples

```javascript
$("#placeholder").adminbar({widgetss: {
                                  chat: {
                                    title       : "Chat",
                                    description : "Chat with all the meeting participant in public and private rooms"
                                  },
                                  whiteboard: {
                                    title       : "Whiteboard",
                                    description : "Collaborative drawing"
                                  }
                                }
                              });
```

