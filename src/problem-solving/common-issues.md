# Most common errors / issues / questions {#common-issues}
## Not reading the basic information on the plugin page (or mod page) {#modification-download}
As described in [this section](../plugins/basics.md#plugin-doesnt-work-basics), always read the basic information about the plugin on the plugin page. Never just mindlessly download a plugin, especially via the plugin installer in the [admin panel](../other/panels.md). Pay particular attention to:

1. the correct version of the plugin

Always check that the plugin you want to use is compatible with the version of your server, see [here](../general/versions.md#plugin-versions).

2. Check that the plugin does not require dependencies

If the plugin needs another plugin to work (which is quite common), this will be stated on the plugin page.

3. All other important info

(highlighted) information, such as the minimum required version of Java

## Bad plugin version/bad mod version {#bad-plugin-version}
Read more about this issue on the plugin server [here](#bad-plugin-version) and on the mod server [here](../mods.md#bad-mod-version).

## Missing dependencies {#missing-dependency}
In the case where a plugin is missing a dependency, the plugin will not enable (exceptionally, the whole server may crash (shut down)). In the case of a missing mod dependency, the server will almost certainly crash.

You can read more about this problem on the plugin server [here](../mods.md#mods-missing-dependency) and on the modded server [here](../mods.md#mods-missing-dependency).

## Invalid file format {#invalid-format}
If you encounter an error like this, it means that the file format (`spigot.yml` in the first example) is not valid. You can read more about the validity of file formats [here](../general/configs.md#config).

```log
[19:19:37] [ServerMain/ERROR]: Failed to start the minecraft server
java.lang.Exception: Failed to load configuration file: spigot.yml
	at io.papermc.paper.configuration.PaperConfigurations.loadLegacyConfigFile(PaperConfigurations.java:419) ~[purpur-1.19.4.jar:git-Purpur-1985]
	at net.minecraft.server.Main.main(Main.java:138) ~[purpur-1.19.4.jar:git-Purpur-1985]
	at org.bukkit.craftbukkit.Main.main(Main.java:330) ~[purpur-1.19.4.jar:git-Purpur-1985]
	at io.papermc.paperclip.Paperclip.lambda$main$0(Paperclip.java:42) ~[app:?]
	at java.lang.Thread.run(Unknown Source) ~[?:?]
Caused by: org.bukkit.configuration.InvalidConfigurationException: while parsing a block mapping
 in 'reader', line 13, column 1:
    messages:
    ^
expected <block end>, but found '<block mapping start>'
 in 'reader', line 15, column 3:
      unknown-command: Unknown command ...
      ^

	at org.bukkit.configuration.file.YamlConfiguration.loadFromString(YamlConfiguration.java:111) ~[purpur-api-1.19.4-R0.1-SNAPSHOT.jar:?]
	at org.bukkit.configuration.file.FileConfiguration.load(FileConfiguration.java:160) ~[purpur-api-1.19.4-R0.1-SNAPSHOT.jar:?]
	at org.bukkit.configuration.file.FileConfiguration.load(FileConfiguration.java:128) ~[purpur-api-1.19.4-R0.1-SNAPSHOT.jar:?]
	at io.papermc.paper.configuration.PaperConfigurations.loadLegacyConfigFile(PaperConfigurations.java:417) ~[purpur-1.19.4.jar:git-Purpur-1985]
	... 4 more
Caused by: org.yaml.snakeyaml.parser.ParserException: while parsing a block mapping
 in 'reader', line 13, column 1:
    messages:
    ^
expected <block end>, but found '<block mapping start>'
 in 'reader', line 15, column 3:
      unknown-command: Unknown command ...
      ^

	at org.yaml.snakeyaml.parser.ParserImpl$ParseBlockMappingKey.produce(ParserImpl.java:679) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.parser.ParserImpl.peekEvent(ParserImpl.java:185) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.comments.CommentEventsCollector$1.peek(CommentEventsCollector.java:57) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.comments.CommentEventsCollector$1.peek(CommentEventsCollector.java:43) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.comments.CommentEventsCollector.collectEvents(CommentEventsCollector.java:136) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.comments.CommentEventsCollector.collectEvents(CommentEventsCollector.java:116) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.composer.Composer.composeMappingNode(Composer.java:318) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.composer.Composer.composeNode(Composer.java:212) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.composer.Composer.composeValueNode(Composer.java:357) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.composer.Composer.composeMappingChildren(Composer.java:336) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.composer.Composer.composeMappingNode(Composer.java:311) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.composer.Composer.composeNode(Composer.java:212) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.composer.Composer.getNode(Composer.java:134) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.composer.Composer.getSingleNode(Composer.java:160) ~[snakeyaml-1.33.jar:?]
	at org.yaml.snakeyaml.Yaml.compose(Yaml.java:559) ~[snakeyaml-1.33.jar:?]
	at org.bukkit.configuration.file.YamlConfiguration.loadFromString(YamlConfiguration.java:104) ~[purpur-api-1.19.4-R0.1-SNAPSHOT.jar:?]
	at org.bukkit.configuration.file.FileConfiguration.load(FileConfiguration.java:160) ~[purpur-api-1.19.4-R0.1-SNAPSHOT.jar:?]
	at org.bukkit.configuration.file.FileConfiguration.load(FileConfiguration.java:128) ~[purpur-api-1.19.4-R0.1-SNAPSHOT.jar:?]
	at io.papermc.paper.configuration.PaperConfigurations.loadLegacyConfigFile(PaperConfigurations.java:417) ~[purpur-1.19.4.jar:git-Purpur-1985]
	... 4 more
```
Or like this for JSON.
```log
[19:25:51] [Server thread/WARN]: Unable to read file whitelist.json
com.google.gson.JsonSyntaxException: expected a com.google.gson.JsonArray but was com.google.gson.JsonPrimitive; at path $
	at com.google.gson.internal.bind.TypeAdapters$34$1.read(TypeAdapters.java:1010) ~[gson-2.10.1.jar:?]
	at com.google.gson.Gson.fromJson(Gson.java:1227) ~[gson-2.10.1.jar:?]
	at com.google.gson.Gson.fromJson(Gson.java:1137) ~[gson-2.10.1.jar:?]
	at com.google.gson.Gson.fromJson(Gson.java:1075) ~[gson-2.10.1.jar:?]
	at net.minecraft.server.players.StoredUserList.load(StoredUserList.java:147) ~[?:?]
	at net.minecraft.server.dedicated.DedicatedPlayerList.loadWhiteList(DedicatedPlayerList.java:111) ~[paper-1.20.4.jar:git-Paper-496]
	at net.minecraft.server.dedicated.DedicatedPlayerList.loadAndSaveFiles(DedicatedPlayerList.java:31) ~[paper-1.20.4.jar:git-Paper-496]
	at net.minecraft.server.dedicated.DedicatedServer.initServer(DedicatedServer.java:216) ~[paper-1.20.4.jar:git-Paper-496]
	at net.minecraft.server.MinecraftServer.runServer(MinecraftServer.java:1131) ~[paper-1.20.4.jar:git-Paper-496]
	at net.minecraft.server.MinecraftServer.lambda$spin$0(MinecraftServer.java:319) ~[paper-1.20.4.jar:git-Paper-496]
	at java.lang.Thread.run(Unknown Source) ~[?:?]
```

## NoClassDefFoundError {#noclassdeffound}
As (very simply and factually incorrect) explained in [this part](java-basics.md#java-class), you can think of a class as a single file in the source code (of a plugin, usually).

An error with `NoClassDefFoundError` indicates that some program (in the example below, the *RPGLives* plugin) is trying to work with this file, but the file does not exist. This can mean several things.

Most often it is one of these two problems (it's not necessarily plugins, but typically it is):

1. the plugin is programmed for a different version of the plugin (most common)

In this case, check the plugin page/documentation for the specific version of the dependency that is expected.

If no specific version is listed, most often an older version of the dependency is used, thus you just need to update it. However, you may also encounter the opposite case (i.e. you are using a too recent version of the dependency, but that shouldn't normally happen).

2. the plugin tries to work with the plugin, but the plugin is not on the server

While you may encounter this, it is not common as the plugin developer should have "handled" this better.

```log
[23:12:26] [Server thread/ERROR]: Error occurred while enabling RPGLives v3.0.0 (Is it up to date?)
java.lang.NoClassDefFoundError: net/milkbowl/vault/economy/Economy
	at net.minequests.gloriousmeme.rpglives.RPGLives.setupEconomy(RPGLives.java:102) ~[RPGLives-3.0.0.jar:?]
	at net.minequests.gloriousmeme.rpglives.RPGLives.onEnable(RPGLives.java:54) ~[RPGLives-3.0.0.jar:?]
	at org.bukkit.plugin.java.JavaPlugin.setEnabled(JavaPlugin.java:281) ~[purpur-api-1.20.1-R0.1-SNAPSHOT.jar:?]
	at io.papermc.paper.plugin.manager.PaperPluginInstanceManager.enablePlugin(PaperPluginInstanceManager.java:189) ~[purpur-1.20.1.jar:git-Purpur-2062]
	at io.papermc.paper.plugin.manager.PaperPluginManagerImpl.enablePlugin(PaperPluginManagerImpl.java:104) ~[purpur-1.20.1.jar:git-Purpur-2062]
	at org.bukkit.plugin.SimplePluginManager.enablePlugin(SimplePluginManager.java:507) ~[purpur-api-1.20.1-R0.1-SNAPSHOT.jar:?]
	at org.bukkit.craftbukkit.v1_20_R1.CraftServer.enablePlugin(CraftServer.java:656) ~[purpur-1.20.1.jar:git-Purpur-2062]
	at org.bukkit.craftbukkit.v1_20_R1.CraftServer.enablePlugins(CraftServer.java:567) ~[purpur-1.20.1.jar:git-Purpur-2062]
	at net.minecraft.server.MinecraftServer.loadWorld0(MinecraftServer.java:640) ~[purpur-1.20.1.jar:git-Purpur-2062]
	at net.minecraft.server.MinecraftServer.loadLevel(MinecraftServer.java:439) ~[purpur-1.20.1.jar:git-Purpur-2062]
	at net.minecraft.server.dedicated.DedicatedServer.initServer(DedicatedServer.java:345) ~[purpur-1.20.1.jar:git-Purpur-2062]
	at net.minecraft.server.MinecraftServer.runServer(MinecraftServer.java:1116) ~[purpur-1.20.1.jar:git-Purpur-2062]
	at net.minecraft.server.MinecraftServer.lambda$spin$0(MinecraftServer.java:322) ~[purpur-1.20.1.jar:git-Purpur-2062]
	at java.lang.Thread.run(Unknown Source) ~[?:?]
Caused by: java.lang.ClassNotFoundException: net.milkbowl.vault.economy.Economy
	at org.bukkit.plugin.java.PluginClassLoader.loadClass0(PluginClassLoader.java:185) ~[purpur-api-1.20.1-R0.1-SNAPSHOT.jar:?]
	at org.bukkit.plugin.java.PluginClassLoader.loadClass(PluginClassLoader.java:152) ~[purpur-api-1.20.1-R0.1-SNAPSHOT.jar:?]
	at java.lang.ClassLoader.loadClass(Unknown Source) ~[?:?]
	... 14 more
```

In this example, the Vault plugin that *RPGLives* works with is missing from the server (although if the plugin is missing, an [UnknownDependencyException](../plugins/basics.md#plugins-missing-dependency) error usually occurs instead).

```log
[22:09:41] [Server thread/ERROR]: [ModernPluginLoadingStrategy] Could not load plugin 'BungeeHub.jar' in folder 'plugins'
org.bukkit.plugin.InvalidPluginException: java.lang.NoClassDefFoundError: net/md_5/bungee/api/plugin/Plugin
	at io.papermc.paper.plugin.provider.type.spigot.SpigotPluginProvider.createInstance(SpigotPluginProvider.java:127) ~[paper-1.20.4.jar:git-Paper-462]
	...
```

In this example the error occurred because it is a BungeeCord plugin, but it is running on the Paper server. So this plugin tries to work with BungeeCord classes, but they don't exist on the Paper server.

## Missing/invalid plugin.yml {#invalid-plugin-yml}
Every Bukkit (Spigot) plugin must contain a `plugin.yml` file. In case you encounter an error of one of the types below, it means: 1) the uploaded file is not a Bukkit plugin (but for example a BungeeCord/Velocity plugin or mod) 2) the plugin contains an error In this case, the plugin author must be contacted to fix this issue.

Example of an error (in this case it is the BungeeCord plugin):

```log
[19:37:03] [Server thread/ERROR]: Could not load 'plugins/UltraStaffChat-5.2.2.jar' in folder 'plugins'
org.bukkit.plugin.InvalidDescriptionException: Invalid plugin.yml
	at org.bukkit.plugin.java.JavaPluginLoader.getPluginDescription(JavaPluginLoader.java:178) ~[paper-api-1.18.2-R0.1-SNAPSHOT.jar:?]
	at org.bukkit.plugin.SimplePluginManager.loadPlugins(SimplePluginManager.java:159) ~[paper-api-1.18.2-R0.1-SNAPSHOT.jar:?]
	at org.bukkit.craftbukkit.v1_18_R2.CraftServer.loadPlugins(CraftServer.java:418) ~[paper-1.18.2.jar:git-Paper-388]
	at net.minecraft.server.dedicated.DedicatedServer.initServer(DedicatedServer.java:288) ~[paper-1.18.2.jar:git-Paper-388]
	at net.minecraft.server.MinecraftServer.runServer(MinecraftServer.java:1164) ~[paper-1.18.2.jar:git-Paper-388]
	at net.minecraft.server.MinecraftServer.lambda$spin$0(MinecraftServer.java:316) ~[paper-1.18.2.jar:git-Paper-388]
	at java.lang.Thread.run(Unknown Source) ~[?:?]
Caused by: java.io.FileNotFoundException: jar does not contain plugin.yml
	... 7 more
```

```log
[19:34:10] [ServerMain/ERROR]: [DirectoryProviderSource] Error loading plugin: java.lang.IllegalArgumentException: Directory 'plugins/UltraStaffChat-5.2.2.jar' does not contain a paper-plugin.yml or plugin.yml! Could not determine plugin type, cannot load a plugin from it!
java.lang.RuntimeException: java.lang.IllegalArgumentException: Directory 'plugins/UltraStaffChat-5.2.2.jar' does not contain a paper-plugin.yml or plugin.yml! Could not determine plugin type, cannot load a plugin from it!
	at io.papermc.paper.plugin.provider.source.FileProviderSource.registerProviders(FileProviderSource.java:70) ~[paper-1.20.4.jar:git-Paper-496]
	at io.papermc.paper.plugin.provider.source.DirectoryProviderSource.registerProviders(DirectoryProviderSource.java:47) ~[paper-1.20.4.jar:git-Paper-496]
	at io.papermc.paper.plugin.provider.source.DirectoryProviderSource.registerProviders(DirectoryProviderSource.java:17) ~[paper-1.20.4.jar:git-Paper-496]
	at io.papermc.paper.plugin.util.EntrypointUtil.registerProvidersFromSource(EntrypointUtil.java:15) ~[paper-1.20.4.jar:git-Paper-496]
	at io.papermc.paper.plugin.PluginInitializerManager.load(PluginInitializerManager.java:101) ~[paper-1.20.4.jar:git-Paper-496]
	at net.minecraft.server.Main.main(Main.java:120) ~[paper-1.20.4.jar:git-Paper-496]
	at org.bukkit.craftbukkit.Main.main(Main.java:326) ~[paper-1.20.4.jar:git-Paper-496]
	at io.papermc.paperclip.Paperclip.lambda$main$0(Paperclip.java:42) ~[app:?]
	at java.lang.Thread.run(Unknown Source) ~[?:?]
Caused by: java.lang.IllegalArgumentException: Directory 'plugins/UltraStaffChat-5.2.2.jar' does not contain a paper-plugin.yml or plugin.yml! Could not determine plugin type, cannot load a plugin from it!
	... 9 more
```

## Service is not accessible "from the outside" {#service-not-accessible-from-outside}
In the case where the server itself is, but the address of another service is not publicly accessible "from the outside" (can't be accessed from another machine), make sure: a) the port the service is running on [is open](../general/address-ports.md#open-port) b) the service address is not [localhost](../general/address-ports.md#localhost-address) (*127.0.0.1*)

## Java class version errors {#class-version}
Class file version denotes the version of [bytecode](https://en.wikipedia.org/wiki/Java_bytecode), effectively the version of Java.

You can see which Java version corresponds to which class file version [here](https://stackoverflow.com/questions/9170832/list-of-java-class-file-format-major-version-numbers), or [here](https://javaalmanac.io/bytecode/versions/).

So the error below means that the *WorldGuard* plugin needs at least Java version 21 (class file version 65) to work, while Java version 17 (class file version 61) is used.

```log
[21:52:22] [Server thread/ERROR]: [ModernPluginLoadingStrategy] Could not load plugin 'worldguard-bukkit-7.0.10-dist.jar' in folder 'plugins'
org.bukkit.plugin.InvalidPluginException: java.lang.UnsupportedClassVersionError: com/sk89q/worldguard/bukkit/WorldGuardPlugin has been compiled by a more recent version of the Java Runtime (class file version 65.0), this version of the Java Runtime only recognizes class file versions up to 61.0
```
You may also encounter this error:
```log
[21:48:28] [Server thread/ERROR]: Fatal error trying to convert WorldEdit v7.3.2+6779-3aca580:com/sk89q/worldedit/command/ExpandCommands.class
java.lang.IllegalArgumentException: Unsupported class file major version 65
```

## Data version errors {#data-version}
Each Minecraft version has an associated [data version](https://minecraft.fandom.com/wiki/Data_version), which indicates the version in which the world data is stored.

You can find out which data version corresponds to which Minecraft version at [this link](https://minecraft.fandom.com/wiki/Data_version#List_of_data_versions).

So the error below means that the server is trying to load the chunks (world) from version 1.20.1 (data version 3465) to version 1.19.4 (3337), which is not supported (see [downgrade](../general/downgrade.md#downgrade)).

```log
[14:16:45] [Tuinity Chunk System Worker #0/WARN]: java.lang.RuntimeException: server attempted to load chunk saved with newer version of minecraft! 3465 > 3337
[14:16:45] [Tuinity Chunk System Worker #0/WARN]: at net.minecraft.world.level.chunk.storage.ChunkRegionLoader.loadChunk(ChunkRegionLoader.java:154)
[14:16:45] [Tuinity Chunk System Worker #0/WARN]: at io.papermc.paper.chunk.system.scheduling.ChunkLoadTask$ChunkDataLoadTask.runOffMain(ChunkLoadTask.java:318)
[14:16:45] [Tuinity Chunk System Worker #0/WARN]: at io.papermc.paper.chunk.system.scheduling.GenericDataLoadTask$ProcessOffMainTask.run(GenericDataLoadTask.java:307)
[14:16:45] [Tuinity Chunk System Worker #0/WARN]: at ca.spottedleaf.concurrentutil.executor.standard.PrioritisedThreadedTaskQueue$PrioritisedTask.executeInternal(PrioritisedThreadedTaskQueue.java:351)
[14:16:45] [Tuinity Chunk System Worker #0/WARN]: at ca.spottedleaf.concurrentutil.executor.standard.PrioritisedThreadedTaskQueue.executeTask(PrioritisedThreadedTaskQueue.java:118)
[14:16:45] [Tuinity Chunk System Worker #0/WARN]: at ca.spottedleaf.concurrentutil.executor.standard.PrioritisedThreadPool$PrioritisedThread.pollTasks(PrioritisedThreadPool.java:274)
[14:16:45] [Tuinity Chunk System Worker #0/WARN]: at ca.spottedleaf.concurrentutil.executor.standard.PrioritisedQueueExecutorThread.run(PrioritisedQueueExecutorThread.java:50)
```

## Port is already in use {#port-already-in-use}
As mentioned in [this section](../general/address-ports.md#ports), one port can be used by one service (on the same protocol). Therefore, if you encounter an error similar to this: `[00:00:00] [Server thread/ERROR]: [plugin] Failed to bind to 0.0.0.0:54212`, the issue might be the port is already in use by some another service.

## Protocol version {#protocol-version}
Each version of Minecraft is assigned a protocol version.

A complete list of Minecraft versions and their protocol versions can be found at the following link: <https://minecraft.fandom.com/wiki/Data_version#List_of_data_versions>

## 'zip file closed' error {#zip-file-closed}
For the cause and solution to the *'zip file closed'* error, see the following
link: <https://madelinemiller.dev/blog/minecraft-zip-file-closed/>

## Unsupported API version {#unsupported-api-version}
The *Unsupported API version* error means that the version of the plugin does not support an older version of the server. In this case, you need to update the server, or use an older version of the plugin (if it exists for that version of Minecraft), or just don't use the plugin.

```log
[22:14:43] [Server thread/ERROR]: [LegacyPluginLoadingStrategy] Could not load 'plugins/AuctionHouse-1.20.4-3.7.1.jar' in folder 'plugins'
org.bukkit.plugin.InvalidPluginException: Unsupported API version 1.20
	at org.bukkit.craftbukkit.v1_19_R2.util.CraftMagicNumbers.checkSupported(CraftMagicNumbers.java:380) ~[purpur-1.19.3.jar:git-Purpur-1933]
	at io.papermc.paper.plugin.provider.type.spigot.SpigotPluginProvider.createInstance(SpigotPluginProvider.java:119) ~[purpur-1.19.3.jar:git-Purpur-1933]
	at io.papermc.paper.plugin.provider.type.spigot.SpigotPluginProvider.createInstance(SpigotPluginProvider.java:35) ~[purpur-1.19.3.jar:git-Purpur-1933]
	at io.papermc.paper.plugin.entrypoint.strategy.LegacyPluginLoadingStrategy.loadProviders(LegacyPluginLoadingStrategy.java:200) ~[purpur-1.19.3.jar:git-Purpur-1933]
	at io.papermc.paper.plugin.storage.SimpleProviderStorage.enter(SimpleProviderStorage.java:35) ~[purpur-1.19.3.jar:git-Purpur-1933]
	at io.papermc.paper.plugin.entrypoint.LaunchEntryPointHandler.enter(LaunchEntryPointHandler.java:36) ~[purpur-1.19.3.jar:git-Purpur-1933]
	at org.bukkit.craftbukkit.v1_19_R2.CraftServer.loadPlugins(CraftServer.java:442) ~[purpur-1.19.3.jar:git-Purpur-1933]
	at net.minecraft.server.dedicated.DedicatedServer.initServer(DedicatedServer.java:309) ~[purpur-1.19.3.jar:git-Purpur-1933]
	at net.minecraft.server.MinecraftServer.runServer(MinecraftServer.java:1117) ~[purpur-1.19.3.jar:git-Purpur-1933]
	at net.minecraft.server.MinecraftServer.lambda$spin$0(MinecraftServer.java:321) ~[purpur-1.19.3.jar:git-Purpur-1933]
	at java.lang.Thread.run(Unknown Source) ~[?:?]
```

## Plugin is not mentioned in the log {#plugin-not-mentioned-in-log}
In the case where the plugin doesn't even try to enable (there is no mention of it in the [log](logs.md#log), it means the following ([assuming you are using a platform that supports plugins](#plugin-platforms)): In order for the plugin to attempt to enable, it must meet the following:

- the plugi filen must be in the `/plugins/` folder
- the plugin file must have a *.jar* extension

So if the plugin does not enable and there is no mention of it in the log, it means that you either did not upload the plugin itself (`.jar` file) or you did not upload it to the `/plugins/` folder.

## BungeeCord config resets after reboot {#bungeecord-config-reset}
Ignoring the fact that you should be using Velocity in 2024, the reason is as follows:

BungeeCord [config](../general/configs.md#config) must always be edited when the server is not running! Otherwise the config will reset on restart.

If the config resets even though the server isnot running when editing it, this is caused by a non-valid YML format. Read more about this problem [here](../general/configs.md#config-format-yaml).