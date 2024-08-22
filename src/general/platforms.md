# Server platforms {#server-platform}
## Which platform to use? {#what-platform}
Specific platforms are discussed in more detail below. This section provides a simplified description of the platform you are most likely to need.

### I want a pure Vanilla server {#what-vanilla}
In the case where you want a server with a pure Vanilla experience, the most reasonable choice is [Fabric](#fabric-forge) with the mode [Lithium](https://modrinth.com/mod/lithium) (optimization mode, which doesn't affect Vanilla drives).

### I want plugins on the server {#what-plugins}
In this case you want Paper, Pufferfish, or Purpur. You can find the differences [here](#spigot-forks). Paper, however, is almost certainly all you need. You won't make a mistake whichever of these three platforms you choose. Plus, you can freely switch between platforms later.

Don't use Spigot (and certainly not CraftBukkit) (the plugins are compatible).

### I want mods on the server {#what-modded}
For modded platforms, it depends on what platform the mods you want to use are written. However, if you have a choice, you should prefer Fabric over Forge as it provides better user (and developer) experience and optimization options.

### I want a proxy platform {#what-proxy}
Nowadays you should use [Velocity](https://papermc.io/software/velocity).

### I want plugins and mods on the server {#what-plugins-and-mods}
In this case, it's best to don't use plugins. Read more [here](#hybrids).

## Standard platforms {#standard-platforms}
### Vanilla {#vanilla}
Vanilla is the official and only platform released by Mojang. This platform is generally *not recommended* for use. The only community modifications that Vanilla supports are [datapacks](../vanilla/datapacks.md#datapacks). Plugins or mods cannot be run on Vanilla. Vanilla is also not recommended even if the user does not want to use any plugins or mods, mainly due to poor optimization. If you want to use the Vanilla platform, use the Fabric platform with [Lithium](https://modrinth.com/mod/lithium) mod instead. This mod optimizes the server without impacting the Vanilla mechanics. The players doesn't need to have any mod installed on the client. They will connect just as if the server was running Vanilla.

## Platforms that support plugins {#plugin-platforms}
### Spigot {#spigot}
Spigot is a platform that allows running plugins (specifically Bukkit plugins, which is generally what people by the term "plugins" means).

However, Spigot is not recommended, unlike the [Paper](#paper) platform, which is better in all aspects, while preserving full compatibility with Spigot plugins.

### CraftBukkit {#craftbukkit}
The base platform supporting Bukkit plugins is CraftBukkit, however not everyone knows this, so in this book, Spigot is used as the "base" platform supporting plugins, although the functionality can be implemented by CraftBukkit itself. For example, the correct title could be "CraftBukkit and its forks" instead of "Spigot and its forks". However, this should not be essential. So if you use CraftBukkit *(which you definitely shouldn't)*, this applies to you as well.

#### CraftBukkit vs Bukkit {#craftbukkit-vs-bukkit}
Sometimes people confuse the terms CraftBukkit and Bukkit. Bukkit is a developer API (which allows you to write plugins). CraftBukkit is the platform, the server itself, which implements this API and allows plugins using this API to run.

### Paper {#paper}
[Paper](https://papermc.io/downloads) is a [fork](#forks) of Spigot (so Spigot plugins are fully compatible) that focuses primarily on server performance, optimizations, bug fixes.

In the case that a bug or exploit is discovered (which may be more common than you think), Paper will likely be the first one to fix.
The optimizations significantly improve the server performance.

Nowadays most servers with plugin support runs Paper ([see here](https://bstats.org/global/bukkit#serverSoftware))

### Pufferfish {#pufferfish}
[Pufferfish](https://pufferfish.host/downloads) is a [fork](#forks) of Paper that mainly adds more optimizations. This is especially useful for large servers trying to keep as many players as possible, or when server performance is not sufficient. However, it's not panacea in this regard. [There are many factors that have much more significant impact on the server performance](../general/performance.md), but Pufferfish can somehow help a little bit.

### Purpur {#purpur}
[Purpur](https://purpurmc.org/) is a [fork](#forks) of Pufferfish that adds a large number of options for configuring many aspects of the game and new features.

This includes the `ping` command, mob riding, AFK system, TPS bar, silk touch spawners [and much more](https://purpurmc.org/docs/purpur/).

Purpur performance is same as Pufferfish, the configuration possibilites does not impact performance in a bad way.

### Which Spigot fork to use? {#spigot-forks}
Definitely do not use Spigot or CraftBukkit.

With Paper, Pufferfish, or Purpur, you won't make an mistake by choosing either of them.

If you have no reason to use Pufferfish or Purpur, Paper is the best choice.

The biggest disadvantage of using Pufferfish or Purpur is that these platforms are not supported in Paper-specific communities (e.g. Paper Discord/forum), so you people may not help you just because you are not using Paper.

Another factor is the speed at which new updates are released. Since Purpur is a fork of Pufferfish, which is a fork of Paper, Paper comes out first, then Pufferfish, and finally Purpur, although the update duration between Pufferfish and Paper and Purpur and Pufferfish is not usually big.

## Platforms that support mods (modloaders) {#modloaders}
### Forge, Fabric and their forks {#fabric-forge}
For modded platforms, two platforms are used in particular - Forge and Fabric. The mods on these platforms are not compatible with each other, they are two completely different platforms.

So which one to use depends on which platform the mods you want to use are written for. However, if you have a choice, you should prefer Fabric over Forge as it provides a better user (and developer) experience and optimization options.

There are also forks of these platforms, such as
[Quilt](https://quiltmc.org/en/about/faq/) (a fork of Fabric) or
[NeoForge](https://neoforged.net/news/theproject/) (a fork of Forge)
but there's probably no reason for you to use them.

### SpongeForge {#spongeforge}
SpongeForge is not really a platform like the others listed, but it is approached as such, even though it is only a Forge mod.

SpongeForge is the only "platform" that allows Forge mods and plugins at the same time stably. However, SpongeForge [unfortunately](#hybrids) supports [only some version of Minecraft (Forge)](https://spongepowered.org/downloads/spongeforge).

However, SpongeForge does not allow running [Bukkit plugins](../plugins/basics.md#bukkit-plugins) (= "classic" plugins). The plugins have to support directly Sponge. Fortunately, many well-known plugins are supported by Sponge. These include LuckPerms, TAB, SkinsRestorer, LibertyBans and many others. For those that do not support Sponge, you can often find an alternative (e.g. [Nucleus](https://ore.spongepowered.org/Nucleus/Nucleus) instead of EssentialsX).

#### Installing SpongeForge and Sponge plugins {#spongeforge-plugins-installation}
SpongeForge is a Forge mod you can [install like any other mod](../mods.md#installation), so by uploading it to the `/mods/` folder and then restarting the server. On startup a `/plugins/` folder is created which you can treat like on a regular Spigot server, i.e. the plugin is installed by uploading the plugin (`.jar` file) to the `/plugins/` folder and a restart. The plugin configuration files are located in the `/plugins/` folder.

## Hybrid platforms {#hybrids}
A hybrid platform is a platform that supports both mods and plugins at the same time.

### Forge {#hybrid-forge}
From version 1.8 to 1.16.5 and for some later versions, [SpongeForge](#spongeforge) can be used for Forge, which is the only stable and recommended platform for running mods and plugins together.

For newer versions, there are platforms like Mohist, Magma and Arclight, which probably has the best reputation of the mentioned options. However, these platforms are *really not recommended* to use, as everything may not work as it should, are unstable, and can cause many problems. If you can't use SpongeForge, the best solution is to avoid hybrid platforms and use a mod alternative instead of a plugin, which often exists (e.g. [FTB Essentials](https://www.curseforge.com/minecraft/mc-mods/ftb-essentials-forge) instead of EssentialsX or [FTB Chunks](https://www.curseforge.com/minecraft/mc-mods/ftb-chunks-forge)/Cadmus instead of Residence/Lands/GriefPrevention), and if no such option exists, do without the plugin.

If you have problems with plugins on a hybrid server, that's your problem, don't expect help from plugin developers etc.

For very old versions (1.7.10) there is e.g. KCauldron, Thermos or its maintained fork Crucible. The stability of hybrid platforms on such old versions may be better, but you may still encounter problems.

If you want to learn more why not to use hybrid servers, you can read the following articles:
<https://madelinemiller.dev/blog/minecraft-hybrid-servers/>
<https://madelinemiller.dev/blog/where-is-forge-worldguard/>

EssentialsX also wrote an article on why not to use Mohist:
<https://essentialsx.net/do-not-use-mohist.html>

### Fabric {#hybrid-fabric}
There is no usable hybrid platform for Fabric. There are some mods, such as Banner or CardBoard, that attempt to provide plugin functionality on Fabric, but sthey shouldn't be used (you can read why here: <https://gist.github.com/Patbox/e44844294c358b614d347d369b0fc3bf>).

Instead, using alternatives in the form of server-side mods is ideal. A large list of these can be found here: <https://serverside.infra.link/>

If you need help finding an alternative, you can ask in the following server-side communities:

- Fabric Server Side Development: <https://discord.gg/atSzZ6zMHz>
- Patbox's Discord: <https://discord.gg/AbqPPppgrd>
- Fabric/Quilt Server Tools: <https://discord.gg/p56NJ6kp4u>

Or modded communities in general:

- The Fabric Project: <https://discord.gg/v6v4pMv>
- The Quilt Community: <https://discord.quiltmc.org/>

## Proxy Platforms {#proxy-platforms}
You can read what a proxy is [here](../proxy.md#proxy).

Velocity and BungeeCord (Waterfall) plugins are not compatible with each other.

### Velocity {#velocity}
[Velocity](https://papermc.io/software/velocity) is a modern proxy platform developed by PaperMC. Nowadays, Velocity is considered the standard that should be used. It has overtaken BungeeCord/Waterfall in number of users some time ago, making it the most used platform.

### BungeeCord and Waterfall {#bungeecord}
BungeeCord (and its fork Waterfall, which provides some improvements) has been the most used proxy platform for years, but its popularity is declining as Velocity is generally better.

Waterfall isn't even actively developed anymore, see
<https://forums.papermc.io/threads/announcing-the-end-of-life-of-waterfall.1088/.>

Thus, nowadays BungeeCord/Waterfall is being phased out and replaced by the more modern Velocity, which is recommended instead of BungeeCord/Waterfall.

## Other platforms {#other-platforms}
### Folia {#folia}
Folia differs significantly from all other platforms, as it operates differently than the classic platforms. This platform is suitable for really large servers with a large number of players spread over a large area, such as the 2b2t.org server.

Folia removes a limiting feature of classic Minecraft servers, where the main game loop uses only one thread. This makes Folia suitable for a completely different processor model than classic servers.

For most servers, Folia doesn't make sense, so you don't have to bother with it at all. If you're not sure if Folia makes sense for you, it almost certainly doesn't.

You can read more about this Folia here: <https://paper-chan.moe/folia/>

### Non-Notchian platforms {#no-notchian-platforms}
The above mentioned platforms like Vanilla, Paper and Fabric are so-called Notchian servers. This means that they are based on the original Minecraft code (Vanilla, which is itself a Notchian server). However, there are also implementations of Minecraft servers that do not contain any code from Mojang. Such platforms don't even need to be written in the Java programming language. Examples include [Minestom](https://minestom.net/) or [Valence](https://valence.rs/). More can be found at the following link: <https://wiki.vg/Server_List>

However, none of these projects can replace standard platforms, as these platforms do not implement many of Vanilla's mechanics and features. Rather, they are "building blocks" from which such a server can be programmed, but would be extremely difficult to develop and maintain. Thus, they are currently more like "toys", but they may have some usecases.

There are also proxies in various languages, such as [Hopper](https://github.com/BRA1L0R/hopper-rs) and [Gate](https://github.com/minekube/gate), with the biggest problem being the lack of community modifications. It doesn't make sense to develop such proxy platforms, so Velocity remains the most sensible choice.

By the way, there are even Minecraft clients written in other languages, such as [stevenerella](https://github.com/iceiix/stevenarella).


## What is a fork {#forks}
In the software world, a fork is software that inherits and modifies other software. In general, a fork keeps up-to-date with the project it inherits.

The term "fork" is most commonly encountered with platforms that support plugins. In the image below, you can see the most well-known forks and their purpose.

![Simplified Fork Graph](/assets/images/platforms/fork_graph_simplified.png) (source: PurpurMC Discord - `.forks` command).

That implies the following - when you use Paper, the server will work the same way it does on Spigot (i.e. Spigot plugins will work), with added features from Paper (in Paper's case, bug fixes, optimizations, etc.). Pufferfish will have the same features as Paper with some extra features (in the case of Pufferfish, mainly extra optimizations). When the server is running on the Purpur platform, you can still use the features and settings of Spigot, Paper, and Pufferfish, with some extra features (in the case of Purpur, that is the ability to configure many aspects of the game, see <https://purpurmc.org/docs/purpur/configuration/>).

When a new version of Minecraft releases, Purpur will be the last of these platforms (from the Spigot, Paper, Pufferfish & Purpur chain) to be released. Since these are forks, Paper has to come out first, then Pufferfish, and finally Purpur.

Forks also exist for other platforms, like Forge. Examples include [NeoForge](https://neoforged.net/news/theproject/) (a Forge fork), or [QuiltMC](https://quiltmc.org/en/about/faq/) ([hard fork](https://madelinemiller.dev/blog/paper-hard-fork/#what-is-a-hard-fork) of Fabric).

As you can see in the image below, there are many forks of various platforms.
![Fork Graph](/assets/images/platforms/fork_graph.png)
(source: <https://raw.githubusercontent.com/saboooor/fork-graph/main/img.png>)

However, a lot of them are not stable. That's why you should only use "battle tested" forks (which e.g. in the case of platforms supporting plugins is Paper, Pufferfish, or Purpur).

Technical note: The primary platform supporting Bukkit plugins is CraftBukkit, however not everyone knows this, so Spigot is used as the "base", even though the actual features may be implemented by CraftBukkit. The correct name could be "CraftBukkit and its forks" instead of "Spigot and its forks". However, this should not be important. So if you use CraftBukkit *(which you definitely shouldn't)*, this applies to you unless noted otherwise.

## Platform change {#platform-change}
Changing platforms is usually a simple process. The platform is coded in the server itself, i.e. the [server JAR](server-jar.md).

Therefore, in the vast majority of cases, you just download the server file of the new platform and replace the original one.

It is important to have a [server backup](../administration/backups md#backups) in case something would go wrong or you want to revert the action.

If you are migrating from the Spigot fork to the Vanilla/modded platform, it is necessary to [migrate worlds](world.md#world-migration).

## Paid forks {#paid-forks}
When it comes to paid forks, the vast majority of their authors are just cashing in on ignorance and marketing that raises high expectations, but the reality is different and the purchase is unnecessary.

However, some of them can make sense, for example in certain situations on very old versions (1.8.8) or on modern versions there is a Pufferfish+ fork, which I don't have personal experience with, but I think that unlike forks found for example on BuiltByBit, it doesn't have to be an outright waste of money in some cases.

As for paid proxy forks, unless they have a feature you really need, using them is almost certainly pointless. If you want a modern, efficient and secure proxy, use Velocity.