# Offline Mode Security {#offline-mode-security}
When the server is in online mode, the server security decreases due to the fact that Minecraft servers do not control the ownership of the accounts of the connected players, and thus any player can connect under any nickname.

Therefore, it is important to note the following. Even so, the most reliable form of account protection on a server is to use online-mode ([and not just for security reasons](../general/online-mode.md#offline-mode)), as authentication plugins can contain bugs, or ignorance, misunderstanding, or misconfiguration can also play a large role.

## Authentication plugin {#authentication-plugin}
An authentication plugin, such as [AuthMeReloaded](https://www.spigotmc.org/resources/authmereloaded.6269/), or the more modern [LibreLogin](https://modrinth.com/plugin/libre-login), is an absolute must on an offline-mode server.

In the case where no authentication plugin is installed on the server, anyone can join as any player, including a player who has privileges on the server. For this reason, enabling whitelist does not increase the security level in any way, see below.

### Authentication plugin on proxy {#authentication-plugin-proxy}
If you are using an authentication plugin on your proxy server, you may need an extra plugin to make it work properly. This is the case with AuthMe, for example, where you need to have the BungeeCord and the AuthMeVelocity or AuthMeBungee plugin set up correctly (the correct settings are important!). In the case where one of these things is not set up correctly, AuthMe authentication can easily be bypassed. This can be a major non-safety and security risk if not known.

## Whitelist {#whitelist-as-protection}
Whitelist *on an offline-mode server* **in no way serves as a form of protection**. It is common for players to try to connect under a whitelisted player name with privileges, which is not a problem without online-mode enabled (this is also done automatically by scanners and bots. It is possible to get the names of players who might have rights even without connecting to the server).

## Offline-mode due to proxy {#proxy}
In case the server is in offline-mode because of [proxy](../proxy.md#proxy), these servers need to be secured. Read more [here](../security/proxy.md#proxy-security).

## Other {#other}
Since an offline-mode server doesn't need an existing Minecraft account to connect, actions like botting the server are much easier.