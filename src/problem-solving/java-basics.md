# Java Basics {#java-basics}
This section contains the basics of the [Java](../administration/java.md) programming language, which can help in certain situations (such as reading log errors) when managing a Minecraft server.

> [!IMPORTANT]
> Some parts are really simplified and serve to understand the very basics even for beginners who are not interested in programming. Therefore, some parts or breakdowns may be misleading or even factually wrong. So please take note of this fact, and if you are interested in this topic in more depth, or from a different perspective than Minecraft server administration itself, take this section with a *lot* of caution.

## Types {#java-types}
### Basic data types {#basic-data-types}
- String

The *String* data type is in simple terms a text, for example: *This is a String*, or *A*

- Boolean

Boolean can have 2 values - `true` or `false`, which can be interpreted as "on/off", "yes/no", or "true/false" depending on the context.

- Integer

Simply put, *Integer* is a whole number, for example *56*.

- Float
- Double

Both *Float* and *Double* denote a decimal number, for example *3.6343642* (the difference between them is not important, but simply put, *Double* has more decimal places).

### Other data types {#other-data-types}
#### Class {#java-class}
In a very simplified (and factually incorrect) way, you can think of a class as a file responsible for executing a particular piece of code with a particular purpose. This class is located in [package](#java-package), which you can think of as the folder in which the file (class) is.

#### Object {#java-object}
An object is everything in Java except the primitive data types (*int*, *char*, *byte*, *short*, *long*, *float*, *double*, *boolean*).

## Stacktrace {#java-stacktrace}
As explained in [this great post on *StackOverflow*](https://stackoverflow.com/a/3988794) (which explains stacktrace well, so I definitely recommend reading it), stacktrace is, in simple terms, a list of [method](#java-method) calls that the application made when an [Exception (error)](#java-exception) occurred. From stacktrace, you can tell where, when, and why the Exception occurred.

For example, such a stacktrace might look like this:

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

How to read a stacktrace can be found at this link: <https://docs.papermc.io/paper/dev/reading-stacktraces>

The fact that 'java' appears in stacktrace does not mean there is a problem with Java as some people think, it just lists the methods called from the Java library.

Some examples of reading stacktrace can be found [here](../problem-solving/how-to-deal-with-issues.md#how-to-read-stacktrace).

## Exception {#java-exception}
According to the [official Java documentation](https://docs.oracle.com/javase/tutorial/essential/exceptions/definition.html), the definition of Exception is following: "An exception is an event, which occurs during the execution of a program, that disrupts the normal flow of the program's instructions".

This may sound complicated, but it simply means that an Exception means that an _error_ has occurred.

You may encounter exceptions in [stacktraces](#java-stacktrace), such as this:

```log
[00:00:00] [Server thread/ERROR]: Encountered an unexpected exception
org.spongepowered.configurate.serialize.SerializationException: [entities, spawning, monster-spawn-max-light-level] of type java.lang.Integer: java.lang.NumberFormatException: for input string: "default"
	at org.spongepowered.configurate.serialize.NumericSerializers.parseNumber(NumericSerializers.java:346) ~[configurate-core-4.1.2.jar:?]
	at org.spongepowered.configurate.serialize.NumericSerializers.lambda$static$9(NumericSerializers.java:254) ~[configurate-core-4.1.2.jar:?]
	at org.spongepowered.configurate.serialize.FunctionScalarSerializer.deserialize(FunctionScalarSerializer.java:40) ~[configurate-core-4.1.2.jar:?]
	...
```

Specifically, here we are dealing with *SerializationException* and [*NumberFormatException*](https://docs.oracle.com/javase/8/docs/api/java/lang/NumberFormatException.html), implying that an error occurred during config serialization (loading) due to the inability to convert the *default* value (of the key [`entities.spawning.monster-spawn-max-light-level`](https://docs.papermc.io/paper/reference/world-configuration#entities_spawning_monster_spawn_max_light_level)) to a number (the *default* value cannot be converted to a number). This error is broken down in more detail [here](how-to-deal-with-issues.md#stacktrace-example-1).

## Package {#java-package}
[Packages in Java](https://docs.oracle.com/javase/tutorial/java/concepts/package.html) is used to organize code. In simple terms, a package can be thought of as a folder containing source code files ([classes](#java-class)).

Packages appear in [stacktraces](#java-stacktrace), and can be used to identify exactly where the error occurred. For example in the following stacktrace the `com.comphenix.protocol`, `xyz.kyngs.librelogin.paper` and `org.bukkit.plugin.java` package appears.

```log
[16:35:48 ERROR]: Error occurred while enabling LibreLogin v0.18.1 (Is it up to date?)
java.lang.NoClassDefFoundError: com/comphenix/protocol/ProtocolLibrary
        at xyz.kyngs.librelogin.paper.PaperLibreLogin.disable(PaperLibreLogin.java:109) ~[LibreLogin.jar:?]
        at xyz.kyngs.librelogin.paper.PaperBootstrap.onDisable(PaperBootstrap.java:87) ~[LibreLogin.jar:?]
        at org.bukkit.plugin.java.JavaPlugin.setEnabled(JavaPlugin.java:283) ~[paper-api-1.20.2-R0.1-SNAPSHOT.jar:?]
        at xyz.kyngs.librelogin.paper.PaperBootstrap.disable(PaperBootstrap.java:96) ~[LibreLogin.jar:?]
```

You can identify which specific program (plugin/mod/server/library) it is by the beginning of the package name. The name of the package contains the name of the author (`comphenix`), or the program itself (`librelogin`), or both (`kyngs.librelogin`).

The beginning of a package is usually the page where the developer can be found backwards, so for example an author page using the `com.comphenix` package can be found at `https://comphenix.com`, or a developer with a package starting with `com.github.hakan-krgn` will have the username `hakan-krgn` on *GitHub* (<https://github.com/hakan-krgn>).

However, if the package name doesn't point to a specific/working page, or doesn't include a specific plugin name, or even the author, this information is usually still very useful, because almost always the package name is all that is needed to find the program using *Google*.

## Method {#java-method}
A method in Java is, simply put, a function that performs a particular "task" with a particular purpose.