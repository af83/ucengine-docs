# Quickstart

In this quickstart, we will create a fantastic video/chat application.

You will need:

* ucengine up and running
* a text editor
* few javascript skills.

## Install erlyvideo

See [[erlyvideo]].

## Create one meeting and one user

* meeting:  *demo*
* User: *john* - password: *mypwd*


* * *

    $> bin/ucectl meeting add --name "demo"
    $> bin/ucectl user add --uid 'john' --auth 'password' --credential 'mypwd'
    $> bin/ucectl acl add --uid 'john' --meeting 'demo' --object 'roster' --action 'add'
    $> bin/ucectl acl add --uid 'john' --object 'presence' --action 'add'
    $> bin/ucectl acl add --uid 'john' --object 'event' --action 'list'
    $> bin/ucectl acl add --uid 'john' --object 'event' --action 'add'

See [[ucectl]] for more informations.

## Start hacking

Create a folder *chat* in *priw/www*, with an index.html:

    $> mkdir -p priv/www/chat/js

**priv/www/chat/index.html**

```html
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="../lib/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../lib/jquery-ui-1.8.4.custom.min.js"></script>
    <script type="text/javascript" src="../lib/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="../lib/uce.js"></script>
    <script type="text/javascript" src="../lib/ucewidget.js"></script>
    <script type="text/javascript" src="../lib/video.ui.js"></script>
    <script type="text/javascript" src="../lib/chat.ui.js"></script>
    <script type="text/javascript" src="js/yourchat.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/widgets.css"  />
    <link href="../demo/stylesheets/ui-lightness/jquery-ui-1.8.4.custom.css" media="screen" rel="stylesheet" type="text/css" />
    <title>My video/chat application</title>
  </head>
  <body>
    <h1>Welcome !</h1>
  </body>
</html>
```

**priv/www/chat/js/yourchat.js**

```javascript
var password = "mypwd";
var uid = "john";
uce.presence.create(password, uid, uid, function(err, result, xhr) {
  if (err) {
    return;
  }
  var meeting = uce.attachPresence(result).meeting("demo");
  $("<div>").appendTo($("body")).video({domain : "localhost/ucengine",
                                        ucemeeting: meeting});
  $("<div>").appendTo($("body")).chat({ucemeeting : meeting}).chat('toggleMode', 'big');
  meeting.join(function(){});
  meeting.startLoop();
});
```

## Test

Go to [[localhost:5280/chat|http://localhost:5280/chat/]].
