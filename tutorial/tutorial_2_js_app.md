# Tutorial - Creating a chat widget

U.C.Engine is shipped with a basic javascript application including a whiteboard and a sample widget.

This application use [[uce.js|ucejs]] library.

We now want to create a chat widget.

## Update the skeleton

    $> cd wwwroot/widgets
    $> cp -r sample chat
    $> mv chat/sample.ui.js chat/chat.ui.js

```javascript
(function($) {
$.uce.Chat = function() {}
$.uce.Chat.prototype = {
    options: {
         // uce meeting instance
        ucemeeting          : null,
        // widget title
        title               : "Chat",
    },
    // ucengine events
    meetingsEvents : {},
    //
    _widgetClass: 'ui-widget uce-widget uce-chat',
    /**
     * Constructor
     */
    _create: function() {
        var that = this;
        this.element.addClass(this._widgetClass);
        this.addHeader();

        this._content = $("<div>").addClass("ui-widget-content").appendTo(this.element);
    },

    destroy: function() {
        this.element.find('*').remove();
        this.element.removeClass(this._widgetClass);
        $.Widget.prototype.destroy.apply(this, arguments); // default destroy
    }
};
$.uce.widget("chat", new $.uce.Chat());
})(jQuery);
```

## Create a textbox

In a chat widget, we expect to have a text input, a post button and a big box with all messages.

```javascript
_create: function() {
    ...
    this._insertMessageBox();
    this._insertTextInput();
},

_insertMessageBox: function() {
    this._box = $("<div>").addClass("uce-chat-messages");
    this._content.append(this._box);
},

_insertTextInput: function() {
    var textInput = $("<input type='text' />");
    var postButton = $("<input type='submit' value='Post' />").bind("click", $.proxy(this._onClick, this));
    var container = $("<div>").append(textInput)
                              .append(postButton);
    this._content.append(container);
},

_onClick: function(event) {}
```

Each time the user click on the post button, we want to send an event to U.C.Engine.
We pass in options the ucemeeting parameter. On the meeting object we have a *push* method.

```javascript
_onClick: function(event) {
    // search the text input
    var text = this.element.find("input[type='text']").val();
    this.options.ucemeeting.push("chatmessage", {text: text}, $.noop);
}
```

It's a good start. But you cannot see your own message as well as messages of other users. To be noticed to all message sended, you can add a line in the *meetingsEvents*. *meetingsEvents* is inspired by [[Backbone delegateEvents|http://documentcloud.github.com/backbone/#View-delegateEvents]], but it's only apply on events in the meeting room, not DOM related.

```javascript
meetingsEvents: {
    "chatmessage" : "_onChatMessage"
},

_onChatMessage: function(event) {
    this._box.append($("<p>").text(event.metadata.text));
}
```

We have now a widget ready. Open *wwwroot/demo/js/demo.js* and update startLive function.

```javascript
function startLive(client) {
    return function() {
        var meeting = client.meeting("demo");
        $("<article>").attr("id", "whiteboard").appendTo($("#content")).whiteboard({ucemeeting: meeting});
        $("<article>").appendTo($("#content")).sample({ucemeeting: meeting});
        $("<article>").appendTo($("#content")).chat({ucemeeting: meeting});
        meeting.startLoop();
    };
}
```

And add chat.ui.js in the index.html.

Go to [[localhost:5280/demo|http://localhost:5280/demo/]].

## Further reading

* [[Javascript API reference|ucejs]]
