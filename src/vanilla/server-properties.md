# server.properties {#server-properties}
`server.properties` is a file in the *properties* format that contains the basic settings for a Minecraft server. You can find what each setting means at this link: <https://docs.papermc.io/paper/reference/server-properties>, or it is broken down in even more detail here: <https://minecraft.fandom.com/wiki/Server.properties#Keys>

It is a good idea to go through this list and have some understanding of the basic settings.

## Basic settings {#basic-settings}
Below are some settings that are good to elaborate on or that often need to be referenced.

### online-mode {#online-mode}
Online-mode basically means whether only players with an original Minecraft account can join, or if "cracked" accounts can join too. You can learn more about online-mode [here](../general/online-mode.md#online-mode).

If you change this setting, players will "lose" their data, see [here](../general/online-mode.md#online-mode-change-data-loss), so it's a good idea to set this at the beginning of the server and not change it afterwards, although there are external tools that can migrate player data, but this only applies to Vanilla data, not plugin data.

### level-seed
Specifies the seed of the world to be created. See [here](../general/world.md#world-seed) for how to change the seed of a world that already exists.

### difficulty {#difficulty}
Specifies the difficulty of the world to be created. To change the difficulty of a world that already exists, see [here](../general/world.md#world-difficulty).

### spawn-protection {#spawn-protection}
The `spawn-protection` specifies the protected area around the spawn, by default 16. Spawn protection is disabled by setting `spawn-protection` to 0.

### use-native-transport {#use-native-transport}
`use-native-transport` determines whether packet handling is optimized on the Linux operating system. It is therefore recommended to have this option enabled. However, it will only be functional on the Linux operating system.

On older versions (1.8.8 and below), if using a higher version of Java, enabling this feature may cause problems. The server will probably start spamming log and the disk space will fill up very quickly (gigabytes in a little while).

### enforce-secure-profile {#enforce-secure-profile}
In case you can't post to chat due to *"Chat disabled due to missing profile public key... "*, follow this article: <https://gist.github.com/Jo0001/4d14eb4d3ae51b11eb90ba3296c8095b>