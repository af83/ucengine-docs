# ReST API

## General informations about the API

The base URL is `/api/0.6/`
All the others API URLs are relative to this one.

You have to consider a few conventions :

- The `PUT` and `DELETE` methods can be simulated when your client could not
  support these. To do so, you have to use the `_method` parameter.  For
  example, to be able to do a `PUT` request, you will send a `POST` request
  with the following parameter: `_method=PUT`.

### About cross domain requests

Since U.C.Engine 0.4 you can perform cross domain requests. We send *Access-Control-Allow-Origin* with value `*`.

## Authentication

All methods require a presence, the following parameters are
mandatory for all methods, with the exception of presence creation:

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**Encoded Parameters**                 |                                       |
`uid`                                  | User id                               | `91020740579212808535843549778848`
`sid`                                  | Session id                            | `07462066523652880535592964206583`

### Connect user

#### Request

    POST /presence/

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**Encoded Parameters**                 |                                       |
`name`                                 | User name                             | `ucengine@example.com`
`credential`                           | Password or token                     | `dWlkXzYzNDQ0MzI2NDQzXzUwMTUwCg`
**Optional Encoded Parameters**        |                                       |
`timeout`                              | Session timeout value (sec)           | `200`
`metadata`                             | Array containing metadata             | `metadata[key]=value`

##### Returned values

    200 { "result": {"uid": "91020740579212808535843549778848",
                     "sid": "07462066523652880535592964206583" } // the result is a valid sid

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    403 { "error": "bad_credentials" } // the authentification has failed

### Retrieve presence informations

#### Request

    GET /presence/{sid}

#### Returned values

    200 {"result":{     "id":"409832095702309473209",
                        "domain":"ucengine.org",
                        "user":91020740579212808535843549778848,
                        "metadata":{    "nickname":"My nickname"}
                }}

    404 { "error": "not_found" } // the presence resource does not exist

### Disconnect users

##### Request

    DELETE /presence/{sid}

##### Parameters

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`uid`                                  | User id                               | `91020740579212808535843549778848`
`sid`                                  | Session id                            | `07462066523652880535592964206583`

##### Returned values

    200 { "result": "ok" }}.

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to disconnect this presence

    404 { "error": "not_found" } // the presence resource does not exist

##### Notes

The user given as an URL parameter is not necessarily the same than the one
passed as an encoded parameter. Thus you can disconnect another user (if the
ACLs allow it of course).

## Time
### Retrieve current server's timestamp

#### Request

    GET /time

#### Returned values

    200 {"result": 1284046082844}

#### Notes

The timestamp is the number of milliseconds elapsed since EPOCH (1970-01-01).

## User
### List users

#### Request

    GET /user/

#### Returned values

    200 {"result": [{   "id": "23117132645488565859338928472570",
                        "name":"romain.gauthier@af83.com",
                        "domain":"ucengine.org",
                        "auth":"password",
                        "metadata":{
                            "nickname":"abel_1284046072075"
                        }
                    },
                    {   "id": "87955907670601102242750832275542",
                        "name":"victor.goya@af83.com",
                        "domain":"ucengine.org",
                        "auth":"password",
                        "metadata":{
                            "nickname":"phorque"
                        }
                    }]}

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

### Register users

#### Request

    POST /user/

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**Encoded Parameters**                 |                                       |
`name`                                 | User id                               | `ucengine@example.com`
`auth`                                 | Authentication method                 | `password` or `token`
`credential`                           | Password or token                     | `dWlkXzYzNDQ0MzI2NDQzXzUwMTUwCg`
`metadata`                             | Array containing metadata             | `metadata[key]=value`

#### Returned values:

    201 { "result": "91020740579212808535843549778848" }

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

### Modify user's informations

#### Request

    PUT /user/{uid}

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`uid`                                  | User id                               | `91020740579212808535843549778848`
**Encoded Parameters**                 |                                       |
`auth`                                 | Authentication method                 | `password`, `token` or `none`
`credential`                           | Password or token                     | `dWlkXzYzNDQ0MzI2NDQzXzUwMTUwCg`
`metadata`                             | Array containing metadata             | `metadata[key]=value`

### Returned values

    200 { "result": "ok" }

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

### Retrieve user's informations

#### Request

    GET /user/{uid}

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`uid`                                  | User id                               | `91020740579212808535843549778848`

