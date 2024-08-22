# Permissions {#permissions}
Having properly configured permissions is essential for almost any public server, especially if plugins are installed. Simply put, permissions determine "who is allowed to do what", whether it be commands, certain actions, functions, or even setting certain limits (e.g. number of homes).

So a permission management plugin allows you to give players rights to specific actions/commands/functions instead of having to give them [OP](../vanilla/op.md) (= access to everything).

## Choosing a permission plugin {#permission-plugin}
The standard for managing permissions is [LuckPerms](https://luckperms.net/) and there is no objective reason to use a different permission plugin. **In any case, do not use old standards such as *PermissionsEx*.**

The vast majority of people (whether plugin creators, tutorial writers, people that will help you) assume that you are using LuckPerms. If you use a different permission plugin, you will lose some options, fewer people will be willing/knowledgeable to help you in certain situations, etc.

LuckPerms is open-source, really high quality, most widely used, reliable standard with stable development and support. They are also universal as they have support for a wide range of platforms.

At the same time, always use only one permission plugin. Using multiple plugins to manage permissions is likely to cause conflicts.

The LuckPerms manual can be found [here](../plugins/specific/luckperms.md).

## Getting the required permission {#what-permission}
There are permissions for the platforms themselves, which you can always find in the platform-specific documentation (for example, for Vanilla and Bukkit commands on Paper see [here](https://docs.papermc.io/paper/reference/permissions)), and then plugins.

**The permissions can always be found in the documentation of the specific plugin or platform**, as they are always specific to that plugin or platform. Hence, a question like "What is the permission for destroying blocks?" cannot be answered without more information, as one cannot know which plugin prevents the block breaking.

If you don't automatically know which plugin to look for permissions in, you can typically tell by the message that says you don't have sufficient permissions. However, if the plugin does not write any message to the chat, or you can't identify the plugin based on the message, you can use the LuckPerms feature [Verbose](../plugins/specific/luckpems.md#luckperms-verbose).

Definitely do not try to guess the permissions. Always find out what specifically prevents the action first, and then look up the permionssion in the platform or plugin documentation. If you are unable to determine what specific plugin requires the permissions, use the [LuckPerms](../plugins/specific/luckpems.md#luckperms) feature [Verbose](../plugins/specific/luckpems.md#luckperms-verbose) as mentioned above.

### Need for multiple permissions and group permissions {#multiple-permissions-required}
It is good to keep in mind that multiple permissions are needed for certain actions. For example, if you want to be able to create multiple homes in *EssentialsX*, you need to have not only the `essentials.sethome` permission, which allows the sethome command, but also the `essentials.sethome.multiple` permission, which allows more than one home. The maximum number of homes with only these permissions for *EssentialsX* is determined by the value `sethome-multiple.default` in the configuration.

However, if you wanted to assign a player to a group with a larger number of homes, you would still need to assign the `essentials.sethome.multiple.[set name]` permission to assign the player to that group, so for example a player with the `essentials.sethome.multiple.vip` permission would have home limit of 5.

```yaml
sethome-multiple:
  default: 3
  vip: 5
  staff: 10
```

This works the same way for the *Residence* plugin, for example, where the permission `residence.group.[groupname]` is assigned to the group settings set in the *Residence* configuration.

## Proxy permissions {#proxy-permissions}
In the case you want to set a player/group in the permission plugin with a platform proxy permission (e.g. for the `server <server>` command), the permission plugin must be configured to support the proxy. How to configure the plugin to support proxy in LuckPerms can be found [here](../plugins/specific/luckpems.md#luckperms-proxy).

## Bypass permissions {#bypass-permission}
A bypass permission is a permission that specifies that a certain setting (behavior) does not apply to a user with this permission.

An example of such permission is `essentials.afk.kickexempt`, where a player with this permission will not be kicked in the event of an AFK player autokick, or `essentials.spawn-on-join.exempt`, where a player will not spawn on join time, even if `spawn-on-join` is enabled in the config.

In the case when certain configuration doesn't work for a player with privileges but for normal players it does, it's very likely that it's due to bypass permission. A player with `*`, `*.*`, or [OP](../vanilla/op.md#op) permisions are assigned all permisions, including bypass permisions, which is something you should keep in mind.

## Note for geeks {#note}
Minecraft (Vanilla) itself does not have a permission system implemented, it uses permission levels instead. The permission system is implemented by CraftBukkit (and other platforms).