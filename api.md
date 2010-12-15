# UC Engine ReST API

# General informations about the API

The base URL is `http://demo.ucengine.org/api/0.1/`
All the others API URLs are relative to this one.

For most of the API calls, there are recurrent parameters :

    - uid:         User Id                                    uid_63444326443_50150
    - sid:         Session Id                                 330249245470504

Moreover, you have to consider a few conventions :

- The `PUT` and `DELETE` methods can be simulated when your client could not
  support these. To do so, you have to use the `_method` parameter.  For
  example, to be able to do a `PUT` request, you will send a `POST` request
  with the following parameter: `_method=PUT`.

# Time
## Retrieve current server's timestamp

### URLs

    GET /time

### Returned values

    200 {"result": 1284046082844}

### Notes

The timestamp is the number of milliseconds elapsed since EPOCH (1970-01-01).

# User
## List users

### URL

    GET /user/

### Parameters

Encoded :

    - uid:         User Id                                    uid_63444326443_50150
    - sid:         Session Id                                 330249245470504

### Returned values

Success:

    200 {"result": [{   "uid":"romain.gauthier@af83.com",
                        "auth":"password",
                        "metadata":{
                            "nickname":"abel_1284046072075"
                        }
                    },
                    {   "uid":"victor.goya@af83.com",
                        "auth":"password",
                        "metadata":{
                            "nickname":"phorque"
                        }
                    }]}

Errors:

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

## Register users

### URL

    PUT /user/{uid}

### Parameters

URL parameters:

    - uid:         User Id                                    uid_63444326443_50150

Encoded:

    - auth:         Authentification method to use            anonymous | password | token
    - credential:   Secret element (password or token)        dWlkXzYzNDQ0MzI2NDQzXzUwMTUwCg
    - metadata:     Array containing metadata                 metadata[key]=value

### Returned values

Success:

    201 { "result": "created" }

Errors:

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

## Modify user's informations

### URL

    POST /user/{uid}

### Parameters

URL parameters:

    - uid:         User Id                                    uid_63444326443_50150

Encoded:

    - uid:         User Id                                    uid_63444326443_50150
    - sid:         Session Id                                 330249245470504
    - auth:         Authentification method to use            anonymous | password | token
    - credential:   Secret element (password or token)        dWlkXzYzNDQ0MzI2NDQzXzUwMTUwCg
    - metadata:     Array containing metadata                 metadata[key]=value

### Returned values

Success:

    200 { "result": "ok" }

Errors:

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

## Retrieve user's informations

### URL

    GET /user/{uid}

### Parameters

URL parameters:

    - uid:         User Id                                    uid_63444326443_50150
    - sid:         Session Id                                 330249245470504

Encoded:

    - uid:         User Id                                    uid_63444326443_50150
    - sid:         Session Id                                 330249245470504

### Returned values

Success:

        200 {"result": {    "uid":"romain.gauthier@af83.com",
                            "auth":"password",
                            "metadata":{
                               "nickname":"abel_1284046072075"
                            }
                       }}
Errors:

    401 { "error": "unauthorized" }

    404 { "error": "not_found" }

    500 { "error": "unexpected_error" }

## Supprimer un utilisateur

### URL

    DELETE /user/{uid}

### Parameters

URL parameters:

    - uid:         User Id                                    uid_63444326443_50150

Encoded:

    - uid:         User Id                                    uid_63444326443_50150
    - sid:         Session Id                                 330249245470504

### Returned values

Success:

    200 { "result": "ok" }

Errors:

    401 { "error": "unauthorized" }

    404 { "error": "not_found" }

    500 { "error": "unexpected_error" }

# Authentification

### URL

    PUT /presence/{uid}

### Parameters

URL parameters:

    - uid:         User Id                                    uid_63444326443_50150

Encoded:

    - credential:   Secret element (password or token)        dWlkXzYzNDQ0MzI2NDQzXzUwMTUwCg
    - metadata:     Array containing metadata                 metadata[key]=value

### Returned values

Success:

    - 200 { "result": "409832095702309473209" }} // the result is a valid sid

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 403 { "error": "bad_credentials" } // the authentification has failed

# Disconnect users

### URL

    DELETE /presence/{org}/{uid}/{sid}

### Paramètres

URL parameters:

    - uid:         User Id                                    uid_63444326443_50150
    - sid:         Session Id                                 330249245470504

Encoded:

    - uid:         User Id                                    uid_63444326443_50150
    - sid:         Session Id                                 330249245470504

### Returned values

Success:

    - 200 { "result": "ok" }}.

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to disconnect this presence

    - 404 { "error": "not_found" } // the presence resource doesn't exists

### Notes

The user given as an URL parameter is not necessarily the same than the one
passed as an encoded parameter. Thus you can disconnect another user (if the
ACLs allow it of course).

