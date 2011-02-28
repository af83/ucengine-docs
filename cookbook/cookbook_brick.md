# Create a brick

A brick is a daemon that speaks HTTP with U.C.Engine.

## Authorize brick on U.C.Engine

Add into *etc/uce.cfg* an entry.

```erlang
{bricks,
        [{"twitter", "da39a3ee5e6b4b0...."},
         {"yourbrickname", "secret_do_not_share_secret_do_not_share"}]}.
```

## Connect to U.C.Engine

The first step is to connect your brick with U.C.Engine.

## Subscribe to events

You can subscribe to all events in all meetings or listening only some meetings.

## Push Events

## Check ACL

If your brick need to check user's right, you should ask U.C.Engine about **object** and **action** current value. You can create your own ACL.

## Librairies

* **Javascript**: [[Javascript API reference|ucejs]]
* **Ruby**: [[install ruby API|ruby_install]]
