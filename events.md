# Events

## Internals

### internal.file.add

Sent by UC Engine. It notifies that a new file have been added.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
id             | The id of the file. This id is unique for each uploaded file (even if the file is the same).

Example:

    { "type"     : "internal.file.add",
      "datetime" : 1292597388050,
      "id"       : "74647005885125029457242944483441",
      "org"      : "af83",
      "meeting"  : "demo",
      "from"     : "uid_63444326443_50150",
      "metadata" : {
        "id":"Eben-Moglen-2010-12-2-privacy-testimony_34891938863969335648238193223131.pdf"
      }
    }

### internal.org.add
### internal.presence.add
### internal.presence.delete
### internal.roster.add

Sent by UC Engine. It notifies that a new user entered the current meeting.

Example:

    { "type"     : "internal.roster.add",
      "datetime" : 1292594897416,
      "id"       : "30387772929242810120613023014654",
      "org"      : "af83",
      "meeting"  : "demo",
      "from"     : "uid_63444326443_50150",
      "metadata" : {}
    }

### internal.roster.delete

Sent by UC Engine. It notifies that a new user quitted the current meeting.

Example:

    { "type"     : "internal.roster.delete",
      "datetime" : 1292600689363,
      "id"       : "05214339923220971091870275941078",
      "org"      : "af83",
      "meeting"  : "demo",
      "from"     : "uid_63444326443_50150",
      "metadata" : {}
    }

### internal.user.add
### internal.user.update

## Twitter

### twitter.hashtag.add

Sent by a user, it indicates the twitter brick to watch for the corresponding
hashtag. When a message will be retrieved from the twitter stream it will
produce a ̀`twitter.tweet.new` event.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
`hashtag`      | The hashtag to minitor

Example:

    { "type"    : "twitter.hashtag.add",
      "datetime": 1292593766682,
      "id"      : "44099145822544409583064798111089",
      "org"     : "af83",
      "meeting" : "demo",
      "from"    : "uid_63444326443_50150",
      "metadata": {
        "hashtag": "#TED"
      }
    }

### twitter.tweet.new

Sent by the twitter brick, it notifies that a new twitter message was posted.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
`text`         | The tweet message
`from`         | The twitter user
`hashtags`     | The hashtags presents in the message

Example:

    { "type"     : "twitter.tweet.new",
      "datetime" : 1292595423660,
      "id"       : "58605572364308395079869070527396",
      "org"      : "af83",
      "meeting"  : "demo",
      "from"     : "twitter",
      "metadata" : {
        "text"     : "#UCEngine is so cooool !",
        "from"     : "ucengine",
        "hashtags" : "#UCEngine"
      }
    }

## Chat

## chat.message.new

Sent by a user. It allow to post a new message on a chatroom

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
`text`         | The message content
`lang`         | The language of the message

Example:

    { "type"     : "chat.message.new",
      "datetime" : 1292601125202,
      "id"       : "91918360913598370296768635184375",
      "org"      : "af83",
      "meeting"  : "demo",
      "from"     : "uid_63444326443_50150",
      "metadata" : {
        "text":"Bienvenue sur UC Engine",
        "lang":"fr"
      }
    }

## chat.translation.new

## Video

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
