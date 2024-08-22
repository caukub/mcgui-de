# Versions {#versions}
## Minecraft server version (Which Minecraft version to use?) {#minecraft-version}
### Vanilla/Server with plugins {#minecraft-version-vanilla}
In general, for Vanilla/Spigot and its forks, possibly a lightly modded Fabric (e.g. with only Lithium mod for optimization), the "correct" answer is the latest stable version of the platform you are using.

In the case of a new version of Minecraft comes out, it is understandable that updating some plugins or mods may take some time. However, if the stable version has been out for a few weeks or even months, there is no reason not to stay on the old version. Update the server along with the plugin(s) and mods.

If you are stuck on old version due to specific plugin, get rid of it, don't stay on old version just because you use unmantained plugin.

> [!IMPORTANT]  
> If you use Spigot ([which you probably shouldn't](platforms.md#spigot)), don't update immidiately on new Minecraft update on production servers. These experimental versions usually contain game-breaking bugs.

### Server with mods {#minecraft-version-mods}
For standard modded servers, the situation is different than for Vanilla/plugin servers. If you are using a modpack, you need to use the version that the modpack is made for. These versions are older by the nature of how mods work.

The versions of most mods get "stuck" at a lower subversion, so even though 1.20.6 is already released, mods and modpacks are still mostly updated for 1.20.1 (for 1.19 it was 1.19.2).

### Other {#minecraft-version-other}
As for the old "pvp versions" like 1.7.10 or 1.8.8, they really aren't recommended. No one can stop you from using them, of course, but the absolute minimum of people will be willing to help you. If you ask for help on Discord or the forums, peop will refuse to help you automatically. It's a [really old version](https://howoldisminecraft188.today/) that is not supported by any modern platform. The ecosystem for these versions is built on paid plugins and add-ons that you are forced to use to create a "good" server. Almost no one is actually willing to keep plugins compatible with such an old, declining version, for free. Another factor is worse server security.

Using 1.12.2 for the sake of better performance is pointless, don't do that.

## Platform update {#platform-update}
It is important to update not only the Minecraft version itself, but also the platform version (cannot be applied to Vanilla).

While you may have a platform version for the latest Minecraft version, it is important to update the platform version itself, that means, to use a newer [build](#build). Although the platform version supports the latest Minecraft version, the platform itself usually releases a newer build that may contain optimizations, bug fixes, new features etc. This is especially important for newly released Minecraft versions that contain bugs and poor optimizations.

A specific example would be a case where a plugin was not displaying PAPI placeholders correctly. After updating from Paper build _#446_ version 1.19.3 to build _#448_, this problem disappeared, as build _#448_ fixed the loading of legacy plugins, which the plugin that was displaying placeholders was, but is important mainly due to bug and exploit fixes and optimization patches.

## Plugin versions {#plugin-versions}
When downloading a plugin, you need to make sure you are downloading a version of the plugin that is compatible with the server version. Do not blindly download the "latest version". Always check for compatibility.

You can find out which version of the plugin is for which server on the page where you download the plugin (e.g. on *DevBukkit* in the *File* tab, on *Modrinth* and *Hangar* in the *Versions* tab, and on *SpigotMC* the supported versions are listed). The author should always indicate somewhere which version of Minecraft the (at least current) version of the plugin is for.

Some plugins not listing support for a newer version may work on newer versions (especially APIs not interacting directly with the server itself, such as Vault), while others may not (especially plugins working with [NMS](https://docs.papermc.io/paper/dev/internals#what-is-nms)). However, if the plugin was last updated in 2015, you logically don't want to use it. However, a plugin designed for a newer version will almost certainly not run on an older version.

If a version of the doesn't support newly released version of Minecraft, check if the plugin doesn't provide [dev builds](#dev-and-experimental-builds).

If you're using an older version of Minecraft (which you shouldn't), you need an older version of the plugin, and the version of the plugin you need isn't directly listed anywhere (which shouldn't happen on *DevBukkit*, *Modrinth*, or *Hangar*, since each plugin version lists which server version it's for), you need to find down the version you need using the [changelog](../problem-solving/how-to-deal-with-issues.md#changelog).

Beware - on the *DevBukkit* platform, the *Download Latest File* button will download the latest stable version, so it may not automatically be the very latest version listed. For this reason, it is better to use the *Download (File)* button directly next to the plugin version.

## Mod versions {#mod-versions}
For mods, the same applies as for plugins, i.e. you need to download a version of the mod that is compatible with the server version. Do not blindly download the "latest version". Always check compatibility.

Unlike plugins, however, mods that do not specify support for a newer version will almost certainly not work on a newer version, and due to how mods work, you almost always need to download a mod specific to the server version.

## What is a build {#build}
Build refers to a specific version of software, i.e. platform, plugin, or mod.

Even if a platform comes out for a specific Minecraft version (for example, 1.21), the platform itself does not have only one build (except for Vanilla), as platforms fix bugs, add new features, and improve performance over time. For this reason, it's a good idea to keep the platform itself up to date (= use a newer build), even if you're using the latest released version of Minecraft. For example, Spigot build #4200 fixed a bug where players would not drop items on death. So if you use Spigot 1.21 build _#4199_, players won't drop their items when they die, but if you update to Spigot 1.21 build _#4200_ or later, they will. While this is still Minecraft version 1.21, the version of the software itself (in this case Spigot) is different.

### Experimental builds / Dev builds {#dev-and-experimental-builds}
What is a build is explained above.

Dev builds refer to versions of plugins or mods that are not released as official (stable) versions, most often because they *may* contain bugs. The term "experimental build" is mainly used for platforms when a new version of Minecraft is released, but you may also encounter this term in plugins.

The distinction between dev and experimental builds is not clearly defined, but in general dev builds refer to builds that contain continuous updates to the software in question, where there is no serious risk (theoretically there can be, but in practice is not), as opposed to experimental builds, which are radical changes where critical bugs are not the exception. For this reason, it is not advisable to use experimental builds on a production server, and it is important to have a backup if you use one with data that matters to you.

Dev builds are most commonly encountered with plugins when a new Minecraft version is released, where if you want to upgrade to a new version before the official (stable) versions of the plugin supporting the new Minecraft version are released, you will need to use the dev builds of the plugin (or platform, but this is mainly for testing. Experimental platform builds are not suitable for production, and should only be switched to the new version of Minecraft when a stable version of the platform for the new version is published. You probably don't want to switch at the time of experimental builds, especially since at this time not all plugins you use have a version supporting new Minecraft version released).

If a platform, plugin, or mod has experimental builds, you can probably find a link to them on the platform/plugin/mod page.

## How to change version {#how-to-change-version}
### How to change server version {#how-to-server-version}
You can change the server version simply by replacing [server JAR](#server-jar) of the old version with the new one.

#### Downgrade {#downgrade}
Warning! You **cannot** [downgrade](downgrade.md#downgrade) the server without losing data (switch from a higher Minecraft version to a lower one).

#### World migration {#world-migration}
If you are migrating from Spigot or its fork (Paper, Pufferfish, Purpur) to Vanilla, you need to [world-migrate](world.md#world-migration) for the Vanilla format.

### How to change plugin version {#how-to-change-plugin-version}
How to change the plugin version is described [here](../plugins/basics.md#plugin-update).

### How to change mod version {#how-to-change-mod-version}
How to change mod version is described [here](../mods.md#mod-update).

## Notes {#notes}
There is no server version 1.8.9 for non-modded platforms, as version 1.8.9 only makes changes for the client, see <https://minecraft.fandom.com/wiki/Java_Edition_1.8.9>

Spigot (hence Paper and its forks) 1.20.3 does not exist, as only 2 days after 1.20.3 was released, version 1.20.4 was released, which only fixes [one bug](https://bugs.mojang.com/browse/MC-267185).