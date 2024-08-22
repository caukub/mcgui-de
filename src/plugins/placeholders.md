# Placeholders {#placeholders}
## What is a placeholder {#what-is-placeholder}
A placeholder is text that represents a variable. For example, the placeholder `%player_name%` represenets the name of a player.

You can often see placeholders in a scoreboard, for example.

## Internal placeholders {#internal-placeholders}
Internal placeholders are placeholders that are specific to a particular plugin. If a plugin has internal placeholders, you can find them in the plugin documentation. Such placeholder can only be used in the configuration of the plugin. For example, in the TAB plugin you can use the placeholder `%online%` (returns the number of players on the server), `%world%` (returns the name of the world the player is in) and many others, see <https://github.com/NEZNAMY/TAB/wiki/Placeholders#internal-placeholders>

Internal placeholders, unlike PlaceholderAPI placeholders, do not have to be in the `%placeholder%` format, you may also encounter the `{placeholder}` format and eventuelly some other formats too.

## PlaceholderAPI placeholders {#papi}
PlaceholderAPI (PAPI) is a plugin. PlaceholderAPI placeholders can be used in any plugin with PAPI support. PAPI placeholders always have  `%placeholder%` format.

### Basics {#papi-basics}
To make PAPI placeholder available, you need to a) have a plugin on your server that provides such placeholder, or b) install a PAPI expansion (= placeholder package, extension).

The expansion can be installed either by using the `papi ecloud download <expansionName>` command (if the expansion is on [eCloud](https://api.extendedclip.com/all/)), or by manually uploading the expansion to `/plugins/PlaceholderAPI/expansions/`.

*To apply changes after downloading/uploading the expansion, the plugin must be reloaded with `papi reload` command or the server must be restarted*.

When the expansion is configurable, the configuration is most likely located in PAPI config itself, i.e. in `/plugins/PlaceholderAPI/config.yml`.

You can get value of a placeholder by using `papi parse <player|me> %placeholder%` [command](../general/commands.md#commands).

For the `papi parse` command, for placeholders that do not require a player, the `--null` argument can be used instead of the player name or *me*, e.g. `papi parse --null %server_tps%`, which may be useful when the command is executed from the console and no player is connected to the server.

The documentation of the plugin, where you can find everything you need, can be found at the following link: <https://wiki.placeholderapi.com/>

If you're newbie, it's a good idea to check the list of expansions so you have some basic idea of what's available. A large list of expansions can be found [here](https://wiki.placeholderapi.com/users/placeholder-list).

Below you can see examples of most commonly used expansions.

- [Player](https://wiki.placeholderapi.com/users/placeholder-list/#player)

Contains "non-plugin" information about the player, e.g. his name, coordinates, or health.

- [Server](https://wiki.placeholderapi.com/users/placeholder-list/#server)

Contains information about the server, e.g. number of online players, TPS, or
RAM usage.

- [Statistic](https://wiki.placeholderapi.com/users/placeholder-list/#statistic)

Contains player stats, e.g. time played (these stats are stored in the main world folder automatically without any plugin, as this is a Vanilla feature, learn more [here](../general/world.md#statistic)).

- [Math](https://wiki.placeholderapi.com/users/placeholder-list/#math)

Allows the use of math operations with placeholders, e.g. `%math_{world_name_world1}+{world_name_world2}%`. This placeholder returns the sum of the number of players in world *world1* and *world2*.

- [Vault](https://wiki.placeholderapi.com/users/placeholder-list/#vault)

Vault placeholders are mainly used to display prefixes and economy info (amount of player's money). The Vault plugin alone is not enough to make placeholders work, you need to install the *Vault* expansion!

- [Pinger](https://wiki.placeholderapi.com/users/placeholder-list/#pinger)

Expansion *Pinger* is most commonly used on proxy servers to get information about another server.

### Placeholder is not working (how to debug/troubleshooting) {#papi-debugging}
In case the placeholder itself is displayed instead of the placeholder value, do the following.

_Determine if the placeholder itself is working_.

Use `papi parse <player|me> %placeholder%` to see if the placeholder itself works (= the placeholder value is shown instead of the placeholder itself).

#### Placeholder itself is working {#troubleshooting-is-working}
In the case where the placeholder value is returned, the error is in the plugin trying to display it. This can basically mean the following:

- The plugin does not support PAPI placeholders

In order to display a PAPI placeholder, the plugin that is trying to display it must support PAPI. If you want to use a placeholder in chat, for example, you need a plugin that will allow placeholders to be displayed in messages (which you probably shouldn't do, this is just an example).

- The plugin has special format for placeholders

Although rare, some plugins have a special format for PAPI placeholders. For example, in the HolographicDisplays plugin, the PAPI placeholder has the following format by default: `{papi: placeholder}`. Read more in the documentation of the plugin.

- Incompatible versions of PlaceholderAPI

If you can see errors related to PlaceholderAPI in the log, make sure you are using the current version of PlaceholderAPI and the plugin that displays the placeholder. If so, contact the plugin author.

- the plugin contains a bug

If the plugin supports PAPI, you are using the correct format, and there is no further information in the documentation as to why the placeholder might not work (e.g. need to enable PAPI support in the config), contact the plugin author or support.

#### Placeholder itself does not work {#troubleshooting-is-not-working}
In the case where the placeholder itself is displayed instead of its value, do the following.

If the placeholder is provided by an expansion, make sure you have the expansion installed (for a list of installed expansions, use the `papi list` [command](../general/commands.md#commands)). If not, you can install the expansion using the `papi ecloud download <expansion>` command, or by uploading the expansion manually to `/plugins/PlaceholderAPI/expansions/`. Remember that you need to reload the plugin with `papi reload` or restart the server to reflect the changes.

In case you have the expansion installed, make sure you are using the current version of the expansion and there are no multiple versions of the same expansion installed in `/plugins/PlaceholderAPI/expansions/`.

Make sure you have a version of PlaceholderAPI that is compatible with the server version, and that the PlaceholderAPI plugin does not throw any errors (which you can see in the server [log](../problem-solving/logs.md)), and that the placeholder you are trying to use exists.

#### Placeholder works, but returns incorrect information {#troubleshooting-outdated-info}
A placeholder can display "outdated" information in two cases. To find out what value the placeholder currently returns, use the `papi parse me %placeholder%` command.

1. The placeholder itself returns the current value, but the plugin that displays has some update time

In this case, it is necessary to speed up the placeholder update time in the plugin that displays the placeholder.

2. The placeholder itself has some update time

This value can probably be changed in the expansion configuration, i.e. PAPI config. This is most often encountered with placeholders that take some time to get value of it (most often placeholders that return information obtained via the Internet).

## Guessing the placeholders / Making placeholders up {#making-up-placeholders}
Don't try to guess the placeholders! Always look them up in the documentation of the plugin/expansion!

### Other {#papi-other}
It's important to note that placeholders are player specific, so for example the placeholder `%vault_eco_balance_formatted%` will show different balance for each player (the balance of the player the placeholder is shown to). To display the value of placeholder of specific player, use the [ParseOther](https://wiki.placeholderapi.com/users/placeholder-list/#parseother) expansion.

If you want to make a leaderboard, such placeholder needs to exist. For example, CMI has a placeholder `%cmi_baltop_name_[1-10]%` and `%cmi_baltop_money_[1-10]%` for the richest players. If the plugin has no such placeholder, it can be created using the [ajLeaderboards](https://modrinth.com/plugin/ajleaderboards) plugin, but this plugin may have a negative impact on server performance.

The PlaceholderAPI plugin itself is a Spigot plugin only, so it cannot be installed on proxy.