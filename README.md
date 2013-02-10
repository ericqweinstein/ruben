Ruben
=====

###Description

Ruben is an IRC chat bot written in Ruby. He is inspired, in part, by [Hubot](http://hubot.github.com/), his CoffeeScript brother from another mother.

###Dependencies

* Ruby 1.9.3+
* Rake 10.0.3+
* RSpec 2.12.2+

###Installation

Ruben isn't quite finished, so he hasn't been pushed to RubyGems. If you want to get your own copy of Ruben, can clone the repo:

    $ git clone https://github.com/ericqweinstein/ruben

In the `ruben/` directory, run his (admittedly sparse) tests:

    $ rake

Build the gem:

    $ gem build ruben.gemspec

And install it:

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

And so on.

###Adding Scripts

You can extend Ruben's functionality by adding scripts to `/scripts`, like so:

    Listener.new(/Regexp/, "response string")

Ruben's listeners hear every incoming IRC message. If a listener's Regexp matches the inbound message, Ruben will respond with the associated text string.

