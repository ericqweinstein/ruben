Ruben
=====

###Description

Ruben is an IRC chat bot written in Ruby. He is inspired, in part, by [Hubot](http://hubot.github.com/), his CoffeeScript brother from another mother.

###Dependencies

* Ruby 1.9.3+
* Rake 10.0.3+
* RSpec 2.12.2+

###Installation

Ruben's a little janky, but he works. Version 1.0.1 is available from RubyGems; you can get your version of Ruben by typing

    $ gem install ruben

###Getting Started

Ruben comes with a `bin/ruben` executable, so you can run him with

    $ ruben <server> <port> <channel> <nick>

Ruben takes a server name, port number, channel name, and nick as command line arguments. For example, if you type: 

    $ ruben irc.freenode.net 6667 test_chan ruben_

You should see:

    $ >> USER ruben 0 * :Ruben
    $ >> NICK ruben_
    $ >> JOIN #test_chan

    ...

###Adding Scripts

You can extend Ruben's functionality by adding scripts to `/scripts`. Each script should be a `.rb` file that instantiates a new `Listener` object, like so:

    thing_to_do lambda do
      # Arcane magicks go here
    end

    Listener.new(/Regexp/, thing_to_do)

Ruben's listeners hear every incoming IRC message. If a listener's Regexp matches the inbound message, Ruben will call the associated lambda.

