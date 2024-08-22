# Prefixes {#prefixes}
This chapter assume you have LuckPerms on your server with the ranks (including prefixes) configured. If you don't have LuckPerms and prefixes set up, you can learn how LuckPerms work and what they are for [here](../general/permissions.md#permissions).

Even when you set a prefix to a rank (group) in LuckPerms, the plugin itself cannot display it anywhere. Therefore, other plugins are required to "get" the prefix from LuckPerms and display it. What plugins are they is described below. There are many more plugins of course, these are the most common and often the most optimal ones.

## Chat prefixes {#chat}
### LPC {#lpc}
A frequently used option for displaying prefixes in chat is the
[LPC](https://www.spigotmc.org/resources/lpc-chat-formatter-1-7-10-1-20.68965/) (LuckPermsChatFormatter) plugin.

This option is universal, as it is directly a chat format plugin. Its only dependency is LuckPerms. If we were using EssentialsChat/CMI chat format, we would have to set up the chat format again if we stopped using Essentials/CMI.

### EssentialsChat {#essentialsx-chat}
When using the EssentialsX, the EssentialsXChat addon can be used. The plugin needs [Vault](https://www.spigotmc.org/resources/vault.34315/) dependency to work properly with LuckPerms.

**Warning!** EssentialsX addons (like EssentialsXChat) version needs to be the same as EssentialsX. Otherwise, the addon plugin will not work.

## Tab prefixes (and prefixes next to the name above the player)
How to to show the prefix in the tab depends on the tab plugin you use. Nowadays, the standard is [TAB](https://modrinth.com/plugin/tab-was-taken) (from NEZNAMY). You can learn more how to show LuckPerms prefixes in tab (or next to the player's name) [on its wiki](https://github.com/NEZNAMY/TAB/wiki/Frequently-Asked-Questions#2---how-to-make-tab-work-with-luckperms).
