# Ruby library

## Installation

    gem install ucengine

## Getting started

```ruby
require 'rubygems'
require 'ucengine'

uce = UCEngine.new("localhost", 4567)
uce.connect("uce@example.org", :credential => 'pwd') do |uce|
  uce.subscribe("", :type => 'chat.message.new', :search => 'HTML5') do |event|
    uce.publish(:location => event['location'],
                :from => 'bot',
                :type => 'chat.message.new',
                :metadata => {"text" => "Hey, you were talking about HTML5",
                              "lang" => event['metadata']['lang']})
  end
end
```

## More?

See the full API documentation on [rubydoc.info](http://rubydoc.info/gems/ucengine/0.4.0/UCEngine)
