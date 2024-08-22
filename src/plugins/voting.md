# Voting rewards {#voting}
In case you want to give rewards for voting for your server, you will need two plugins - The first one is called "listener". This is a plugin that listens and takes care of receiving votes, but it can't give rewards (technically such plugin may exist). And then a second plugin that uses this listener receiving votes and gives a reward to the player when a vote is received (when the listener lets this  reward plugin know that a vote has been received).

The most common combination of a listener and a rewards plugin is [NuVotifier](https://www.spigotmc.org/resources/nuvotifier.13449/) with [SuperbVote](https://www.spigotmc.org/resources/superbvote.106203/),

or the updated alternative [VotifierPlus](https://www.spigotmc.org/resources/votifierplus.74040/) and [VotingPlugin](https://www.spigotmc.org/resources/votingplugin.15358/) (these are just examples, there are more options).

In order for a listener on a port to listen and receive votes, you need to set a port in the configuration of that listener to a port that is [open](../general/address-ports.md#open-port) (publicly accessible).

When you fill in the Votifier address for the voting page, this is the address and port set in the listener configuration, not the server port.

You can test the Votifier functionality using tool like <https://mctools.org/votifier-tester>