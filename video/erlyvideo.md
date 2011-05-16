# U.C.Engine plugin for Erlyvideo

## Introduction

[erlyvideo_ucengine](https://github.com/AF83/erlyvideo-ucengine) is a plugin to turn erlyvideo into an U.C.Engine brick. It allow you to create a video stream per meeting.

## Dependencies

* [ibrowse](https://github.com/dizzyd/ibrowse)

## Install it from git repository

    # Fetch af83's fork of Erlyvideo
    $ git clone https://github.com/AF83/erlyvideo.git --branch plugins
    $ mkdir erlyvideo/plugins
    $ cd erlyvideo/plugins/

    # Fetch erlyvideo_ucengine sources
    $ git clone git://github.com/AF83/erlyvideo-ucengine.git erlyucengine

    # Build Erlyvideo
    $ cd ../../
    $ make

    # Update configuration, then run Erlyvideo
    $ make run

## Configuration

Add the following lines to our *priv/erlyvideo.conf*:

```erlang
{ucengine, [{host, "localhost"},
    {port, 5280},
    {uid, "erlyvideo"},
    {token, "da93ae03c1280f82709f857ffa22f0a30c26fa9c"}]}.
```

And don't forget to add 'ucengine' in our module list:

```erlang
{modules, [ucengine]}.
```

And replace *trusted_login* by *ucengine_login* in *rtmp_handlers*, like that:

```erlang
{rtmp_handlers, [{auth_users_limit, 200}, ucengine_login, apps_push, apps_streaming, apps_recording]},
```

## How it works?

Fig.1 connection workflow: how the plugin allows users to connect to erlyvideo from ucengine.

![Fig.1 connection workflow](./static/img/uce_erlyvideo_wf1.png)

Fig.2 publish/play stream workflow: how the plugin manages events publish and play stream.

![Fig.2 publis/play stream workflow](./static/img/uce_erlyvideo_wf2.png)

Fig.3 close/lost stream workflow: how the plugin manages events close and lost
stream.

![Fig.3 close/lost stream workflow](./static/img/uce_erlyvideo_wf3.png)

## Use it with video widget

See [[video widget documentation|widget_video]].

## Events

### video.stream.new

Sent by [[erlyvideo]] with token and channel for viewing and publishing video. It's a private message, sent by erlyvideo each time you join a meeting.

 Metadata | Description
----------|-----------------------------------------------------
 token    | secret token shared between [[erlyvideo]] and user
 channel  | stream name of the current meeting in [[erlyvideo]]

### video.stream.start

Sent by [[erlyvideo]] when a user start publishing video/webcam

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
broadcaster    | uid of the user who triggered the action

### video.stream.lost

Send by [[erlyvideo]] when source have been lost

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
broadcaster    | uid of the user who triggered the action

### video.stream.stop

Sent by [[erlyvideo]] when a user stop publishing video/webcam

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
broadcaster    | uid of the user who triggered the action

## ACL

Object         | Action       | Description
---------------|--------------|----------------------------------------------------------------------------------------
video          | view         | Allow video stream view with [[erlyvideo]]
video          | publish      | Allow video stream publishing view with [[erlyvideo]]
