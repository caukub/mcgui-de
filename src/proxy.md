# Proxy {#proxy}
A proxy is a bridge between classic servers that connects [backend](~backend-server) (= "classic") servers. This means that the player can switch between them without disconnecting from the server.

## Platforms {#platforms}
Probably the most well-known, but [no longer most used](https://bstats.org) proxy platform is BungeeCord. Nowadays you should use the modern variant Velocity. There is basically no reason to use Bungee anymore. You can read more about proxy platforms [here](general/platforms.md#proxy-platforms).

## Usecase {#proxy-usecase}
Proxies are worth using pretty much any time you want multiple game modes on your server. As an example, if you wanted a server with a "Survival" and "SkyBlock" game mode, the most ideal would be to have a total of 4 servers:

- 1 proxy server
- 1 lobby server
- 1 survival server
- 1 skyblock server

Why not have everything on one server? The answer is simple. It's incredibly inflexible and limiting.

For example - what if you wanted the `spawn` command to teleport players to a spawn based on game mode (i.e. on survival the command would teleport to the survival spawn and on skyblock the command would teleport to the skyblock spawn).

If Survival and SkyBlock were two separate servers, this would be no problem. By default, the plugin providing the `spawn` command doesn't have support for multiple worlds because there is usually only one spawn per server. If there were multiple game modes on a single server, in that case you would need to devise a solution to achieve such behaviour. The same goes for splitting things like chat and such.

You would encounter a number of additional complications and limitations. The problem arises especially with plugins, as many of them don't have support for individual worlds and therefore such a solution wouldn't even be possible.

For some things, such as commands, this could be solved (although coming up with such solutions would be a waste of time and not everyone is capable of coming up with a solution, especially if they don't have much experience), but for plugin features there simply wouldn't be a solution. There are a really large number of such limitations, and you would gradually encounter them.

So it's pretty much always worth using a proxy when you want multiple game modes on your server (e.g. when you want a server with survival and skyblock). There are multiple usecases, but this is the most common one.

So for a proxy to work properly you need at least 3 servers - one proxy server and two [backend](~backend-server) servers. Or not really. One proxy and one [backend](~backend-server) server is enough to work properly, but this doesn't make sense in most cases, since the purpose of a proxy is mainly to connect multiple servers (however, there are uses, for example, when you want to use a plugin that only supports proxy, or when you want to "hide" a [backend](~backend-server) server behind a proxy). Most often, however, you will see a total of at least four servers because of the lobby server (1x proxy, 1x lobby, 1x server1, 1x server2).

## How to switch between servers? {#server-switching}
Basically, you can switch to another server using the `server [server]` command (without the [argument](general/commands.md#command-args) *server*, a list of servers will be shown).

By default, you'll want to set it up for players to be able to switch servers via the lobby they get to after connecting (and after executing `hub`, `lobby`, etc (which requires a plugin) if they want to move to it from a server). This can be done in various ways. Whether using menus (can be done with DeluxeMenus for example), NPCs (e.g. Citizens), or armor stands (e.g. ArmorStandTools). All of these plugins have specific functions for teleporting between proxies, which you can read more about in the [documentation](general/docs.md#docs) of the plugin.

## Permission Settings {#permissions}
In the case where you want to have permissions synchronized across servers and be able to use commands that require proxy permissions, you need to set up a permission plugin for the proxy. You can find out how to do this with LuckPerms [here](plugins/specific/luckpems.md#luckperms-proxy).

## How proxy works {#how-proxy-works}
It's important to note that the proxy is just a bridge between the classic servers and is not a standalone Minecraft server to play on in the standard way.

Players always connect through this proxy server. The [backend servers](~backend-server) cannot be connected to directly (by default. In certain cases it can, but it is a vulnerability, see [here](security/proxy.md#proxy-security)), always connect via the proxy address!

## Basics / Proxy Setup / Proxy Configuration {#proxy-setup}
On both Velocity and Bungee, there are a number of tutorials on how to properly set up the platform.

After configuring the proxy, make sure to [secure](security/proxy.md) it properly!

### Velocity {#velocity-setup}
How to properly set up Velocity is well described in the [Velocity documentation](https://docs.papermc.io/velocity/getting-started).

**Warning!** Read all the sections in the "*Getting Started*" chapter, not just the first one!

If you have trouble setting it up, you can ask for help on the [PaperMC Discord](https://discord.gg/PaperMC).

### BungeeCord {#bungeecord-setup}
Keep in mind that BungeeCord is an outdated platform that is not recommended to use! Consider using Velocity.

Both the BungeeCord server and the [backend servers](~backend-server) need to be set up correctly. BungeeCord config is located in the `config.yml` file.

The servers (proxy and backend servers) always needs to be restarted for configuration changes to take effect.

You can read what specific settings mean in the [Bungee documentation](https://www.spigotmc.org/wiki/bungeecord-configuration-guide/)].

- `servers`

In the `servers` section you need to add all the servers you want to connect to the Bungee network. In the basic `servers` section, the setup looks like this:

```yaml
servers:
  lobby:
    motd: '&1Just another BungeeCord - Forced Host'
    address: localhost:25565
    restricted: false
```

If you had 3 servers for the example (3 [backend servers](~backend-server), with Bungee 4), the properly configured `servers` section would look like this:

```yaml
servers:
  lobby:
    motd: '&1Just another BungeeCord - Forced Host'
    address: node.myhost.com:47290
    restricted: false
  survival:
    motd: '&1Just another BungeeCord - Forced Host'
    address: node.myhost.com:57270
    restricted: false
  skyblock:
    motd: '&1Just another BungeeCord - Forced Host'
    address: node.myhost.com:67210
    restricted: false
```

This list of these servers does not include the BungeeCord server itself! It only includes the [backend servers](~backend-server) you want to proxy (see [here](#how-proxy-works))!

The `lobby` server with address `localhost:25565` in the default configuration is just an example. If you don't have a [backend server](~backend-server) with that address, you logically can't use it, so delete it from the configuration or change its address!

In the `listeners` section, set the following:

- `host` and `query_port`

set the value to the available [port](general/address-ports.md#ports) of the server through which players will connect. If you can, use port *25565*.

- `force_default_server`

Set the value to `true`, i.e. `force_default_server: true`. This will cause the player to always connect to the first server in `priorities` instead of the server the player was last on.

- `priorities`

In `priorities`, put the name of the server (from the `servers` section) that the player will automatically connect to when connecting to the proxy server. The value of `priorities` is an array (list/list), not a string (text), so the notation must be as follows!

```yml
priorities: [lobby]
```

or

```yml
priorities:
- lobby
```

The following entry is incorrect, see [here](general/configs.md#list-string-type-mismatch).

```yml
priorities: lobby
```

- `forced_hosts`

set the value to `{}`, i.e. `forced_hosts: {}`

- `groups`

set the value to `{}`, i.e. `groups: {}`

- `ip_forward`

set the value to `true`, i.e. `ip_forward: {}`

On all [backend servers](~backend-server) connected to the proxy, the following must be done:

- in `server.properties` set `online-mode` to `false`

- in `spigot.yml` set `bungeecord` to `true`

Don't forget to restart the servers to apply changes!

#### Reset BungeeCord config {#config-reset}
If your BungeeCord config automatically resets, you can read more about this issue [here](problem-solving/common-issues.md#bungeecord-config-reset).

## Security {#security}
It is very important to secure the proxy network! Read more [here](security/proxy.md#proxy-security).