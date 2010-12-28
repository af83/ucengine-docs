# Ruby library

## Installation

        gem install ucengine

## Getting started

        require 'rubygems'
        require 'ucengine'

        uce = UCEngine.new("localhost", 4567)
        uce.connect("uce@example.org", :credential => 'pwd') do |uce|
                uce.subscribe([], :type => 'chat.message.new', :search => 'HTML5') do |event|
                        uce.push(:location => [event['meeting']]
                                 :from => 'bot',
                                 :type => 'chat.message.new',
                                 :metadata => {"text" => "Hey, you were talking about HTML5"})
                end
        end

## More?

See the full API documentation on [rdoc.info](http://rdoc.info/github/AF83/ucengine.rb/master/frames)
