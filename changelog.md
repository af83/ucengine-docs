# Changelog

## 0.3 to 0.4 (currently in development)

* Vhosts: see [[config]].
* New search api: See [[Search events in U.C.Engine|api#search-events-in-ucengine]].
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

  `PUT /user/{uid}` to update an user

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