#### Returned values

     200 {"result": {    "id": "91020740579212808535843549778848",
                         "name":"romain.gauthier@af83.com",
                         "domain":"ucengine.org",
                         "auth":"password",
                         "metadata":{
                            "nickname":"Romain - el paisano - Gauthier"
                         }
                    }}

    401 { "error": "unauthorized" }

    404 { "error": "not_found" }

    500 { "error": "unexpected_error" }

### Delete a user

#### Request

    DELETE /user/{uid}

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`uid`                                  | User id                               | `91020740579212808535843549778848`

#### Returned values

    200 { "result": "ok" }

    401 { "error": "unauthorized" }

    404 { "error": "not_found" }

    500 { "error": "unexpected_error" }

## Infos

### Get current domain informations

#### Request

    GET /infos

#### Returned values

    200 { "result": {"domain": "ucengine.org",
                     "metadata": [{"description", "an useful description"}]} }

### Update current domain informations

#### Request

    PUT /infos

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`metadata`                             | Array containing metadata             | `metadata[key]=value`

#### Returned values

    200 { "result": "ok" }

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to updated informations

## Meeting
### Create a meeting

#### Request

    POST /meeting/all/

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**Optional Encoded Parameters**        |                                       |
`name`                                 | Meeting id                            | `demo`
`start`                                | opening Timestamp of the meeting      | `63444430100`
`end`                                  | ending Timestamp of the meeting       | `63444430800`
`metadata`                             | Array containing metadata             | `metadata[key]=value`

#### Notes

- The timestamps are the number of milliseconds elapsed since EPOCH (1970-01-01).
- If the 'end' parameter is missing, the the meeting has no end date.
- if the 'start' and 'end' parameters are missing, the meeting starts
  immediatly and has no end date

#### Returned values

    201 { "result": "ok" }

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to create a meeting

    409 { "error": "conflict" } : // the meeting already exists


### Modify a meeting

#### Request

    PUT /meeting/all/{meeting}

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`meeting`                              | Meeting id                            | `demo`
**Optional Encoded Parameters**        |                                       |
`start`                                | opening Timestamp of the meeting      | `63444430100`
`end`                                  | ending Timestamp of the meeting       | `63444430800`
`metadata`                             | Array containing metadata             | `metadata[key]=value`

#### Returned values

    200 { "result": "ok" }

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to delete the meeting

    404 { "error": "not_found" } // the meeting does not exist

### Retrieve meeting's informations

#### Request

    GET /meeting/all/{meeting}

#### Parameters

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`meeting`                              | Meeting id                            | `demo`

#### Returned values

    200 {"result":{     "name":"demo",
                        "domain":"ucengine.org",
                        "start_date":1284046056927,
                        "end_date":"never",
                        "metadata":{    "description":"U.C.Engine demo meetup"}
                }}

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the users is not authorized to retrieve the meeting's informations

### Join a meeting

#### Request

    POST /meeting/all/{meeting}/roster/

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`meeting`                              | Meeting id                            | `demo`
**Encoded Parameters**                 |                                       |
`uid`                                  | User id                               | `91020740579212808535843549778848`

#### Returned values

    200 { "result": "ok" }

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to join the meeting

    404 { "error": "not_found" } // the meeting does not exist

### Quit a meeting

#### Request

    DELETE /meeting/all/{meeting}/roster/{uid}

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`meeting`                              | Meeting id                            | `demo`
`uid`                                  | User id                               | `91020740579212808535843549778848`

#### Returned values

    200 { "result": "ok" }

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to quit the meeting

    404 { "error": "not_found" } // the meeting does not exist

### List users connected to a meeting (roster)

#### Request

    GET /meeting/all/{meeting}/roster

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`meeting`                              | Meeting id                            | `demo`


#### Returned values

    200 {"result":[{    "uid":"34334839681323313178318538371527",
                        "name":"jeffrey.lebowski@bathtub.com",
                        "domain":"ucengine.org",
                        "auth":"password",
                        "metadata":{
                                "nickname":"The Dude"}
                        },
               {        "uid":"18519526811067452830480557737028",
                        "name":"walter.sobchak@bowling.org",
                        "domain":"ucengine.org",
                        "auth":"password",
                        "metadata":{
                                "nickname":"The Veteran"}
                        },
               {        "uid":"40608184277610677427985745048015",
                        "name":"donny@steelcan.org",
                        "domain":"ucengine.org",
                        "auth":"password",
                        "metadata":{
                                "nickname":"donny"}
               },
               ...
    ]}

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to list the users of this meeting

    404 { "error": "not_found" } // the meeting does not exist

