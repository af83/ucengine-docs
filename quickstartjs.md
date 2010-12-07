# Quickstart

In this quickstart, we will create a fantastic video/chat application.

You will need:

* ucengine up and running
* a text editor
* few javascript skills.

## Install erlyvideo

See [[erlyvideo]].

## Create an organization, one meeting and one user

* Organization: *myorg*
* meeting:  *demo*
* User: *john* - password: *mypwd*

## Start hacking

Create a folder *chat* in *priw/www*, with an index.html:

    $> mkdir priv/www/chat

**priv/www/chat/index.html**

```html
<script type="text/javascript" src="../lib/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../lib/jquery-ui-1.8.4.custom.min.js"></script>
<script type="text/javascript" src="../lib/uce.js"></script>
<script type="text/javascript" src="../lib/video.ui.js"></script>
<script type="text/javascript" src="../lib/chat.ui.js"></script>
<script type="text/javascript" src="js/yourchat.js"></script>
```

**priv/www/chat/js/yourchat.js**

```javascript
var password = "mypwd";
var uid = "john";
uce.presence.create("password", password, "myorg", uid, uid, function(err, result, xhr) {
  if (err) {
    return;
  }
  var meeting = uce.attachPresence(result).org("myorg").meeting("demo");
  $("<div>").appendTo($("body")).video({domain : "video.ucengine.org/demo",
                                        stream : "demo"});
  $("<div>").appendTo($("body")).chat({ucemeeting : meeting});
  meeting.startLoop();
});
```
