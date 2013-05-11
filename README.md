Ruben
=====

###Description

Ruben is an IRC chat bot written in Ruby. He is inspired, in part, by [Hubot](http://hubot.github.com/), his CoffeeScript brother from another mother.

###Dependencies

* Ruby 1.9.3 (not tested in Ruby 2.0)
* Rake 10.0.3 (for running tests)
* RSpec 2.12.2 (for running tests)

###Installation

Version 1.0.2 is available from RubyGems; you can get your version of Ruben by typing

```bash
$ gem install ruben
```

###Getting Started

Ruben comes with a `bin/ruben` executable, so you can run him with

```bash
$ ruben <server> <port> <channel> <nick>
```

Ruben takes a server name, port number, channel name, and nick as command line arguments. For example, if you type: 

```bash
$ ruben irc.freenode.net 6667 test_chan ruben_
```

You should see:

```bash
$ >> USER ruben 0 * :Ruben
$ >> NICK ruben_
$ >> JOIN #test_chan

...
```

You can get Ruben's usage information by typing `ruben -h` or `ruben --help`.

###Adding Scripts

You can extend Ruben's functionality by adding scripts to `/scripts`. Each script should be a `.rb` file that instantiates a new `Listener` object, like so:

```ruby
thing_to_do lambda do
  # Arcane magicks go here
end

Listener.new(/Regexp/, thing_to_do)
```

Ruben's listeners hear every incoming IRC message. If a listener's Regexp matches the inbound message, Ruben will call the associated lambda.