### List the meetings

#### Request

    GET /meeting/

    GET /meeting/{status}


Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`status`                               | Status of the meeting                 | `upcoming` or `opened` or `closed` or `all`

#### Returned values

    200 {"result":[{    "name":"demo",
                        "domain":"ucengine.org",
                        "start_date":1284046056927,
                        "end_date":"never",
                        "metadata":{    "description":"U.C.Engine demo meetup"}
                },
                {       "name":"demo2",
                        "domain":"ucengine.org",
                        "start_date":1284046056928,
                        "end_date":"never",
                        "metadata":{"description":"Meeting R&D"}
                },
                {       "name":"agoroom",
                        "domain":"ucengine.org",
                        "start_date":1284046056928,
                        "end_date":1284046056928,
                        "metadata":{"description":"Meeting agoroom"}
                }
    ]}

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to list the meetings

## Events

### Retrieve the events

#### Request

    GET /event/

    GET /event/{meeting}

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`meeting`                              | Meeting id                            | `demo`
**Optional Encoded Parameters**        |                                       |
`type`                                 | The event's type                      | `internal.meeting.add`
`start`                                | Start of the event's frame            | `63444430100`
`end`                                  | End of the event's frame              | `63444430300`
`from`                                 | The sender of the event               | `91020740579212808535843549778848`
`count`                                | Number of events per page             | `42`
`page`                                 | Index of the first page to return     | `1`
`order`                                | Sorting order                         | `asc` or `desc`
`search`                               | Keywords that events should match, using the erlang search backend | `chuck,bruce`
`parent`                               | Id of the parent event                | `48320948320982309`

#### Returned values

    200 {"result": [{   "type":"join_meeting_event",
                        "domain":"ucengine.org",
                        "datetime":1284046079374,
                        "id":"24653994823933231622695570265810",
                        "location":"demo",
                        "from":"abel.fournier_1284046072075@af83.com",
                        "metadata":{}
                },
                {       "type":"post_annotation_event",
                        "domain":"ucengine.org",
                        "datetime":1284046082844,
                        "id":"20196912711920626263917946711292",
                        "location":"demo",
                        "from":"abel.fournier_1284046072075@af83.com",
                        "metadata":{    "language":"fr",
                                        "text":"coucou"}
                },
                {       "type":"translate_annotation_event",
                        "domain":"ucengine.org",
                        "datetime":1284046083272,
                        "id":"61614248092678409569587739330424",
                        "location":"demo",
                        "from":"abel.fournier_1284046072075@af83.com",
                        "metadata":{    "traduction":"cuckoo",
                                        "language":"en"}
                },
                ...
    ]}

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to list the events of this meeting

    404 { "error": "not_found" } // the meeting does not exist

#### Notes

'start' and 'end' parameters allow you to frame the events :

- If `end` is missing: return all the events from `start` to the end of the timeline.
- If `start` and 'end' are missing: return all the events of the timeline.

### Retrieve the events in live

#### Request

    GET /live/

    GET /live/{meeting}

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`meeting`                              | Meeting id                            | `demo`
**Optional Encoded Parameters**        |                                       |
`type`                                 | The event's type                      | `internal.meeting.add`
`start`                                | Start of the event's frame            | `63444430100`
`from`                                 | The sender of the event               | `91020740579212808535843549778848`
`search`                               | Keywords that events should match, using the erlang search backend | `chuck,bruce`
`parent`                               | Id of the parent event                | `48320948320982309`
`mode`                                 | Mode to retrieve events               | `longpolling` or `eventsource`

