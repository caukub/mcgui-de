# Getting started {#getting-started}
The following part contains information useful when you are a complete beginner and don't know how to get started.

This chapter assumes you can run a Minecraft server already. It is not a tutorial on how to setup a Minecraft server (if you use [managed](administration/host-types.md#managed) host, you're good to go. If not, there are many tutorials on the internet).

## Be aware of {#be-aware-of}
You cannot [downgrade](general/downgrade.md) a server without losing worlds!

If you want to allow cracked players (players without purchased version of the game) to connect, you must secure the server, see [here](security/offline-mode.md#offline-mode-security). Allowing cracked players also implies a number of other things, see [here](general/online-mode.md#offline-mode).

## How to give yourself admin access {#permissions}
To give yourself full access, you can execute [command](general/commands.md#commands) `op <nick>` in the console. This will give you [OP](vanilla/op.md#op) (operator status), that means privileges for _everything_.

## Vanilla server for friends {#vanilla}
If you want a Minecraft server with pure Vanilla experience, [use the Fabric platform](general/platforms.md#platform-change) and [install mod](mods.md#mod-installation) [Lithium](https://modrinth.com/mod/lithium/versions) (for optimization that does not affect Vanilla mechanics. Players will connect with the Vanilla version of the game with no problem).

## Server with plugins {#plugins}
### Server platform {#plugins-platform}
If you want to create standard public server with plugins, use [Paper](https://papermc.io/) (do not use Spigot or CraftBukkit). You can read more about plugin platforms [here](general/platforms.md#plugin-platforms).

### How to install plugins
To install a plugin on a server, upload the plugin to the `/plugins/` folder and then restart the server (see [here](plugins/basics.md#plugin-installation)).

You can list installed plugins using the `plugins` (or just `pl`) [command](general/commands.md) (green ones are working, red ones are not).

### How to configure a plugin {#plugins-configuration}
If you want to configure the plugin, you can do so either by using the commands found in [plugin documentation](general/docs.md) (to execute some commands you need to have access to it using OP/properly configured [permissions](general/permissions.md)) or by using the configuration files.

If the plugin generates configuration files, they are created in the `/plugins/<plugin>/` folder when the plugin is first started. To reflect changes in the configuration files, the server must be restarted, or the _plugin reload_ command must be executed if the plugin has such a command. If the plugin has such command, you can find it in the documentation of the plugin. For example, the EssentialsX _reload_ command is `essentials reload`, [do not use the `reload` command itself!](plugins/reload.md)).

You can read more about the configuration files [here](general/configs.md#config).

Things like commands, settings, etc. are always plugin specific. So if you don't know how to do something, always look in the [documentation](general/docs.md) of the plugin.

### Plugin is not working {#plugins-doesnt-work}
In case plugin doesn't work, see [here](plugins/basics.md#plugin-doesnt-work-basics).

If that doesn't help to make the plugin work, see [here](plugins/basics.md#plugin-doesnt-work) for instructions on how to deal with such issue.

### Other {#plugins-other}
You'll probably want to configure permissions (who is allowed to do what). For that reason, you will need to learn how to work with them. You can read more about them [here](general/permissions.md#permissions).

For more basic information on how to work with plugins, see [here](plugins/basics.md#bukkit-plugins).

To learn how to implement the most commonly used features on the server with plugins, see [here](plugins/useful.md#plugins-useful).

## Server with plugins with multiple game modes {#proxy}
If you decide to make a server with multiple game modes, you'll want to use a proxy. You can learn more about proxies [here](proxy.md#proxy).

If you use a proxy, you need to [secure](security/proxy.md) the [backend-servers](~backend-server), don't forget about it!

## Modded server {#modded}
If you want to create a server with mods, instructions on how to install the mods/modpack can be found [here](mods.md#mods).

Unless the mods on the server are server-side only (that is basically always NOT when you use mods adding new things to the game, e.g. items, mobs, ...), the player must have the mods/modpack installed on the client as well and will not connect with Vanilla.

## Issues {#issues}
In case you encounter a problem with either a plugin (not working) or the server itself (crashes), instructions on how to deal with such a problem can be found [here](problem-solving/how-to-deal-with-issues.md#how-to-deal-with-issues).

You can almost always find the cause of the issue in the [server log](problem-solving/logs.md). So if some unexpected problem occurs,find the cause in the log and fix it. If another problem occurs after the fix, find the cause in new log and fix it. There is no point in blindly guessing the cause when you can always read it from the server log. So if you have a problem, always check the log first!

## Configuring server {#server-configuration}
### Server configuration {#configuring-server}
You can configure the server itself using the [configuration files](general/configs.md), which are located in the [server root directory](~root-directory), or in the `/config/` folder on Paper. The basic server settings are located in the `server.properties` file (on all platforms)

### Plugin configuration {#configuring-plugins}
[see here](#plugins-configuration)

### Mod configuration {#configuring-mods}
[see here](mods.md#configuration)