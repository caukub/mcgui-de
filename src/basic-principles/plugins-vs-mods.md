# Plugins vs Mods {#plugins-vs-mods}
There are two kinds of unofficial community modifications - plugins and mods.

The difference between the two is quite fundamental. While a plugin is only installed on the server and players can connect with the Vanilla client, a player who wants to connect to a modded server must also have mods installed on their client (with exceptions where server-side only mods are on the server). Often, it is also necessary to have synchronized mod configuration on the server and on the client. This difference between plugins and mods is due to how plugins and mods work internally.

Plugins achieve all functionality using existing mechanics already implemented in the Vanilla version of the game. Mods, on the other hand, directly modify the code of Minecraft itself.

When you want to add a new item to the plugin server, the properties of the item can be set and the appearance changed using a resource pack plugin. The actual properties of the item and its appearance are things that the Vanilla client can handle. It is still an existing item from Vanilla Minecraft to which the texture from the resource pack is applied, so only the features implemented in Vanilla Minecraft are used.

On the other hand, if you want to add an item on a modded server, you need to have the mod installed as well. This item is a completely new item that the Vanilla Minecraft client doesn't know - it doesn't exist for it. This is how it works for mods, not only for the items themselves, but also for mobs, blocks and number of other various features.