#### Returned values with long polling api

    200 {"result": [{   "type":"join_meeting_event",
                        "domain":"ucengine.org",
                        "datetime":1284046079374,
                        "id":"24653994823933231622695570265810",
                        "location":"demo",
                        "from":"abel.fournier_1284046072075@af83.com",
                        "metadata":{}
                },
                {       "type":"post_annotation_event",
                        "domain":"ucengine.org",
                        "datetime":1284046082844,
                        "id":"20196912711920626263917946711292",
                        "location":"demo",
                        "from":"abel.fournier_1284046072075@af83.com",
                        "metadata":{    "language":"fr",
                                        "text":"coucou"}
                },
                {       "type":"translate_annotation_event",
                        "domain":"ucengine.org",
                        "datetime":1284046083272,
                        "id":"61614248092678409569587739330424",
                        "location":"demo",
                        "from":"abel.fournier_1284046072075@af83.com",
                        "metadata":{    "traduction":"cuckoo",
                                        "language":"en"}
                },
                ...
    ]}

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to list the events of this meeting

    404 { "error": "not_found" } // the meeting does not exist

#### Returned values with eventsource api

    data: {"type":"join_meeting_event", "domain":"ucengine.org", "datetime":1284046079374, "id":"24653994823933231622695570265810", "location":"demo", "from":"abel.fournier_1284046072075@af83.com", "metadata":{}}

    data: {"type":"join_meeting_event", "domain":"ucengine.org", "datetime":1284046079374, "id":"24653994823933231622695570265810", "location":"demo", "from":"abel.fournier_1284046072075@af83.com", "metadata":{}}

#### Notes

This is the good method to retrieve events in live.

