# Hosting role {#hosting-role}
It is important to note that hosting does not affect the functionality of server itself, e.g. plugins. Minecraft server management is universal regardless of hosting (as long as you have full access to the server files).

Although hosting does not play a direct role in the management of the Minecraft server itself, other things depend on hosting, such as the clarity and features of administration (managing access to other users), additional services (database, backup), the amount of server resources allocated and their performance (CPU, disk), server availability, protection (DDoS), or the quality of support.

## Non-functional aspects of the game {#hosting-something-doesnt-work}
Occasionally, it is possible to meet a person (complete beginner) who, after buying hosting, starts complaining about the hosting and says it is of poor quality, because many things on the server don't work, or the server shuts itself down. But of course, typically the hosting does not cause any of these things. The functionality of plugins does not depend on the hosting itself and the hosting has no way to influence it. The management of the server itself is up to the user. Usually non-working plugins are caused by wrong plugin versions and [dependencies](../plugins/basics.md#plugin-dependencies), [see here](../problem-solving/common-issues.md#modification-download).

Although there are exceptions (e.g. [wrong permissions for `/tmp/` folder](https://madelinemiller.dev/blog/good-minecraft-server-host/#tmp-directory-permissions)), the chance of running into such problem with a decent host is minimal. Even if your hosting does have such errors, the problems will manifest themselves in the absolute minimum of plugins, since the vast majority of plugins do not use anything that the hosting can affect.

Hosting is therefore the last place you should look for the cause of a malfunctioning aspect of the Minecraft server itself. While there may be exceptions, the chance of running into one with decent host is really small. For problems with plugins or mods, the chances are absolutely minimal, and for automatic server shutdowns, the chances are slightly higher, but still small. If you don't know how to solve server or plugin problems, you can learn more [here](../problem-solving/how-to-deal-with-issues.md#how-to-deal-with-issues).

## Minecraft server management is universal {#server-management-is-universal}
In the case where you have full access to the server files, the management of the Minecraft server itself is universal.

Therefore, questions of the following type are unnecessary.
- "How do I install the plugin on \<host\>?"
- "How do I set world seed on \<host\>?"

The moment you as a user have full access to the server files, the server functionality is not limited in any way. Managing a Minecraft server is universal, so you install the plugin or set the seed in exactly the same way regardless of whether you host the server on your machine, hosting A, B, or C.

If you "google" how to do something, you'll do it the same way everywhere. For example, you install a plugin by uploading the plugin into `/plugins/` and then restarting the server ([see here](../plugins/basics.md#plugin-installation)). You set the seed by setting the seed value for `level-seed` in the `server.properties` file ([see here](../general/world.md#world-seed))

The feature in the administration that sets the seed, or downloads the plugin, is just for convenience. These functions will only do "under the hood" what you can do manually (i.e. if you change the seed, set the `level-seed` value in `server.properties`, or upload the plugin to the `/plugins/` folder). It also follows, for example, that if you have access to the server files, asking if the hosting supports cracked players is unnecessary.

Apart from the files, there is another aspect of managing the server itself where you may be restricted if you don't have full access to it. This aspect is the setting of [Java flags](../administration/java.md#java-flags), however you are unlikely to encounter a problem here as with decent hosting the optimal flags will be set automatically. Though, you should still be able to change the flags, or at least ask for a change, because sometimes it may be needed for some very specific purposes.
