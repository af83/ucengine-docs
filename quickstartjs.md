# Quickstart

In this quickstart, we will create a fantastic video/chat application. We will use 2 widgets, [[chat|widget_chat]] and [[video|widget_video]].

You will need:

* U.C.Engine up and running - see [[install guide|install]].
* erlyvideo up and running - see [[erlyvideo install guide|erlyvideo]].
* a text editor.
* few javascript skills.

## Create one meeting and one user

* meeting:  *demo*
* User: *john* - password: *mypwd*

* * *

    $> bin/ucengine-admin meeting add --domain localhost --name "demo"
    $> bin/ucengine-admin user add --domain localhost --name 'john' --auth 'password' --credential 'mypwd'
    Success: 52050861150575074077437530343071 # User id which is also the name of the default user role

    $> bin/ucengine-admin role access add --domain localhost --name 52050861150575074077437530343071 --action add --object roster
    $> bin/ucengine-admin role access add --domain localhost --name 52050861150575074077437530343071 --action add --object presence
    $> bin/ucengine-admin role access add --domain localhost --name 52050861150575074077437530343071 --action list --object event
    $> bin/ucengine-admin role access add --domain localhost --name 52050861150575074077437530343071 --action add --object event

See [[ucengine-admin]] for more informations.

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
    <script type="text/javascript" src="../lib/uce.js"></script>
    <script type="text/javascript" src="../lib/ucewidget.js"></script>
    <script type="text/javascript" src="../lib/video/video.ui.js"></script>
    <script type="text/javascript" src="../lib/chat/chat.ui.js"></script>
    <script type="text/javascript" src="js/yourchat.js"></script>
    <link rel="stylesheet" type="text/css" href="../lib/chat/chat.css" charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="../lib/video/video.css" charset="utf-8" />
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
var client = uce.createClient();
client.auth(uid, password, function(err, result, xhr) {
  if (err) {
    return;
  }
  var meeting = client.meeting("demo");
  $("<div>").appendTo($("body")).video({domain : "localhost/ucengine",
                                        ucemeeting: meeting});
  $("<div>").appendTo($("body")).chat({ucemeeting : meeting}).chat('toggleMode', 'big');
  meeting.join(function(){});
  meeting.startLoop();
});
```

## Test

Go to [[localhost:5280/chat|http://localhost:5280/chat/]].

## Further reading

* [[Guide for creating a widget|cookbook_widgets]]
* [[Guide for creating a brick|cookbook_brick]]
