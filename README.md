# Paiige

Paiige is a simple Ruby bot designed for telnet-based chat servers, or MUD/MUSH/other MU* flavors. It takes in input, and spits out a Markov-chain-generated sentence (based on the input it's seen) on demand.

To get your very own Paiige, you'll need Ruby 2.0.0 installed or newer . Then, follow these steps:

1. Clone or download this repository
1. Copy `config.rb.dist` to `config.rb` and edit to set config variables as needed
1. Run `bundle install` to install prerequisites
1. Run `ruby main.rb`

By default, Paiige is configured to speak whenever she hears somoene 'say' her name, or whenever she sees the string `TALK`.

So, for example, on the Paiige player, you might choose to do `@adesc me=think TALK`. Further customizations shouldn't be that hard - just edit the regexps in `main.rb`.

More features may or may not be added. Issues are fine, pull requests are better.