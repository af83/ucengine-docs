# Guide for creating U.C.Engine jQuery UI widgets

**ucewidget.js** provides a factory method to create widget classes. The signature is *$.uce.widget(String name, Options prototype)*. Like jQuery UI widget factory.

[See official documentation](http://jqueryui.com/docs/Developer_Guide).

*$.uce.widget* can bind automatically uce events with your widget methods.

We will create a simple widgets listening *chat.message.new* events.

## Create base structure

Create a file *speak.ui.js*:

```javascript
$.uce.widget("speak", {
    _create: function() {
        // this the constructor
    }
});
```

Include some files like *jQueryUI* and *uce.js*, located at *priv/lib/*.

And start using your widget:

```javascript
$("body").speak();
```

## Listen meetings events

Now we want to listen all messages *chat.message.new* and display them.

UCE widget include some facility to do that. Add an *meetingsEvents* hash in you widget, and pass a *ucemeeting* param to your widget.
*meetingsEvents* is an hash with the type of the message, and the method, like `{"event.name": "callback"}`.

```javascript
$.uce.widget("speak", {
    // ucengine meetings events
    meetingsEvents: {
        'chat.message.new'   : 'onMessage'
    },
    options: {
        ucemeeting: null
    },
    onMessage: function(ucevent) {
       // 'this' is correctly bind to the widget instance
    }
});
```
