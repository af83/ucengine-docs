# Roadmap

## In the next few weeks

* The auth backend `none` will be updated to disallow direct connection (only by the root user or a brick for example)
* Remove the `token` auth method (transparent)
* Remove `start`, `end` and metadata from the meeting
* Remove the implicit status of the meeting (upcoming, opened, closed or all)
* Allows to switch a meeting to be writable or readonly
* Remove metadata on the presence
* Join a roster and create meeting metadata will be stored in events metadata (internal.roster.add and internal.meeting.add)
* Add a config key to disallow creating user if not authenticated

## Later

* Better user API for update
* WebSocket API (need some work on yaws)
* Delete a meeting (clean all events and roles associated to this meeting)
* Rename `meeting` to `channel`
