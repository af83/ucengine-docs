# Events

## Internals

This page list all events triggered by U.C.Engine core. Users cannot create these kind of events.

### internal.meeting.add

It notifies that a new meeting have been created.

Example:

```javascript
{ "type"     : "internal.meeting.add",
  "domain"   : "localhost",
  "datetime" : 1292597388050,
  "id"       : "74647005885125029457242944483441",
  "from"     : "uid_63444326443_50150",
  "metadata" : {}
}
```

### internal.meeting.update

It notifies that the meeting have been updated.

Example:

```javascript
{ "type"     : "internal.meeting.update",
  "domain"   : "localhost",
  "datetime" : 1292597388050,
  "id"       : "74647005885125029457242944483441",
  "from"     : "uid_63444326443_50150",
  "location" : "demo",
  "metadata" : {}
}
```

### internal.file.add

It notifies that a new file have been added.

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

### internal.file.delete

It notifies that a new file have been deleted.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
id             | The id of the file. This id is unique for each uploaded file (even if the file is the same).
name           | original name of the file

Example:

```javascript
{ "type"     : "internal.file.delete",
  "domain"   : "localhost",
  "datetime" : 1292597388050,
  "id"       : "74647005885125029457242944483441",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "id"   : "Eben-Moglen-2010-12-2-privacy-testimony_34891938863969335648238193223131.pdf",
    "name" : "Eben-Moglen-2010-12-2-privacy-testimony.pdf"
  }
}
```

### internal.role.add

It notifies that a role have been associate to the user.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
name           | name of the role

Example:

```javascript
{ "type"     : "internal.role.add",
  "domain"   : "localhost",
  "datetime" : 1292597388050,
  "id"       : "74647005885125029457242944483441",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "name" : "speaker"
  }
}
```

### internal.role.delete

It notifies that a role have been deassociated to the user.

Metadata       | Description
---------------|-------------------------------------------------------------------------------------------------------
name           | name of the role

Example:

```javascript
{ "type"     : "internal.role.delete",
  "domain"   : "localhost",
  "datetime" : 1292597388050,
  "id"       : "74647005885125029457242944483441",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "name" : "speaker"
  }
}
```

### internal.presence.add

```javascript
{ "type"     : "internal.presence.add",
  "domain"   : "localhost",
  "datetime" : 1292597388050,
  "id"       : "74647005885125029457242944483441",
  "from"     : "uid_63444326443_50150",
  "metadata" : {}
}
```

### internal.presence.delete

```javascript
{ "type"     : "internal.presence.delete",
  "domain"   : "localhost",
  "datetime" : 1292597388050,
  "id"       : "74647005885125029457242944483441",
  "from"     : "uid_63444326443_50150",
  "metadata" : {}
}

### internal.roster.add

It notifies that a new user entered the current meeting.

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

It notifies that a new user exited the current meeting.

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

```javascript
{ "type"     : "internal.user.add",
  "domain"   : "localhost",
  "datetime" : 1292600689363,
  "id"       : "05214339923220971091870275941078",
  "from"     : "uid_63444326443_50150",
  "metadata" : {}
}
```

### internal.user.update

```javascript
{ "type"     : "internal.user.update",
  "domain"   : "localhost",
  "datetime" : 1292600689363,
  "id"       : "05214339923220971091870275941078",
  "from"     : "uid_63444326443_50150",
  "metadata" : {}
}
```

### internal.user.role.add

It notifies that a user get a new role.

Example:

```javascript
{ "type"     : "internal.user.role.add",
  "domain"   : "localhost",
  "datetime" : 1292600689363,
  "id"       : "05214339923220971091870275941078",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "role": "speaker",
    "user": "uid_7893423675"
  }
}
```

### internal.user.role.delete

It notifies that a user loose a role.

Example:

```javascript
{ "type"     : "internal.user.role.delete",
  "domain"   : "localhost",
  "datetime" : 1292600689363,
  "id"       : "05214339923220971091870275941078",
  "location" : "demo",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "role": "speaker",
    "user": "uid_7893423675"
  }
}
```

### internal.access.add

Example:

```javascript
{ "type"     : "internal.access.add",
  "domain"   : "localhost",
  "datetime" : 1292600689363,
  "id"       : "05214339923220971091870275941078",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "role"   : "speaker",
    "action" : "",
    "object" : "",
    ...
  }
}
```

### internal.access.delete

Example:

```javascript
{ "type"     : "internal.access.delete",
  "domain"   : "localhost",
  "datetime" : 1292600689363,
  "id"       : "05214339923220971091870275941078",
  "from"     : "uid_63444326443_50150",
  "metadata" : {
    "role"   : "speaker",
    "action" : "",
    "object" : "",
    ...
  }
}
```
