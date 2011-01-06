# History

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