# Meeting
## Join a meeting

### URL

    PUT /meeting/{org}/all/{meeting}/roster/{uid}

### Parameters

URL parameters:

    - org:          Organisation name               af83
    - meeting:      Meeting name                    demo
    - uid:          User Id                         uid_63444326443_50150

Encoded:

    - uid:          User Id                         uid_63444326443_50150
    - sid:          Session Id                      330249245470504

### Returned values

Success:

    - 200 { "result": "ok" }

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to join the meeting

    - 404 { "error": "not_found" } // the meeting doesn't exists

## Quit a meeting

### URL

    DELETE /meeting/{org}/all/{meeting}/roster/{uid}

### Parameters

URL parameters:

    - org:          Organisation name               af83
    - meeting:      Meeting name                    demo
    - uid:          User Id                         uid_63444326443_50150

Encoded:

    - uid:         User Id                          uid_63444326443_50150
    - sid:         Session Id                       330249245470504

### Returned values

Success:

    200 { "result": "ok" }

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to quit the meeting

    - 404 { "error": "not_found" } // the meeting doesn't exists


## Create a meeting

### URL

    PUT /meeting/{org}/all/{meeting}

### Parameters

URL parameters:

    - org:          Organisation name                           af83
    - meeting:      Meeting name                                demo

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

Encoded (optional) :

    - _start:       Timestamp of the meeting's opening.         63444430100
    - _end:         Timestamp of the meeting's end.             63444430800
    - metadata:     Array containing metadata                   metadata[key]=value

### Notes

- The timestamps are the number of milliseconds elapsed since EPOCH (1970-01-01).
- If the '_end' parameter is missing, the the meeting has no end date.
- if the '_start' and 'end' parameters are missing, the meeting starts
  immediatly and has no end date

### Returned valuess

Success:

    - 201 { "result": "ok" }

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to create a meeting

    - 409 { "error": "conflict" } : // the meeting already exists


## Modify a meeting

### URL

    POST /meeting/{org}/all/{meeting}

### Parameters

URL parameters:

    - org:          Organisation name                           af83
    - meeting:      Meeting name                                demo

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

Encoded (optional):

    - _start:       Timestamp of the meeting's opening.         63444430100
    - _end:         Timestamp of the meeting's end.             63444430800
    - metadata:     Array containing metadata                   metadata[key]=value

### Returned values

Success:

    200 { "result": "ok" }

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to delete the meeting

    - 404 { "error": "not_found" } // the meeting doesn't exists


## List users connected to a meeting (roster)

### URL

    GET /meeting/{org}/all/{meeting}/roster

### Parameters

URL parameters:

    - org:          Organisation name                           af83
    - meeting:      Meeting name                                demo

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

### Returned values

Success:

    200 {"result":[{	"uid":"abel.fournier_1284046072075@af83.com",
			"auth":"password",
			"metadata":{
				"nickname":"abel_1284046072075"}
			},
               {	"uid":"abel.fournier_1284107725374@af83.com",
			"auth":"password",
			"metadata":{
				"nickname":"abel_1284107725374"}
			},
	       {	"uid":"abel.fournier_1284114120882@af83.com",
			"auth":"password",
			"metadata":{
				"nickname":"abel_1284114120882"}
	       },
	       ...
    ]}

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to list the users of this meeting

    - 404 { "error": "not_found" } // the meeting doesn't exists

## List the meetings

### URL

    GET /meeting/{org}

    GET /meeting/{org}/{status}

### Parameters

URL parameters:

    - org:          Organisation name                           af83

Dans l'URL (optionel) :

    - status:       Meeting's status.                           upcoming | opened | closed | all

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

### Returned values

Succès:

    200 {"result":[{	"org":"af83",
			"name":"demo",
			"start_date":1284046056927,
			"end_date":"never",
			"roster":[	"abel.fournier_1284046072075@af83.com",
					"abel.fournier_1284107725374@af83.com"],
			"metadata":{	"description":"UCengine demo meetup"}
		},
		{	"org":"af83",
			"name":"demo2",
			"start_date":1284046056928,
			"end_date":"never",
			"roster":[],
			"metadata":{"description":"Meeting R&D"}
		},
		{	"org":"af83",
			"name":"agoroom",
			"start_date":1284046056928,
			"end_date":1284046056928,
			"roster":["blah4"],
			"metadata":{"description":"Meeting agoroom"}
		}
    ]}

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to list the meetings of this organisation

    - 404 { "error": "not_found" } // the organisation doesn't exists

## Retrieve meeting's informations

### URL

    GET /meeting/{org}/all/{meeting}

### Parameters

URL parameters:

    - org:          Organisation name                           af83
    - meeting:      Meeting name                                demo

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

### Returned values

