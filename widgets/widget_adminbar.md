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

## Widgets paramater format

Option         | Description
---------------|---------------------------------------------------------------
title          | The widget title
description    | A small description of the widget
thumbnail      | A path to the widget's thumbnail

## Methods

Method         | Description
---------------|---------------------------------------------------------------
destroy        | Destroy the widget

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

