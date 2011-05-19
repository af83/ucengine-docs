# Create a brick

A brick is a daemon that speaks HTTP with U.C.Engine.

In this tutorial we will create a brick who send event *echo* for each chat message.

## Authorize brick on U.C.Engine

Add into *etc/uce.cfg* an entry.

```erlang
{bricks,
        [{"twitter", "da39a3ee5e6b4b0...."},
         {"echo", "secret_do_not_share_secret_do_not_share"}]}.
```

## Connect to U.C.Engine

The first step is to connect your brick with U.C.Engine.

```ruby
require 'ucengine'

uce = UCEngine.new("localhost", 5280)
uce.connect("echo", :credential => "secret_do_not_share_secret_do_not_share") do |uce|
     # we will add code here after
end
```

## Subscribe to events

You can subscribe to all events in all meetings or listening only some meetings.

In this case we want to subscribe to events *chat.message.new*.

```ruby
uce.subscribe([], :type => "chat.message.new", :start => uce.time) do |event|
   # for each events received, this block will be called
end
```

## Push Events

We now want to create an *echo* event with the same properties.

```ruby
uce.publish(:location => event['location'],
            :type => "echo",
            :parent => event['id'],
            :metadata => {:text => event['metadata']['text'],
                          :lang => event['metadata']['lang'],
                          :from => event['from']})
```

## Check ACL

If your brick need to check user's right, you should ask U.C.Engine about **object** and **action** current value. You can create your own ACL.

## Final result

This is the final result of your brick.

```ruby
require 'ucengine'

uce = UCEngine.new("localhost", 5280)
uce.connect("echo", :credential => "secret_do_not_share_secret_do_not_share") do |uce|
  uce.subscribe([], :type => "chat.message.new", :start => uce.time) do |event|
    uce.publish(:location => event['location'],
                :type => "echo",
                :parent => event['id'],
                :metadata => {:text => event['metadata']['text'],
                              :lang => event['metadata']['lang'],
                              :from => event['from']})
  end
end
```

## Librairies

* **Javascript**: [[Javascript API reference|ucejs]]
* **Ruby**: [[install ruby API|ucengine-rb]]