Succès:

    200 {"result":{	"org":"af83",
			"name":"demo",
			"start_date":1284046056927,
			"end_date":"never",
			"roster":[	"abel.fournier_1284046072075@af83.com",
					"abel.fournier_1284107725374@af83.com"],
			"metadata":{	"description":"UCengine demo meetup"}
		}}

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the users is not authorized to retrieve the meeting's informations

    - 404 { "error": "not_found" } // the organisation doesn't exists

## Delete a meeting

### URL

    DELETE /meeting/{org}/all/{meeting}

### Parameters

URL parameters:

    - org:          Organisation name                           af83
    - meeting:      Meeting name                                demo

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

### Returned values

Success:

    200 { "result": "ok" }

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to delete the meeting

    - 404 { "error": "not_found" } // the meeting doesn't exists

# Events
## Retrieve the events

### URL

    GET /event/

    GET /event/{org}/

    GET /event/{org}/{meeting}

### Parameters

URL parameters:

    - org:          Organisation name                           af83
    - meeting:      Meeting name                                demo

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

Encoded (optional):

    - type         The event's type                             join_meeting_event
    - start        Start of the events' frame                   63444430100
    - end          End of the event's frame                     63444430300
    - from         The sender of the event                      uid_63444326443_50150
    - count        Number of events to return                   42
    - page
    - order
    - search
    - parent
    - _async       Method used to retrieve the events           no | lp


### Returned values

Success:

    200 {"result": [{	"type":"join_meeting_event",
			"datetime":1284046079374,
			"id":"24653994823933231622695570265810",
			"org":"af83",
			"meeting":"demo",
			"from":"abel.fournier_1284046072075@af83.com",
			"metadata":{}
		},
		{	"type":"post_annotation_event",
			"datetime":1284046082844,
			"id":"20196912711920626263917946711292",
			"org":"af83",
			"meeting":"demo",
			"from":"abel.fournier_1284046072075@af83.com",
			"metadata":{	"language":"fr",
					"text":"coucou"}
		},
		{	"type":"translate_annotation_event",
			"datetime":1284046083272,
			"id":"61614248092678409569587739330424",
			"org":"af83",
			"meeting":"demo",
			"from":"abel.fournier_1284046072075@af83.com",
			"metadata":{	"traduction":"cuckoo",
					"language":"en"}
		},
		...
    ]}

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to list the events of this meeting

    - 404 { "error": "not_found" } // the meeting doesn't exists

### Notes

'_start' and '_end' parameters allow you to frame the events :

- If '_end' is missing: return all the events from `_start` to the end of the timeline.
- If '_start' and '_end' are missing: return all the events of the timeline.
- The `_limit` option can be negative. For instance, `_limit=-2` will return the 2 last events of the frame.
  Limit can also take the `last` value which is equivalent to `_limit=-1`
- The `_wait` option allow you to return the events to the client in real time with a long polling method.

## Send an event to UCengine

## URL

    PUT /event/

    PUT /event/{org}

    PUT /event/{org}/{meeting}

## Parameters

URL parameters:

    - org:          Organisation name                           af83
    - meeting:      Meeting name                                demo

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504
    - _type:       The event's type                             join_meeting_event

    - Any other encoded parameter will be part of the metadata

Success:

    - 201 {"result": "24653994823933231622695570265810"}

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to send events to this meeting

    - 404 { "error": "not_found" } // the meeting or this organisation doesn't exists

# Organisation
## Create a new organisation

### URL

    PUT /org/{name}

### Parameters

URL parameters:

    - name:          Organisation name                           af83

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504
    - Any other encoded parameter will be part of the metadata

### Returned values

Success:

    - 201 { "result": "created" }

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to create organisations

    - 409 { "error": "conflict" } : // the organisation already exists

## Modify an organisation

### URL

    POST /org/{name}

### Parameters

URL parameters:

    - name:          Organisation name                           af83

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504
    - Any other encoded parameter will be part of the metadata

### Returned values

Success:

    200 { "result": "ok" }

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to modify this organisation

    - 404 { "error": "not_found" } // the organisation doesn't exists

## Retrieve the organisation's informations

### URL

    GET /org/{name}

### Parameters

URL parameters:

    - name:          Organisation name                           af83

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

### Returned values

Success:

    200 { "result": {	"name": "af83",
			"metadata":{
				"description": "Crazy Solid"
			}
	}}

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to retrieve the organisation's informations

    - 404 { "error": "not_found" } // the organisation doesn't exists

## List organisations

### URL

    GET /org/

### Parameters

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

### Returned values

Success:

    200 { "result": [{	"name": "af83",
			"metadata":{
				"description": "Crazy Solid"
			},
		    {	"name": "google",
			"metadata":{
				"is_evil", "no"
			}
		    },
		    ...
	}]}

# Files
## Upload a file

