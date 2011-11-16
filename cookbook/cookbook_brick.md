# Create a brick

A brick is a daemon that speaks HTTP with U.C.Engine.

In this tutorial we will create a brick who send event *echo* for each chat message.

You can use the em-ucengine gem to create a brick.

## Authorize brick on U.C.Engine

Add into *etc/uce.cfg* an entry.

```erlang
{bricks,
        [{"twitter", "da39a3ee5e6b4b0...."},
         {"echo", "secret_do_not_share_secret_do_not_share"}]}.
```

## Install ucengine-em

    gem install em-ucengine

## Connect to U.C.Engine

The first step is to connect your brick with U.C.Engine. The easiest way is to use the module `EM::UCEngine::Brick` which will do that for you.

```ruby
require 'em-ucengine'

class EchoBrick
    include EM::UCEngine::Brick
end

EM.run do
  brick = EchoBrick.new( :host => "localhost", :port => 5280,
                       :name => "echo", :credential => "secret_do_not_share_secret_do_not_share" )
  brick.start
end
```

## Subscribe to events

You can subscribe to all events in all meetings or listening only some meetings.

In this case we want to subscribe to events *chat.message.new*.

```ruby
class EchoBrick
    include EM::UCEngine::Brick

    on "chat.message.new" do |event|
       # for each events received, this block will be called
    end
end
```

## Push Events

We now want to create an *echo* event with the same properties.

```ruby
@uce.publish("storm",
             event['location'],
             { :text => event['metadata']['text'],
               :lang => event['metadata']['lang'],
               :from => event['from'] },
             event['id'])
```

## Check ACL

If your brick need to check user's right, you should ask U.C.Engine about **object** and **action** current value. You can create your own ACL.

## Final result

This is the final result of your brick.

```ruby
require 'em-ucengine'

class EchoBrick
    include EM::UCEngine::Brick

    on "chat.message.new" do |event|
      @uce.publish("storm",
                   event['location'],
                   { :text => event['metadata']['text'],
                     :lang => event['metadata']['lang'],
                     :from => event['from'] },
                   event['id'])
    end
end

EM.run do
  brick = EchoBrick.new( :host => "localhost", :port => 5280,
                       :name => "echo", :credential => "secret_do_not_share_secret_do_not_share" )
  brick.start
end
```

## Librairies

* **Javascript**: [[Javascript API reference|ucejs]]
* **Ruby**: https://github.com/AF83/ucengine.em/
