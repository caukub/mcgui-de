# Developing modifications, external tools for Minecraft server and server itself {#deving-tools}
## Datapacks {#deving-datapacks}
If you want to start creating datapacks, the Minecraft wiki is the ideal place to start:
<https://minecraft.fandom.com/wiki/Tutorials/Creating_a_data_pack>

## Plugins {#deving-plugins}
Plugins are developed in the Java programming language, so it's strongly recommended that you know Java before diving into creating them, especially if you have no previous programming experience. If you are serious about developing plugins and don't want to just "tinker", learn Java properly, but this will take a lot of time. Otherwise, the development of your plugins will be extremely inefficient, as will the plugins themselves, and the quality of the code will be awful.

If you learn Java properly (but that is not a process that takes days or weeks), then you will have no problem developing not only plugins, but also mods or even other things that are not related to Minecraft. Plus, you'll learn how to code, which is a very useful skill that is also transferable.

If you do know Java, the PaperMC documentation is a great place to start: <https://docs.papermc.io/paper/dev>

## Mods {#deving-mods}
Mods are developed in the Java programming language, so it is strongly recommended that you know Java before you dive into creating them, especially if you have no prior programming experience. If you are serious about developing mods and don't want to just "tinker", learn Java properly, but this will take a lot of time. Otherwise, your mod development will be extremely inefficient, as will the mods themselves, and the quality of the code will be awful.

If you know Java, then you will have no problem developing not only mods, but also plugins or even other things that are not related to Minecraft. Plus you'll learn how to code, which is a very useful skill that is also transferable.

If you know Java, start in the documentation of platform you want to create a mod for:

<https://fabricmc.net/wiki/tutorial:start>

<https://docs.minecraftforge.net/en/latest/gettingstarted/>

## Getting the UUID {#uuid-generation}
To get the UUID of an existing account, just send a (HTTP) GET request to
`https://api.mojang.com/users/profiles/minecraft/<username>` see [here](https://wiki.vg/Mojang_API#Username_to_UUID).

Offline UUID is generated from the name, specifically the Java method is used

```java
UUID#nameUUIDFromBytes(byte[] name)
```

where the bytes of the string are used for the `name` parameter
`OfflinePlayer:NICK`.

This method generates [UUID version 3](https://en.wikipedia.org/wiki/Universally_unique_identifier#Versions_3_and_5_(namespace_name-based)), which is an MD5 hash with a few modifications:

```java
md5Bytes[6] &= 0x0f; /* clear version */
md5Bytes[6] |= 0x30; /* set to version 3 */
md5Bytes[8] &= 0x3f; /* clear variant */
md5Bytes[8] |= 0x80; /* set to IETF variant */
```

## External tools {#deving-external-tools}
In case you want to develop external tools that, for example, read game files (e.g. world) or interact with the server (e.g. get server status), you will find <https://wiki.vg/Main_Page> and <https://minecraft.fandom.com/> very helpful.

For example, if you would like to rewrite the [Minecraft Region Fixer](https://github.com/Fenixin/Minecraft-Region-Fixer), which reads and fixes world files, in another language, all you need is knowledge of NBT, Region and Anvil format, which you can find at the following links

<https://wiki.vg/NBT>
<https://minecraft.wiki/w/NBT_format>
<https://minecraft.fandom.com/wiki/Region_file_format>
<https://minecraft.fandom.com/wiki/Anvil_file_format>

If you wanted a program to get the status of a server (similar to <https://mcsrvstat.us>), you would just need to know the [Query](https://wiki.vg/Query) and [Server List Ping](https://wiki.vg/Server_List_Ping) protocols (and [RakNet](https://wiki.vg/Raknet_Protocol) for the Bedrock edition).

So the programming language doesn't matter. It's the same as with, for example, HTTP - there is a specification that you just need to follow. Of course, there are limits - if you wanted to write a program that generates a world in the Rust programming language, it would be very difficult for an individual to do so (as well as to make updates to it), since you would need to rewrite the entire world generator, but it is theoretically possible ([the server source code can be accessed easily](https://github.com/hube12/DecompilerMC)).

You may also find the following tool useful for comparing changes between versions: <https://pokechu22.github.io/BurgerWebViewer/>

## The server itself {#deving-server}
If you want to implement your own Minecraft server, start here: <https://wiki.vg/How_to_Write_a_Server>

At <https://wiki.vg/> you will find the protocol documentation, which you're going to need.

Keep in mind, however, that the Minecraft server is a large project, and no one has yet succeeded in reimplementing it from scratch, as it would be a huge undertaking.

To get the Vanilla server code, use <https://github.com/hube12/DecompilerMC> (alternatively <https://parchmentmc.org/> may provide code with more information)

You may also find the following tool useful for comparing changes between versions: <https://pokechu22.github.io/BurgerWebViewer/>