### URL

    PUT /file/{org}/{meeting}

    PUT /file/{org}/{meeting}/{filename}

### Parameters

URL parameters:

    - org:          Organisation name                           af83
    - meeting:      Meeting name                                demo

Dans l'URL (optionels) :

    - filename:     Filename                                    ucengine.odp

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

Encoded (optional) :

    - _filename:   Filename                                     ucengine.odp

### Returned values

Success:

    - 201 { "result": "ucengine_4534543543.odp"} // the file id

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to upload files in this meeting

    - 404 { "error": "not_found" } // the meeting doesn't exists

### Notes

- You are able to force the filename if it is specified in the url or in
  the request's body (this second case is often handled by the browser).
- To avoid conflicts between files UC Engine generate a unique id which is returned in the result.

## List files

### URL

    GET /file/{org}/{meeting}

### Parameters

URL parameters:

    - org:          Organisation name                           af83
    - meeting:      Meeting name                                demo

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

### Returned values

Success:

    200 { "result": [ { "filename": "UCengine.odp"
                      , "token": "42314657480629893636680972"
                      , "description": "Présentation du projet UCengine"
                      }
                    , ...
                    ]}

Errors:

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

## Download a file

### URL

    GET /file/{org}/{meeting}/{filename}

### Parameters

URL parameters:

    - org:          Organisation name                           af83
    - meeting:      Meeting name                                demo
    - filename:     Filename                                    UCengine.odp

Encoded:

    - uid:         User Id                                      uid_63444326443_50150
    - sid:         Session Id                                   330249245470504

### Returned values

Success:

    200 The file to download

Errors:

    401 { "error": "unauthorized" }

    404 { "error": "not_found" }

    500 { "error": "unexpected_error" }


## Check user's rights

### URL

    GET /user/{uid}/acl/{object}/{action}

    GET /user/{uid}/acl/{object}/{action}/{org}

    GET /user/{uid}/acl/{object}/{action}/{org}/{meeting}

### Parameters

URL parameters:

    - uid:         User Id                                      uid_63444326443_50150
    - object:      The object on which the right apply          meeting | org | event | ...
    - action:      Authorized action for this right             add | delete | join | ...
    - org:         Organisation name                            af83
    - meeting:     Meeting name                                 demo

Encoded:

    - uid:         User Id                                              uid_63444326443_50150
    - sid:         Session Id                                           330249245470504
    - conditions:  An array of conditions to satisfy for this right

### Examples

If the 'romain' user wants to verify that the 'toto' user has the right to join the 'ucengine' meeting of the 'af83' organisation, the request will be :

        GET /user/toto/acl/meeting/join/af83/ucengine?uid=romain&sid=40324302840329843809543

### Returned values

Success:

    200 {"result": "true"} :

    200 {"result": "false"}

Errors:

    400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à vérifier les droits de cet utilisateur;

    404 { "error": "not_found" } : l'utilisateur n'existe pas

## Add a right to a user

### URL

    PUT /user/{uid}/acl/{object}/{action}

    PUT /user/{uid}/acl/{object}/{action}/{org}

    PUT /user/{uid}/acl/{object}/{action}/{org}/{meeting}

### Parameters

URL parameters:

    - uid:         User Id                                      uid_63444326443_50150
    - object:      The object on which the right apply          meeting | org | event | ...
    - action:      Authorized action for this right             add | delete | join | ...
    - org:         Organisation name                            af83
    - meeting:     Meeting name                                 demo

Encoded:

    - uid:         User Id                                              uid_63444326443_50150
    - sid:         Session Id                                           330249245470504
    - conditions:  An array of conditions to satisfy for this right

### Returned values

Success:

    201 { "result": "ok" } // the right has been successfully added

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to add this right

    - 404 { "error": "not_found" } // the user doesn't exists

## Delete a right

### URL

    DELETE /acl/{uid}/{domain}

    DELETE /acl/{uid}/{domain}/{org}

    DELETE /acl/{uid}/{domain}/{org}/{meeting}

### Parameters

URL parameters:

    - uid:         User Id                                      uid_63444326443_50150
    - object:      The object on which the right apply          meeting | org | event | ...
    - action:      Authorized action for this right             add | delete | join | ...
    - org:         Organisation name                            af83
    - meeting:     Meeting name                                 demo

Encoded:

    - uid:         User Id                                              uid_63444326443_50150
    - sid:         Session Id                                           330249245470504
    - conditions:  An array of conditions to satisfy for this right

### Returned values

Success:

    200 { "result": "ok" } // the right has been successfully deleted

Errors:

    - 400 { "error": "bad_parameters" } // at least one paremeter is missing or wrong

    - 401 { "error": "unauthorized" } // the user is not authorized to delete this right

    - 404 { "error", "not_found" } // the users doesn't exists

