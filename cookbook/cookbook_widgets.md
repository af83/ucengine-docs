# Guide for creating U.C.Engine jQuery UI widgets

**ucewidget.js** provides a factory method to create widget classes. The signature is *$.uce.widget(String name, Options prototype)*. Like jQuery UI widget factory.

[See official documentation](http://jqueryui.com/docs/Developer_Guide).

*$.uce.widget* can bind automatically uce events with your widget methods.

## Listen meetings events

If you pass a *ucemeeting* param, *$.uce.widget* loop on meetingsEvents hash.

```javascript
$.uce.widget("my", {
    // ucengine events
    meetingsEvents: {
        'video.stream.new'   : 'onStreamNew',
        'internal.roster.add' : 'onRosterAdd'
    },
    options: {
        ucemeeting: null
    },
    onStreamNew: function(ucevent) {
       // 'this' is correctly bind to the widget instance 
    },
    onRosterAdd: function(ucevent) {
    
    }
});
```
