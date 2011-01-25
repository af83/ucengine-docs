# Events

## Internals

### internal.file.add

Sent by UC Engine. It notifies that a new file have been added.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
id             | The id of the file. This id is unique for each uploaded file (even if the file is the same).
mime           | mime type of the file
name           | original name of the file
size           | size of the file

Example:

    { "type"     : "internal.file.add",
      "datetime" : 1292597388050,
      "id"       : "74647005885125029457242944483441",
      "meeting"  : "demo",
      "from"     : "uid_63444326443_50150",
      "metadata" : {
        "id":"Eben-Moglen-2010-12-2-privacy-testimony_34891938863969335648238193223131.pdf",
        "mime": "application/pdf",
        "name": "Eben-Moglen-2010-12-2-privacy-testimony.pdf",
        "size" : "123456789"
      }
    }

### internal.presence.add
### internal.presence.delete
### internal.roster.add

Sent by UC Engine. It notifies that a new user entered the current meeting.

Example:

    { "type"     : "internal.roster.add",
      "datetime" : 1292594897416,
      "id"       : "30387772929242810120613023014654",
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
      "meeting"  : "demo",
      "from"     : "uid_63444326443_50150",
      "metadata" : {}
    }

### internal.user.add
### internal.user.update

## Chat

## chat.message.new

Sent by a user. It allow to post a new message on a chatroom

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
text           | The message content
lang           | The language of the message

Example:

    { "type"     : "chat.message.new",
      "datetime" : 1292601125202,
      "id"       : "91918360913598370296768635184375",
      "meeting"  : "demo",
      "from"     : "uid_63444326443_50150",
      "metadata" : {
        "text":"Bienvenue sur UC Engine",
        "lang":"fr"
      }
    }

## chat.translation.new

Sent by the translation brick. It notifies that an earlier text message has
been translated.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
text           | The message content
lang           | The language of the message
from           | The original sender of the non translated message

Example:

    { "type"     : "chat.translation.new",
      "datetime" : 1292603078834,
      "id"       : "55807763603614612180220217695833",
      "meeting"  : "demo",
      "from"     : "translation",
      "parent"   : "96383203370218539842143583984667",
      "metadata" : {
        "lang" : "en",
        "text" : "Welcome to UC Engine",
        "from" : "uid_63444326443_50150"
      }
    }
