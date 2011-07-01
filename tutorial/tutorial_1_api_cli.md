# Tutorial - Playing with API and command line tool

You will need:

* U.C.Engine up and running - see the [[installation guide|install]].
* a text editor.
* few javascript skills.

## Create one user

* User: *john* - password: *mypwd*

    $> bin/ucengine-admin localhost user add 'john' 'password' 'mypwd'
    Success: 52050861150575074077437530343071 # User id which is also the name of the default user role

You can now connect your user to have a session id.

     $> curl -X POST -d "name=john&credential=mypwd" http://localhost:5280/api/0.5/presence
     {"result":{"uid":"52050861150575074077437530343071","sid":"14981982490282873933159518440896"}

## Create one meeting

Interaction between users take place in a meeting room. Let's create a *demo* meeting.

    $> bin/ucengine-admin localhost meeting add "demo"
    Success: created

See [[ucengine-admin]] for more informations.

## Interact with the meeting

With the user and the meeting, we can now push events. Let's push an event *ping* on the meeting *demo*.

    $> curl -X POST -d "type=ping&uid=52050861150575074077437530343071&sid=14981982490282873933159518440896" http://localhost:5280/api/0.5/event/demo
    {"result":"11141706304362703195480780578107"}
    $> curl http://localhost:5280/api/0.5/event/demo/11141706304362703195480780578107?uid=52050861150575074077437530343071&sid=14981982490282873933159518440896
    {"result": {"type":"ping",
               "domain":"localhost",
               "datetime":1309427837915,
               "id":"11141706304362703195480780578107",
               "location":"demo",
               "from":"52050861150575074077437530343071",
               "metadata":{}}
               }

## Further reading

* [[Creating a chat widget|tutorial_2_js_app]]
* [[ReST API|api]]
