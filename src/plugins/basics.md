# Plugins {#bukkit-plugins}
The following part contains information about Bukkit plugins.

## Basics {#plugin-basic-info}
When the plugin is first started, the folder with plugin name is (usually, not always) created within the `/plugins/` directory. This folder contains configuration and data files (such as database) of the plugin.

The plugin itself is a `.jar` file, not the folder. The folder contains configuration and data files only, not the plugin itself!

When the plugin is intended for Bukkit or Spigot, the plugin is compatible with Spigot and its forks (Paper, Pufferfish, Purpur). It's all just Bukkit plugins which all of these platforms support.

If you have problems with the plugin's functionality, to learn how to deal with such issue, [see here](../problem-solving/how-to-deal-with-issues.md).

## /plugins/ folder structure {#plugins-folder-structure}
The `/plugins/` folder contains:
- `.jar` files

These are the plugins themselves.

- folders with the plugin names

These folders contain configuration files and data of the plugins.

## How to install a plugin {#plugin-installation}
You install a plugin by uploading the `.jar` file to the `/plugins/` folder and then (re)starting the server ([not reloading](reload.md#reload)!). The server must be running on a platform that supports plugins. This is Spigot (not recommended) and its forks like Paper, Pufferfish, or Purpur. You can read more about platforms [here](../general/platforms.md#server-platform)).

When downloading plugins, read the basic information on the plugin page - make sure to use the correct version of the plugin and install dependencies too, see [here](#plugin-doesnt-work-basics)!

## Plugin is not working {#plugin-doesnt-work}
After uploading the plugin, the server needs to be restarted for the changes to take effect.

When the plugin doesn't work even after restarting the server, you can learn how deal with such issues [here](../quickstart.md#plugins-doesnt-work).

## How to update plugin / How to change plugin version {#plugin-update}
If you want to update a plugin on Paper or its fork (Pufferfish, Purpur), on new versions just upload the new version of the plugin to the `/plugins/update/` folder (if the folder does not exist, create it manually) and the plugin file will be automatically replaced the next time the server starts.

If the server is running on Spigot or CraftBukkit ([which is not recommended!](../general/platforms.md#spigot-forks)), just [delete the old version of the plugin](#plugin-deletion) and upload a new one, ideally when the server is not running. The changes are applied the next time the server is started (i.e. if the server is running, restart is required to reflect changes).

## Finding plugins {#how-to-find-plugins}
In case you are looking for a plugin, the only tool you need, is [*Google*](https://www.google.com/). Using the plugin installer in the admin panels to search for plugins is not ideal, *Google* will give much more relevant results.

Plugins can be found in many places - SpigotMC, DevBukkit (especially for older plugins that have been around for a really long time), Hangar, Modrinth, some authors post on GitHub, Polymart, BuiltByBit (on some marketplaces like BBB or Polymart you can find also things pre-made plugin configurations or even entire server premade setup, builds, models, etc.)

However, searching for plugins directly on these forums is not ideal. Google will return the most relevant results (if used correctly). (If you're a beginner, it might be useful to go through the list of most downloaded plugins on these forums to get some idea of the basic plugins. Keep in mind, though, that SpigotMC and DevBukkit in particular have been around for a really long time, so there will be old, often unmantained plugins that you don't wanna use. Hangar and Modrinth, on the other hand, are new).

This section only covers the basics of using Google search - Googling is a skill you can get much better than shown here. A few tips on how to use Google can be found in [this section](../problem-solving/how-to-deal-with-issues.md#google-search), but it's much more complex topic. For simple plugin searches, however, this section should be perfectly sufficient. If you don't use an ad-blocker, ignore the first ad results displayed when searching for plugins.

If you're looking for a specific plugin, just Google search *"\<plugin name\> plugin "*, so for example *"WorldEdit plugin "*, or *"WorldGuard plugin "*.

If you're looking for a plugin with a specific feature, you can usually just search for *"\<keyword(s)\> plugin "*, so for example *"ban plugin "*. If the keyword is too generic and the results aren't mainly Minecraft plugin related, just add the "minecraft" keyword, e.g. *"ban minecraft plugin"*.

Of course, not all results are always relevant, so it's important to be able to filter out the non-relevant ones, including outdated plugins (i.e. if you see that a plugin was last updated in 2015, you probably don't want to use that plugin, [see here](#plugin-doesnt-work-basics)).

If you want to filter out a large number of irrelevant results, use your server version in the search, e.g. *"ban plugin 1.20"* (note: in general it is better to use a "general" version in the search instead of a specific "subversion", e.g. use only 1.20 instead of 1.20.6). This will bring up results whose page has been indexed with "1.20". This doesn't automatically mean that the plugin must be updated to 1.20, but in general more current plugins will appear in the results.

Read the plugin page for basic information - when downloading plugins, make sure to use the correct version of the plugin and download  dependencies, [see here](#plugin-doesnt-work-basics)!

## Download files {#different-files}
As written in the introduction - If the plugin is designed for Bukkit/Spigot, the plugin will work on its forks - Paper, Pufferfish,  Purpur. So if the name of the download file contains the word "Bukkit", the file is a plugin.

Conversely, if the file name contains "CLI" (e.g. [here](https://ci.athion.net/job/FastAsyncWorldEdit/)), "sources", or "javadocs" (e.g. [here](https://ci.codemc.io/job/AuthMe/job/AuthMeReloaded/)), it is not a plugin.

The word "legacy" refers to a version of the plugin intended for a deprecated version of Minecraft (which version the "legacy" version is intended for will most likely be stated on the page).

## Dependencies {#plugin-dependencies}
Many plugins need another plugin to work. Such plugin that is required by the another plugin to work is called a dependency. It can be a library that does nothing by itself (such as ProtocolLib or CMILib), or any normal plugin.

If the dependency is not installed, the plugin that needs it will not work.

There term "soft dependency" refers to a plugin that is not necessarily needed for plugin that depends on it to work, but its presence enables certain functionality.

## How to configure a plugin {#plugin-configuration}
If you want to configure the plugin, you can do so either by using the commands found in the [plugin documentation](../general/docs.md) (you must have rights, i.e. [OP](../vanilla/op.md) or set [permissions](../general/permissions.md), to execute some commands), or by editing the configuration files.

If the plugin generates configuration files, they will be created in the `/plugins/<plugin>/` folder when the plugin is first started. To reflect changes in the configuration files, the server must be restarted, or the _reload_ command must be executed if the plugin has such a command. If the plugin has such _reload_ command, you can find it in the documentation of the plugin. For example, for the EssentialsX plugin, the _reload_ command is `essentials reload`, [do not use the `reload` command itself!](reload.md))

You can read more about configuration files [here](../general/configs.md#config).

All things like commands, settings etc. are always plugin specific. So if you don't know how to do certain thing, always look in the [documentation](general/docs.md) of the plugin in question.

## What to watch out for {#plugin-doesnt-work-basics}
It is definitely not a good idea to install plugins mindlessly using the plugin installer in the web panel.

When you search for a plugin, open its page and read the basic information to see if you can use the plugin at all (if you don't understand something, use [translator](../problem-solving/how-to-deal-with-issues.md#translator)).

Pay particular attention to:

1. The correct version of the plugin

Always check if the plugin you want to use is compatible with your server version, see [here](../general/versions.md#plugin-versions).

2. Check that the plugin does not require dependencies

If the plugin needs another plugin to work (which is quite common), this will be stated on the plugin page.

3. All other important info

(highlighted) information, such as the minimum required version of Java

Note - on the *DevBukkit* platform, the *Download Latest File* button downloads the latest stable version, so it may not automatically be the very latest version listed. For this reason, it is better to use the *Download (File)* button directly next to the plugin version.

If you're using a version of Minecraft that is new and the plugins don't support it yet, you can check to see if a [dev (experimental) build](#dev-and-experimental-builds) is already available. If it isn't, there's nothing you can do about it and you'll have to wait for the update.

Also check that the plugin does what you expect. Just because a plugin has WorldEdit in its name (e.g. WorldEditCUI) does not automatically mean that the plugin is WorldEdit.

## How to remove a plugin {#plugin-deletion}
To remove a plugin, delete the plugin in the `/plugins/` folder. If the server is running, you will need to restart the server for the changes to take effect.

### Plugin cannot be deleted {#plugin-cannot-be-deleted}
The server needs to be restarted (not reloaded!) to apply changes after deleting the plugin from the files.

If the plugin cannot be deleted, make sure you delete the `.jar` file and not the plugin folder. The plugin folder contains the configuration files and plugin data, it's not the plugin itself. If you no longer need the data of the plugin to be deleted, delete the plugin folder as well.

On Purpur, Spark plugin is built-in and enabled by default and can be disabled by setting [flag](../administration/java.md#java-flags) `-DPurpur.IReallyDontWantSpark` to `true` (its presence doesn't matter though, performance is not affected).

## How to disable a plugin {#plugin-disable}
In order for the plugin to attempt to enable, two conditions must be met

1. The plugin must be located in the `/plugins/` folder
2. The plugin must have a `.jar` extension

If you want to "disable" the plugin, just move it out of the `/plugins/` folder, or change the extension to `jar-disabled` or `jarr` for example. After restarting the server, the plugin will not be enabled. The moment you move the plugin file back to the `/plugins/` folder or change the extension back to `jar`, the plugin will enable on the server startup.

If you want to disable all plugins on the server, simply rename the `/plugins/` folder to `/plugins-disabled/` for example and all plugins will be disabled when the server restarts. After renaming the folder back to `/plugins/`, all plugins will be enabled after the restart and everything will be in its original state.

## Plugin configuration {#plugin-configuration}
The plugin is configured either using [commands](../general/commands.md#commands), which can be found in the [documentation](../general/docs.md#docs) of the plugin, or using [configuration files](../general/configs.md#config), for which additional info can also be found in the [plugin documentation](../general/docs.md#docs).

## Everything is plugin-specific {#everything-is-plugin-specific}
Although different plugins often have many things in common, it is important to note that every function, command, and permission is plugin-specific.

Therefore, questions like "how to do x", "what is the command for x", "what is the permission for x" are insufficient without more information about what plugin it is, as it always depends on the specific plugin. Everything you need to know can almost always be found in the plugin's [documentation](../general/docs.md#docs).

## Plugin Reload {#plugin-reload}
Do not use the *reload* command or plugins such as PlugManX to reload other plugins. Learn more [here](reload.md#reload).

## Cracked plugins {#cracked-plugins}
Do not use cracked plugins, see [here](cracked.md#cracked-plugins).

## Paid plugins {#premium-plugins}
Some plugins are not free and can only be used after purchasing them. Some people believe that paid plugins are automatically better. That is not true. Maddy Miller has written a nice article about this on her blog: <https://madelinemiller.dev/blog/premium-free-minecraft-plugins/>

As she [summarizes](https://madelinemiller.dev/blog/premium-free-minecraft-plugins/#the-verdict) in her article: "Overall, paid plugins are not necessarily better than free ones. In fact, the free ones have several advantages. The best plugin for you is almost always the one that does what you want. You shouldn't use a paid plugin just because it's paid, but if only a premium plugin does what you need, it's probably the plugin for you."

## Common Issues {#plugins-common-issues}
### Bad plugin version {#bad-plugin-version2}
When installing a plugin, you must download a version of the plugin that supports the server version.

Therefore, when downloading a plugin, **always** check which version of the server the plugin version is for, don't download plugins mindlessly without reading the basic information on the plugin page, see [here](#plugin-doesnt-work-basics).

**See [here](../general/versions.md#plugin-versions) for information on how to find out if a plugin version is supported by the server version.**

It is not rare that people downloads Citizens on Bukkit (last update in 2014), Residence Reloaded on Spigot (2015), or Essentials on Bukkit (2015) instead of EssentialsX.

### Missing dependencies (UnknownDependencyException) {#plugins-missing-dependency}
This error can almost always be avoided by reading the basic information on the plugin page, see [here](#plugin-doesnt-work-basics).

In the case where the plugin is missing a dependency (i.e. another plugin need by the plugin to work), you will encounter a similar error:

```log
Could not load 'plugins/worldeditcui.jar' in folder 'plugins'
org.bukkit.plugin.UnknownDependencyException: worldEdit
```

```log
org.bukkit.plugin.UnknownDependencyException: Unknown/missing dependency plugins: [Essentials]. Please download and install these plugins to run 'EssentialsChat'.
	at io.papermc.paper.plugin.entrypoint.strategy.modern.ModernPluginLoadingStrategy.loadProviders(ModernPluginLoadingStrategy.java:82) ~[paper-1.20.4.jar:git-Paper-496]
	at io.papermc.paper.plugin.storage.SimpleProviderStorage.enter(SimpleProviderStorage.java:38) ~[paper-1.20.4.jar:git-Paper-496]
	at io.papermc.paper.plugin.entrypoint.LaunchEntryPointHandler.enter(LaunchEntryPointHandler.java:36) ~[paper-1.20.4.jar:git-Paper-496]
	at org.bukkit.craftbukkit.v1_20_R3.CraftServer.loadPlugins(CraftServer.java:507) ~[paper-1.20.4.jar:git-Paper-496]
	at net.minecraft.server.dedicated.DedicatedServer.initServer(DedicatedServer.java:274) ~[paper-1.20.4.jar:git-Paper-496]
	at net.minecraft.server.MinecraftServer.runServer(MinecraftServer.java:1131) ~[paper-1.20.4.jar:git-Paper-496]
	at net.minecraft.server.MinecraftServer.lambda$spin$0(MinecraftServer.java:319) ~[paper-1.20.4.jar:git-Paper-496]
	at java.lang.Thread.run(Unknown Source) ~[?:?]
```

You can fix the error simply by installing the required plugin.