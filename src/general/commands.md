# Commands {#commands}
A command is an instruction that will do something in the game. For example, the `tp <nick>` command teleports the player who executes the command to another player.

The command can either be executed by the player or by the console.

## Console {#commands-console}
**Beware!** Do not use the initial slash in the console as in chat, since everything typed into the console is a command (there are exceptions but this will usualy lead to 'Unknown Command' error).

The console has full permissions to all commands.

## Permissions {#command-permissions}
In the case where a command is executed by the player and not the console (and the player does not have permissions by default), permissions must be set to be able to execute the command. Read more about permissions [here](permissions.md#permissions).

## Command executor {#command-executor}
An important, but by begginers often misunderstood principle is the command executor/command sender.

As mentioned above, a command can be executed either by the player or by the console. The command can differ based on this.

In the case where the command is executed by the player, the player may need to have [permissions](#command-permissions) properly configured to be able to execute the command. Therefore, for plugins like Citizens/ArmorStandTools/asCMD that execute a command when an NPC/armor stand is clicked, it may be appropriate to have the command executed by the console. This is because in that case it is not necessary to give player a permission that can be abused in some situations.

In the case where the `tp <player>` command is executed by the console, no teleportation will be performed as the server cannot know what player you want to teleport to. Therefore, if you want to teleport a player from the console, you need to use the `tp <player> <teleportTo>` command, where it is specified which player you are teleporting to the other player. Why this is the case is probably obvious. And that's how it works for all player-specific commands. If the command is executed by the console, you must use a command where the player name is specified, otherwise the server cannot know which player the command is to be executed for. Other examples are `gamemode creative` (can be used in game but not in console) and `gamemode creative <nick>` (can be used in console).

Sometimes it is appropriate to have the console execute the command, so the player does not need to have permissions set for the command.

For example, if you wanted to set the Citizens plugin to have the server teleport the player to location X: 0, Y: 64, Z: 0 after clicking on an NPC, the following command can be used: `npc command add -p tp 0 64 0` (the `-p` flag specifies the execution of the command by the player clicking on the NPC). In this case, however, the player must have permission to the `tp` command, which you probably don't want. In this case, it is appropriate to use a command that is executed by the console, so no permission is needed for the command - `npc command add tp <p> 0 64 0` (Citizens replaces `<p>` with the player's name)

## Commands arguments {#command-args}
The best explanation of what command arguments are is a specific example. For the `tp 0 64 20` command, *tp* is the command itself, *0* is the first argument, *64* is the second argument, and *20* is the third argument. Sometimes (especially in the context of programming), command arguments are numbered from zero, so *0* is the null argument, *64* is the first argument, and *20* is the second argument.

## Command syntax {#command-syntax}
A command can have different syntax to indicate how it can be used. Example of such syntax is `lp user/group <user|group> meta setprefix [priority] <prefix> [context...]`, `essentials tptoggle [player] [on|off]`, or `gamemode <peaceful|easy|normal|hard>`.

Command notations may vary slightly depending on the documentation, but generally you will see the following tags:
- `|` - or

For example, in the `repair [hand|all]` notation, the `|` tag means "_OR_", i.e. you can use the `repair hand` command (to repair an item in the player's hand) or the `repair all` command (to repair all items in the player's inventory).

- `<>` - required argument
- `[]` - optional argument

For example, notation `lp user <nick> permission set <permission> [context]` means that you must use the [argument](#command-args) *nick* and *permission*, and you can set the context using the last [argument](#command-args) if you want. However, if you don't want to set any context, just omit the *context* argument and the command will be valid, just context will not be set.

## Command namespaces {#command-namespaces}
In the `minecraft:reload` command, the namespace is *minecraft* and the command itself is *reload*.

The namespace in the command may or may not be used.

It is used especially in cases where the same command exists multiple times, and thus the commands overlap (for example, `ascmd` for [*ArmorStandTools*](https://www.spigotmc.org/resources/armor-stand-tools.2237/) and [*asCMD*](https://www.spigotmc.org/resources/ascmd-armor-stand-command-great-for-lobby-servers.41127/))

Therefore, if you want to use the Vanilla `give` command, but you have the *EssentialsX* plugin installed that also provides the `give` command, just use the `minecraft:give <arguments>` command. The same is true, for example, with the `minecraft:reload` command, which reloads Minecraft datapacks instead of executing the `reload` command from Spigot, which should not be used.

Displaying namespaces in chat commands can be disabled by setting `send-namespaced` to `false` in `spigot.yml`.


## Command aliases {#command-aliases}
To create aliases, you can use [`commands.yml`](https://bukkit.fandom.com/wiki/Commands.yml) on the Spigot server or its fork, or a plugin that allows creating such as [*MyCommand*](https://www.spigotmc.org/resources/mycommand.22272/).

The [*CMI*](https://www.zrips.net/cmi/commands/custom-alias/) plugin (which you won't purchase just for command aliases, but you can use it for that purpose if you already use the plugin) also has such a feature.

## Custom commands {#custom-commands}
If you need more sophisticated system for custom commands, you can use the [*MyCommand*](https://www.spigotmc.org/resources/mycommand.22272/) plugin.

## How to find out commands/Non existing commands {#making-commands-up}
Plugin commands and [permissions](permissions.md#permissions) for them can always be found in the documentation for the specific plugin. Do not try to guess the commands!

## Tabbing commands {#command-tabbing}
If you want to prevent command "tabbing", you can read more [here](../plugins/list.md).