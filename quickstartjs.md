# Quickstart

In this quickstart, we will create a fantastic video/chat application.

You will need:
* ucengine up and running
* a text editor
* few javascript skills.

Create a folder *chat* in *priw/www*, with an index.html:

```
mkdir priv/www/chat
```

```html
<script type="text/javascript" src="../lib/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../lib/jquery-ui-1.8.4.custom.min.js"></script>
<script type="text/javascript" src="../lib/uce.js"></script>
<script type="text/javascript" src="../lib/video.ui.js"></script>
<script type="text/javascript" src="../lib/chat.ui.js"></script>
<script type="text/javascript" src="js/youchat.js"></script>
```

```javascript
uce.presence.create(auth, password, "af83", uid, nickname, function(err, result, xhr) {
  if (err) {
    return;
  }
  var meeting = uce.attachPresence(result).org("af83").meeting("my");
  $("<div>").appendTo($("body")).video({domain : "video.ucengine.org/demo",
                                        stream : "my"});
  $("<div>").appendTo($("body")).chat({ucemeeting : meeting});
  meeting.startLoop();
});
```

