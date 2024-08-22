# Security {#security}
## Someone "hacked" me / Someone "hacked" into console {#hacked-server}
In the case where someone has permissions on/to the server without us intentionally giving it to them, this could have been accomplished in a number of ways, as described below.

There is no one-size-fits-all guide to detecting and fixing the cause of the intrusion. It always depends on the specific method, the skills and motivation of the attacker, and the knowledge of the victim, but usually the cause and effect can be traced using the [server log](../problem-solving/logs.md) and audit log (action history) in the [administration panel](../other/panels.md) (if the attacker is a person who had access to it).

When fixing the "hack", at least check and consider the following:

- Access in the administration panel

In the administration panel, make sure that only you have access to your account. If you gave access to someone else too, make sure that the account is not performing any suspicious actions (check audit log).

- Permissions

In the permission plugin (usually LuckPerms), make sure that only the users who are supposed to have permissions actually have them.

- OP

In the `ops.json` file, make sure that [OP](../vanilla/op.md#op) is not given to players who should not have it (ideally, you can disable OP on the server by setting `enable-ops` to `false` in the LuckPerms config)

- RCON

In `server.properties`, make sure you have [RCON](../vanilla/rcon.md#rcon) disabled. Otherwise, any person with the RCON password can control the server as if they had access to the console.

- FTP

If the user had access to FTP, change the password for the FTP account or delete the FTP account. Access to files means that the user can set permissions and create backdoors.

However, the attacker could have easily created a backdoor in many ways. The solution is individual and typically requires more experience. The solution complexity depends on the attacker's skills and motivation.

### Causes/methods of "hacking" {#hacked-server-cause}
#### Most common causes {#hacked-server-common-causes}
- offline mode

Basically, anyone can connect to the offline mode server as anyone (i.e. even a player with privileges). For this reason, the server needs to be secured with a login plugin. Whitelist does not serve as any form of protection. Read more [here](offline-mode.md#offline-mode-security).

- proxy

If you use a proxy, the [backend servers](~backend-server) must be in offline mode, thus these servers must be secured. Read more [here](proxy.md#proxy-security).

- trusted person

A common problem, especially with younger users who trust others - they grant either in-game permissions or in the admin panel rights to various actions, which they can then abuse and possibly create backdoors.

This can be prevented quite well by following the principle [Principle of least privilege (PoLP)](https://en.wikipedia.org/wiki/Principle_of_least_privilege), which in simple terms means: grant access to things only when necessary and trust no one.

Keep in mand that a person with console access has absolutely all rights and can perform any action. Same follows for people with access to edit server files.

- Infected plugins

Another common cause of unauthorized access is by using infected plugins. These can be plugins from "friends", and typically malware (see [here](malware.md#malware)). Always download plugins from the official source!

#### Less common causes {#hacked-server-occasional-causes}
- vulnerabilities in legitimate plugins

Even legitimate plugins can contain vulnerabilities. This was the case in the past with e.g. CMILib and Vulcan, where anyone could change the commands executed during a punishment in the configuration (so they could, for example, add the `op johndoe` or `lp user johndoe permission set *` command and get punished, thus gaining all privileges on the server).

#### Exceptional causes {#hacked-server-extraordinary-causes}
You will almost certainly not encounter the causes listed below, but it can theoretically happen.

-  vulnerabilities in the administration panel/system

If you use an administration panel such as Pterodactyl to manage your server, it may have vulnerabilities. This has happened several times in the past (e.g. with the Pterodactyl Panel). However, the chances of this being the cause of unauthorized access to your server are very, very low.

- unauthorized access to the entire system

This can be accomplished in many ways, such as malware, cracking a weak SSH password, etc.

- session exploit

If the server is in [online mode](../general/online-mode.md#online-mode), it can still possible for someone to connect as a Minecraft account even if that person does not have access to it, thanks to a session exploit. This has happened several times in the past. This is a vulnerability on the part of Mojang that players cannot control. From the server side, you can use e.g. [WorldGuard host keys](https://worldguard.enginehub.org/en/latest/host-keys/) or an authentication plugin like LibreLogin to protect against it (however, on an online mode server you probably don't want a login plugin for normal players).

You can learn more in [this article](https://github.com/nerdsinspace/leaky-leaky) or [this video](https://www.youtube.com/watch?v=c8MR15g2I6w).

- admin account access (stolen password)

Another way a player can gain unauthorized rights is by using admin's Minecraft account. On the [online mode](../general/online-mode.md#online-mode) server, this can only be done by accessing the admin's Minecraft (Microsoft) account (assuming you can't use the session exploit mentioned above). On an [offline mode](../general/online-mode.md#offline-mode) (assuming authentication plugin is installed), this could happen when using weak or leaked password (e.g. you used the same password on another server which is stealing passwords).

## Backups {#security-backups}
In case something goes wrong, it is essential to keep backups of your server! Read more [here](../administration/backups.md#backups).