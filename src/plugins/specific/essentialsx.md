# EssentialsX Plugin {#essentialsx}
EssentialsX provides a number of often used features such as homes, warps, commands like tpa, god and much more.

## Addon plugins {#essentialsx-addons}
To use the features of EssXSpawn, EssXChat or any other addon plugin, you must first install the addon plugin.

When installing, make sure the version of the addon plugin and EssentialsX is the same. Otherwise, the addon plugin will not work.

## Custom translation (messages) {#essentials-translation}
To change messages in EssentialsX, create a `messages.properties` file in the `/plugins/Essentials/` directory and paste the content of the language file you want to use there. Language files can be found [here](https://github.com/EssentialsX/Essentials/tree/2.x/Essentials/src/main/resources).

After saving the file and loading the changes using `ess reload` command, the messages from the `messages.properties` file will be used.

## EssentialsX Protect and EssentialsX AntiBuild {#essentialsx-protect-antibuild}
If you don't know why you want to use one of these plugins, don't install them. EssX Protect and AntiBuild plugins are completely useless for most people (the plugins usually cause unwanted behavior so people usually delete them right away - specifically it disallows actions like block breaking by default).

## Configuration {#essentialsx-configuration}
To reflect changes in config, the plugin needs to be reloaded with `ess reload` command.

Below are the most common configuration issues/topics that are frequently referenced. If you are looking for a specific setting in the config, search (*Ctrl + F*) for keywords.

### How to disable red nicks {#essx-red-nicks}
Set the value of `ops-name-color` in config to `none`.

### Unsafe enchantments {#essx-unsafe-enchantments}
If you cannot enchant above standard enchantment levels, enable `unsafe-enchantments` in config.

### How to remove the '~' prefix {#essx-wave}
Set `nickname-prefix` in config to an empty value (`nickname-prefix: ''`)

### How to enable multiple homes? {#essx-multihome}
Read more [here](https://wiki.ess3.net/wiki/Multihome).

### How to disable specific EssentialsX command? {#essx-command-disable}
There is a `disabled-commands` section in config where you can disable specific EssentialsX commands.

### When I connect, I get a message that I have not received any message (mail) {#essx-no-new-mail}
This is caused by the `notify-no-new-mail` setting in config.

### Player is immortal after teleporting for a few seconds {#essx-teleport-invulnerability}
This is caused by the `teleport-invulnerability` setting in config.

### New players get a kit when they first join {#essx-newbie-kit}
This is caused by the EssentialsXSpawn setting in config, specifically the `newbies.kit`. If you do not want to give new players any kit, set a blank value for this field (`kit: ''`)