- You have to update the `start` parameter each time you ask te API. You can use the time api or get the datetime of the last event received.
- Use the `mode` parameter to switch between the longpolling or eventsource api.
- The eventsource api is compatible with [[EventSource specification|http://dev.w3.org/html5/eventsource/]].

### Search events in U.C.Engine

#### Request

    GET /search/event

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**Optional Encoded Parameters**        |                                       |
`count`                                | Number of events per page             | `42`
`order`                                | Order of events                       | `desc` or `asc`
`startPage`                            | Index of the first page to return     | `1`
`startIndex`                           | Index of the first event in the page  | `2`
`searchTerms`                          | Terms to search (see Notes below)     | `from:chuck nunchucks`

#### Search terms syntax

The search terms can be any whitespace-separated words and will be
searched in metadata, using the configured search back-end. A few filters, similar to the parameters used in
the above listing method, are available:

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
`location`                             | Meeting id                            | `demo`
`type`                                 | The event's type                      | `internal.meeting.add`
`start`                                | Start of the event's frame            | `63444430100`
`end`                                  | End of the event's frame              | `63444430300`
`from`                                 | The sender of the event               | `91020740579212808535843549778848`
`parent`                               | Id of the parent event                | `48320948320982309`

Filters can be used with `filter_name:filter_value`.

#### Examples

- Search all meeting creation events that contain the word `duck`:

    GET /search/event?searchTerms=duck

- Search all meeting creation events that contain the words `bruce`
  and `nunchuck`:

    GET /search/event?searchTerms=type:internal.meeting.add bruce nunchucks

- Search all chat messages from `chuck.norris`, starting from the
timestamp 1298907632934 to 1298907722946
that contain the words `foot`:

    GET /search/event?searchTerms=type:chat.message.add from:chuck.norris start:1298907632934 end:1298907722946 foot

#### Returned values

    200 {"result": {"link": "http://localhost:5280/api/0.5/search/event?uid=91020740579212808535843549778848&sid=07462066523652880535592964206583&count=2&searchTerms=location:testmeeting chuck",
                "totalResults": 2,
                "startIndex": 0,
                "itemsPerPage": 2,
                "Query": {"role": "request",
                           "searchTerms": "location:testmeeting chuck",
                           "startPage":1},
                "entries": [{"type": "internal.roster.add",
                             "domain": "ucengine.org",
                             "datetime": 1298908021875,
                             "id": "15368680984378277377616406943211",
                             "location": "testmeeting",
                             "from": "participant.user@af83.com",
                             "metadata": {"nickname": "chuck norris"}},
                            {"type": "chat.message.add",
                             "domain": "localhost",
                             "datetime": 1298908021943,
                             "id": "15368680984378277377616406943211",
                             "location": "testmeeting",
                             "from": "participant.user@af83.com",
                             "metadata": {"text", "I love chuck!"}}]}}


#### Notes

The API is similar to the
[OpenSearch API](http://www.opensearch.org/Specifications/OpenSearch/1.1),
except that U.C.Engine returns JSON-formatted results. Note that this
entry point does not behave like the method described above:

- there is no guarantee that an event can be searched right after its
  registration. The delay depends on the search backend used to index
  the events;
- the returned document contains informations about pagination (see
  the `Returned values` section).
- the results are not guaranteed to be identical across multiple
  backends. See the [[config search backends|config#search-backends]].

This method is useful to perform fast full-text search, and should be
used only for this purpose.

### Send an event to U.C.Engine

#### JSON version

You must set the content-type of the request as *applicaton/json*.

##### Request

    POST /event/

    POST /event/{Meeting}

Parameter                              | Description                                   | Example
---------------------------------------|-----------------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                               |
`meeting`                              | Meeting id                                    | `demo`
**JSON Body**                          |                                               |
`type`                                 | The event's type, cannot be 'internal.*' type | `chat.message.new`
`to`                                   |                                               |
`parent`                               |                                               |
`metadata`                             |                                               |

##### Returned values

    201 {"result": "24653994823933231622695570265810"}

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to send events to this meeting

    404 { "error": "not_found" } // the meeting does not exist

#### Old version
##### Request

    POST /event/

    POST /event/{meeting}

Parameter                              | Description                                   | Example
---------------------------------------|-----------------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                               |
`meeting`                              | Meeting id                                    | `demo`
**Encoded Parameters**                 |                                               |
`type`                                 | The event's type, cannot be 'internal.*' type | `chat.message.new`
**Optional Encoded Parameters**        |                                               |
`to`                                   |                                               |
`parent`                               |                                               |
`metadata`                             | These will be part of the metadata            |

##### Returned values

    201 {"result": "24653994823933231622695570265810"}

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to send events to this meeting

    404 { "error": "not_found" } // the meeting does not exist

## Files
### Upload a file

#### Request

    POST /file/{meeting}

Parameter                              | Description                            | Example
---------------------------------------|----------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                        |
`meeting`                              | Meeting id                             | `demo`
**Required Encoded Parameters**        |                                        |
`content`                              | Content of the file                    |
**Optional Encoded Parameters**        |                                        |
`forceContentType`                     | Force the content type of the response | `text/html`
`metadata`                             | Array containing metadata              | `metadata[key]=value`

#### Returned values

    201 { "result": "ucengine_4534543543.odp"} // the file id

    400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    401 { "error": "unauthorized" } // the user is not authorized to upload files in this meeting

    404 { "error": "not_found" } // the meeting does not exist

#### Notes

- The body request **must be in multipart/form-data**.
- The `forceContentType` parameter is only a workaround when browsers show a popup when *content-type* is *application/json*.
- To avoid conflicts between files U.C.Engine generate a unique id which is returned in the result.

### List files

#### Request

    GET /file/{meeting}

#### Parameters

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`meeting`                              | Meeting id                            | `demo`
**Optional Encoded Parameters**        |                                       |
`order`                                | Sorting order                         | `asc` or `desc`

#### Returned values

    200 { "result": [ { "name": "U.C.Engine.pdf"
                      , "uri" : "file://data/ucengine.pdf"
                      , "id" : "fileid"
                      , "domain": "ucengine.org"
                      , "location": "demo"
                      }
                    , ...
                    ]}

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

### Download a file

#### Request

    GET /file/{meeting}/{filename}

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`meeting`                              | Meeting id                            | `demo`
`filename`                             | Filename                              | `ucengine.odp`

#### Returned values

    200 The file to download

    401 { "error": "unauthorized" }

    404 { "error": "not_found" }

    500 { "error": "unexpected_error" }


### Delete a file

#### Request

    DELETE /file/{meeting}/{filename}

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                       |
`meeting`                              | Meeting id                            | `demo`
`filename`                             | Filename                              | `ucengine.odp`

#### Returned values

    200 { "result": "ok" }

    401 { "error": "unauthorized" }

    404 { "error": "not_found" }

    500 { "error": "unexpected_error" }

## Roles

### Add a new role

#### Request

    POST /role/

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**Encoded Parameters**                 |                                       |
`name`                                 | The name of the new role              | `admin`, `speaker`, ...

#### Returned values

    201 { "result": "created" } // the role has been successfully added

    400 { "error": "missing_parameters" } // at least one paremeter is missing (probably the 'name')

    401 { "error": "unauthorized" } // the user is not authorized to add a role

    409 { "error": "conflict" } // the role already exists

### Delete a role

#### Request

    DELETE /role/{name}

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**Url Parameters**                     |                                       |
`name`                                 | The role name                         | `admin`, `speaker`, ...

#### Returned values

    200 { "result": "ok } // the role has been successfully deleted

    401 { "error": "unauthorized" } // the user is not authorized to delete this role

    404 { "error": "not_found" } // the role does not exist

### Set a new access right to a role

#### Request

    POST /role/{name}/acl/

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**Url Parameters**                     |                                       |
`name`                                 | The role name                         | `admin`, `speaker`, ...
**Encoded Parameters**                 |                                       |
`object`                               | The kind of object to access to       | `user`, `meeting`, ...
`action`                               | The action allowed on the object      | `add`, `update`, ...
`conditions`                           | Array of conditions to satisfy        | `conditions[id]='123'`

#### Returned values

    200 { "result": "ok" } // the access right has been successfully added to the role

    400 { "error": "missing_parameters" } // at least one paremeter is missing

    401 { "error": "unauthorized" } // the user is not authorized to add an access right to this role

    404 { "error": "not_found" } // the role does not exists

#### Notes

It is not an error to set an access right twice or more, the access rights will not be duplicated.

### Unset an access right from a role

#### Request

    DELETE /role/{name}/acl/{action}/{object}

Parameter                              | Description                           | Example
---------------------------------------|---------------------------------------|------------------------------------------------------------
**URL parameters**                     |                                       |
`name`                                 | The role name                         | `admin`, `speaker`, ...
`object`                               | The kind of object to access to       | `user`, `meeting`, ...
`action`                               | The action allowed on the object      | `add`, `update`, ...
**Encoded Parameters**                 |                                       |
`conditions`                           | Array of conditions to satisfy        | `conditions[id]='123'`

#### Returned values

    200 { "result": "ok" } // the access right has been successfully deleted from the role

    400 { "error": "missing_parameters" } // at least one paremeter is missing

    401 { "error": "unauthorized" } // the user is not authorized to delete an access right from this role

    404 { "error": "not_found" } // the role does not exists

### Set a role to a user

#### Request

    POST /user/{uid}/roles

Parameter                              | Description                                   | Example
---------------------------------------|-----------------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                               |
`uid`                                  | User id                                       | `91020740579212808535843549778848`
**Encoded Parameters**                 |                                               |
`role`                                 | The role name                                 | `admin`, `speaker`, ...
`location`                             | The location (meeting) where the role applies | `mymeeting`

#### Returned values

    200 { "result": "ok" } // the role has been successfuly set to the user

    400 { "error": "missing_parameters" } // at least one paremeter is missing

    401 { "error": "unauthorized" } // the user is not authorized to set this role to the user

    404 { "error": "not_found" } // the role, the user or the location does not exist

#### Notes

If the location parameter is omitted the role will apply on all locations.

### Unset a role to a user

#### Request

    DELETE /user/{uid}/roles/{role}

    DELETE /user/{uid}/roles/{role}/{location}

Parameter                              | Description                                   | Example
---------------------------------------|-----------------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                               | 
`uid`                                  | User id                                       | `91020740579212808535843549778848`
`role`                                 | The role name                                 | `admin`, `speaker`, ...
`location`                             | The location (meeting) where the role applies | `mymeeting`

#### Returned values

    200 { "result": "ok" } // the role has been successfuly removed from the user

    401 { "error": "unauthorized" } // the user is not authorized to remove this role from the user

    404 { "error": "not_found" } // the role, the user or the location does not exist

### Check user access

#### Request

    GET /user/{uid}/can/{action}/{object}

    GET /user/{uid}/can/{action}/{object}/{location}

Parameter                              | Description                                   | Example
---------------------------------------|-----------------------------------------------|------------------------------------------------------------
**URL Parameters**                     |                                               | 
`uid`                                  | User id                                       | `91020740579212808535843549778848`
`object`                               | The object on which the right apply           | `meeting`  or `event`
`action`                               | Authorized action for this right              | `add` or `deletè or `join` ...
`location`                             | The location (meeting) where the role applies | `mymeeting`
**Encoded Parameters**                 |                                               |
`conditions`                           | Array of conditions to satisfy                | `conditions[id]='123'`

#### Returned values

    200 {"result": "true"}

    200 {"result": "false"}

    401 { "error": "unauthorized" } : the caller is not authorized to check the user's rights

    404 { "error": "not_found" } : the user does not exist

