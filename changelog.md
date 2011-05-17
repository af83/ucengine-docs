# Changelog

## 0.5 to 0.6 (currently in development)

* Improved many widgets.
* Fix long polling with nginx (again).
* API:
  * Add a new entry point to [[list access rights attached to a role|api#list-access-rights-for-a-role]].
  * Nobody can push 'internal.*' events from API.
  * Now sent metadata when uploading a file can be retrieved through the corresponding internal.file.add event.
  * Update file upload api to allow metadata in multipart/form-data.
  * Add *forceContentType* parameter on file upload api.
* [[uce.js|ucejs]]:
  * add `UCEngine.meeting(name).can` and `UCEngine.meeting(name).canCurrentUser`.
* [[Filesharing brick|brick_filesharing]]
  * The brick add an *uploadedby* metadata when uploading generated images

## 0.4 to 0.5

* ucectl command-line tool have been renamed ucengine-admin.
* Remove authentication on `/time` end point.
* Search API:
  * Fix `totalResults` field in search api.
  * Add `order` parameter in search api.
* Uce.js:
  * add an `options` parameter in `UCEngine.search` and `UCEngine.meeting(name).search`
  * add a `conditions` parameter to `UCEngine.user.can`
* Roles and ACL:
  * ucengine-admin command-line tool:
    - remove all the commands regarding ACL
    - add a new set of commands to add, remove and configure roles
    - add a new set of commands to give or remove roles to a user
    - add a new command to check user rights
  * the `acl` section of the configuration file has been removed.
  * a new `roles` section of the configuration file can be use to set default roles and associated rights.
  * the '/acl' entry point of the REST API is no longer available, the
    authorization are handled by both the '/role' and '/user' entry
    points. See the [[Roles|api#roles]] section
    of the API documentation.

  * The user id that is used in most API calls is now returned by the
    server after user creation. The username can still be used to create
    a new presence. See the [[Authentication|api#connect-user]] section
    of the API documentation.
* Add a `log_dir` option in the [[config file|config]], used for yaws logs.

## 0.4.1

* Fix a bug on private events: the events are now correctly filtered on the 'to' parameter.
* Add `UCEngine.search` and `UCEngine.meeting(name).search` in [[uce.js|ucejs]].

## 0.3 to 0.4

* `/api/0.3` is not available anymore, use `/api/0.4` instead.
* Vhosts: see [[config]].
* New search api: see [[Search events in U.C.Engine|api#search-events-in-ucengine]].
* New entry point to retrieve presence information: see [[Retrieve presence informations|api#retrieve-presence-informations]].
* Fix long polling with nginx.
* Refactor [[uce.js library|ucejs]]

  You must call uce.createClient() to have an instance of `UCEngine`.

  `uce.presence.create` and `uce.presence.close` have been removed. You should use `UCEngine.auth(uid, credential, metadata, callback)` and `UCEngine.close(callback)`.

  `UCEngine.meeting(name).bind` is replaced by `UCEngine.meeting(name).on`. `UCEngine.meeting(name).bind` is now deprecated on stay an alias for `UCEngine.meeting(name).on`.

* API: there is no more public methods except the presence creation.
  So you have to be logged in to do anything now. Moreover the public methods now support new rights:

  - infos get
  - meeting get
  - meeting list

* Mongodb configuration have been updated. See the [[config]] doc.
* [[CORS|http://www.w3.org/TR/cors/]] support.
* Rename "datas" configuration key to "data".

## 0.2 to 0.3

* `/api/0.2` is not available anymore, use `/api/0.3` instead.

* Domains have been introduced, all records get a new field "domain" which contains the name of the host where the record has been stored.

  **ReST API**

  A consequence of this change that is **not backward compatible** is the return of /infos:

  `{"domain": "ucengine.org", "metadata": [{"description", "a simple description"}]` instead of `[{"description", "a simple description"}]` only.

  Note that the 'meeting' field in the event object has been replaced by 'location', although the meaning is the same.

* The API now use POST to created records and PUT to update them. This is a **backward incompatible change*.*

  **ReST API:**

  Some examples:
  `POST /meeting/?name={meeting}` instead of `PUT /meeting/{meeting}`

  `PUT /user/{uid}` to update a user

  **ucectl**

  Most of the calls to ucectl now require a *--domain {domain}* argument.

## 0.1 to 0.2

* `/api/0.1` is no more available, use `/api/0.2` instead.

* Organisations have been removed. This is a **backward incompatible change**.

  **ReST API:**

  Some examples:
  `PUT /meeting/all/{meeting}/roster/{uid}` instead of `PUT /meeting/{org}/all/{meeting}/roster/{uid}` for joining meeting.

  `PUT /event/{org}/{meeting}` is replaced by `PUT /event/{meeting}`

  `/org` entry point is no longer available

  **Ucejs:**

  `uce.org(orgname).meeting(meetingname)` is no longer available. To fetch meeting information, use `uce.meeting(meetingname)`.

  To connect a user, use `uce.presence.create(credential, uid, nickname, callback)` instead of `uce.presence.create(credential, **org**, uid, nickname, callback)`.

  **ucengine.rb:**

  `uce.subscribe([org, meeting])` is replaced by `uce.subscribe([meeting])`.


* A new entry point is available: `/infos`. Please refer to [[api]], [[ucectl]] and [[ucejs]] documentation. You can store some generic informations about current domain.
