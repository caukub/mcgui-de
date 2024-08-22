# Offline Mode Security {#offline-mode-security}
When the server is in online mode, the server security decreases due to the fact that Minecraft servers do not control the ownership of the accounts of the connected players, and thus any player can connect under any nickname, including nickname of player with privileges. Thefore, it is important to keep it in the mind.

The most reliable form of account protection on a server is by enabling online mode [and not just for security reasons](../general/online-mode.md#offline-mode), as authentication plugins can contain bugs, or ignorance, misunderstanding, or misconfiguration can also play a large role in creating vulnerabilities.

## Authentication plugin {#authentication-plugin}
An authentication plugin, such as [AuthMeReloaded](https://www.spigotmc.org/resources/authmereloaded.6269/), or the modern alternative [LibreLogin](https://modrinth.com/plugin/libre-login), is an absolute must on an offline-mode server.

In the case where no authentication plugin is installed on the server, anyone can join as any player, including a player who has privileges on the server. For this reason, enabling whitelist does not increase the security level in any way, see below.

### Authentication plugin on proxy {#authentication-plugin-proxy}
If you are using an authentication plugin on proxy network, you may need an extra plugin to make it work properly. This is the case with for example AuthMe, where you need to have AuthMeVelocity or AuthMeBungee (do not use AuthMeBridge!) plugin installed and set up correctly (the correct configuration is important!).
In the case where one of these things is not set up correctly, AuthMe authentication can be easily bypassed, which can be a major security risk.

## Whitelist {#whitelist-as-protection}
Whitelist _on an offline-mode server_ *does not serve as a form of protection in any way*. It is common for players to try to connect under a whitelisted player name with privileges, which is not a problem without online-mode enabled (this is also done automatically by scanners and bots. It is possible to get the names of players who might have privileges even without connecting to the server).

## Offline-mode due to proxy {#proxy}
In case the [backend servers](~backend-server) are in offline-mode because of [proxy](../proxy.md#proxy), these servers need to be secured. Learn more [here](proxy.md#proxy-security).

## Other {#other}
Since the offline-mode server doesn't require an existing Minecraft account to connect, things such as botting are much easier.