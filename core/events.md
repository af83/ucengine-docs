# Events

## Internals

### internal.file.add

Sent by U.C.Engine. It notifies that a new file have been added.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
id             | The id of the file. This id is unique for each uploaded file (even if the file is the same).
mime           | mime type of the file
name           | original name of the file
size           | size of the file

Example:

```javascript
{ "type"     : "internal.file.add",
  "domain"   : "localhost",
  "datetime" : 1292597388050,
  "id"       : "74647005885125029457242944483441",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "id"   : "Eben-Moglen-2010-12-2-privacy-testimony_34891938863969335648238193223131.pdf",
    "mime" : "application/pdf",
    "name" : "Eben-Moglen-2010-12-2-privacy-testimony.pdf",
    "size" : "123456789"
  }
}
```

### internal.presence.add
### internal.presence.delete
### internal.roster.add

Sent by U.C.Engine. It notifies that a new user entered the current meeting.

Example:

```javascript
{ "type"     : "internal.roster.add",
  "domain"   : "localhost",
  "datetime" : 1292594897416,
  "id"       : "30387772929242810120613023014654",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {}
}
```

### internal.roster.delete

Sent by U.C.Engine. It notifies that a new user exited the current meeting.

Example:

```javascript
{ "type"     : "internal.roster.delete",
  "domain"   : "localhost",
  "datetime" : 1292600689363,
  "id"       : "05214339923220971091870275941078",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {}
}
```

### internal.user.add
### internal.user.update

### internal.acl.add

Sent by U.C.Engine. Notifies the adding of a new right for the user specified in the 'from' field.

Example:

```javascript
{ "type"     : "internal.acl.add",
  "domain"   : "localhost",
  "datetime" : 1292600689363,
  "id"       : "05214339923220971091870275941078",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {"object": "file",
                "action": "delete",
                "id": "my_own_file.jpg_42424242424242424242"}
}
```

### internal.acl.delete

Sent by U.C.Engine. Notifies the deletion of a right for the user specified in the 'from' field.

Example:

```javascript
{ "type"     : "internal.acl.delete",
  "domain"   : "localhost",
  "datetime" : 1292600689363,
  "id"       : "05214339923220971091870275941078",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {"object": "roster",
                "action": "add"}
}
```
