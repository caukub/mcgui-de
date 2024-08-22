# Plugin LuckPerms {#luckperms}
LuckPerms is a plugin/mod (hereafter referred to as plugin) which allows setting permissions for players and groups you can assign players to. Permissions basically determine "who is allowed to do what" (e.g. execute commands, perform certain tasks, ...). You learn more about permissions [here](../../general/permissions.md#permissions).

LuckPerms has amazing [documentation](https://luckperms.net/wiki/Home), where you can find everything you need to know about the plugin. Below is a summary of the basics and useful information. In case you are unsure about something even after reading the documentation, the [LuckPerms Discord](https://discord.gg/luckperms) is the best place to ask for help.

## Terminology {#terminology}
The word "group" is same as "rank". Both terms are used in the text below.

## Permission basics {#permission-basics}
You can learn what permissions are and how to find out necessary permissions for certain action [here](../../general/permissions.md).

## LuckPerms basics {#luckperms-basics}
How to get started with LuckPerms can be found at [this link](https://luckperms.net/wiki/Usage).

LuckPerms has an intuitive web editor that you can open using the `lp editor` command.

If you are used to managing permisions via the web editor, you may need commands to set permisions in certain situations (e.g. you want to automatically assign a rank to a player after purchasing a VIP). Everything you can do in the web editor can also be done with a command. All commands can be found with an explanation in the documentation at the following link <https://luckperms.net/wiki/Command-Usage>

## Group name {#group-names}
You should not use the following in rank names:

1. periods
2. spaces
3. other special characters
4. diacritics

Why is explained below (you don't need to understand it).

You can use an underscore or a dash instead of periods and spaces.

This only applies to rank names (only the name itself, which serves as an identifier). In display names, prefixes, etc. you can use any characters you want.

### Why not use dots and spaces in group names {#dots-and-spaces-bad}
The reason why not to use dots in group names is caused by how libraries that reads (not only) Y(A)ML files works. If you wanted to read  `enable-mobs` value in the plugin in the following example, you would get the field using [dot notation](../../general/configs.md#dot-notation) as `settings.animals`, which looks like this in the Y(A)ML file:

```yaml
settings:
  enable-mobs: true
```

It wouldn't be a problem in most situations, but it can be.

The reason for not using spaces is because of the way arguments work in programming. In the following example:

```txt
somecommand arg0 arg1 arg2 arg3
```

is `somecommand` the command and the rest are arguments. The arguments are separated by a space.

Some plugin can for example do that it executes `someothercommand arg0` to do something with the `arg0` group. However, in the case where the group would be named `main helper`, the `main` argument is 0 (in programming it is usually indexed from zero instead of one) and the `helper` argument is 1, so the command will do something with the `main` group instead of `main helper`.

## Proxy {#luckperms-proxy}
In the case you want to synchronize permissions across servers, you need to set LuckPerms to proxy.

Setting up the plugin for proxy is also needed to be able to work with platform proxy permissions, for example permissions for the `server <server>` command. Setting this permission on a server with LuckPerms without setup for proxy will not allow the use of this command.

To learn how to set up LuckPerms on proxy network, [see here](https://luckperms.net/wiki/Network-Installation).

If you don't want to lose your existing LuckPerms settings when switching to proxy setup, you need to migrate the existing data: <https://luckperms.net/wiki/Switching-storage-types> (why that happens can be found [here](../../basic-principles/no-magic.md#storage-method-change-data-loss))

Since the LuckPerms perms will be linked, they will be set all servers by default. If you want to set permission for a specific server, you can simply do by using [context](#luckperms-context).

*Warning:* LuckPerms does not use the `lp` command on the proxy server itself (it does on [backend servers](~backend-server)). For BungeeCord (hence Waterfall), LuckPerms uses the `lpb` command, and for Velocity the `lpv` command.

## Context {#luckperms-context}
Context specifies the situation under which the set permission applies (when it is active). This situation can be, for example, when the player is in a certain world, on a certain server (in the case when you use [proxy](../../proxy.md#proxy)) and so on.

Read more [in the documentation](https://luckperms.net/wiki/Context).

In some situations, the <https://github.com/LuckPerms/ExtraContexts,> plugin can be useful to add a few new contexts. It's definitely worth mentioning the PlaceholderAPI [placeholders](../placeholders.md#placeholders) context, which can be useful in many situations.

## Verbose {#luckperms-verbose}
An often overlooked feature of LuckPerms is *Verbose*. This feature allows you to easily see what perms have been "checked" in real time. This can be especially useful when you are prevented from doing certain action, but don't know what plugin is causing it.

You can read more about this feature in the documentation:
<https://luckperms.net/wiki/Verbose>

## Accumulate {#luckperms-accumulate}
By default, nothing happens when setting a temporary rank/permission that a player already has. This can be changed in [config](../../general/configs.md#config). Setting `temporary-add-behaviour` to `accumulate` will add the duration in the command to the existing duration (see
<https://luckperms.net/wiki/Configuration#temporary-add-behaviour>).

If you don't want to apply this behavior automatically, the *accumulate* modifier can also be used in commands, see for example [here](https://luckperms.net/wiki/Parent-Commands#lp-usergroup-usergroup-parent-addtemp-group-duration-temporary-modifier-context).

## Weights {#luckperms-weight}
[Weight](https://luckperms.net/wiki/Weight) in LuckPerms is a numeric value that determines the priority of the groups (and metadata of groups). The higher the number, the higher the weight (priority).

When a player has a default group with weight 0 and vip group with weight 30, the player's primary group will be vip (basically the group with the highest weight), so [when configured correctly](../prefixes.md), the vip group prefix will be displayed in chat, tab, ... Furthermore, the weights can in TAB plugin be used to automatically sort players in the tab based on the group etc.

Note: Metadata (prefixes, suffixes, ...) and groups do not necessarily share the same weight, although they are automatically set when the group is created.

## Inheritance {#luckperms-inheritance}
A group can inherit permissions of another group(s). Inheritance avoids repetitive work. For example, instead of re-setting the VIP+ group to have the same perms as the VIP group has, you can simply configure the VIP+ group to inherit the VIP group's permissions, so the VIP+ group will automatically have all the perms that the VIP group has set.

You can simply set the inheritance in the web editor in the *Parent groups* section of a given group, or by [using the command](../../general/commands.md#commands) `lp group <group1> parent add <group2>`, which will cause the first group to inherit all permission from the second group ([see wiki](https://luckperms.net/wiki/Parent-Commands#lp-usergroup-usergroup-parent-add-group-context)).

In the case where the parent group (the group that inherits the permissions) has an inheritance permission that you don't want it to have, just disable that permission on the parent group. A negative (disabled) permission will override the positive (enabled) permission.

## Default group {#luckperms-default-group}
As described [here](https://luckperms.net/wiki/Default-Groups), all players have a default group *default* and you cannot change the name of this group to e.g. 'player' or 'member'.

The name of this group is for identification only, so it doesn't matter. You can set display name, prefixes and so on to whatever you want. Eventually, you can use the alternatives mentioned [in the article](https://luckperms.net/wiki/Default-Groups), but this is unnecessary, as it is only an identifying name and has no effect on the displayed rank names.

## 'parent set' vs 'parent add' {#parent-set-vs-add}
The `lp <user> parent set <group>` command sets the player group and remove others.

The `lp <user> parent add <user>` command adds a new group to the player and leaves the existing ones unchanged.

## Primary group {#luckperms-primary-group}
A player's primary group is the group with the highest [weight](#luckperms-weight).

## Prefixes don't show {#prefixes-dont-show}
Even if you set a prefix in LuckPerms for a rank (group), the plugin itself cannot display it anywhere. Therefore, you need to use plugins that takes the prefix from LuckPerms and display it. Read more [here](../prefixes.md#prefixes).

## Notes {#notes}
The plugin is called *LuckPerms*, not Luck~~y~~Perms or Luck~~o~~Perms (since the author is called *lucko*) as some people confuse.

Any group metadata such as inherited groups, display name, prefix or weight are themselves permission (`group.<group>`, `displayname, <displayname>`, `prefix.<weight>.<prefix>`, `weight.<weight>`), which may remind you a bit of UNIX's "[Everything is a file](https://en.wikipedia.org/wiki/Everything_is_a_file)". This can be useful in certain situations. For example, if you want to show (part of) a menu in the DeluxeMenus plugin only for a certain group, you could simply [check](https://wiki.helpch.at/helpchat-plugins/deluxemenus/options-and-configurations/requirements#has-permission) if the player has the `group.<group>` permission.

Just because permission doesn't show up in the web editor's permission whisperer doesn't necessarily mean that the permission doesn't exist.