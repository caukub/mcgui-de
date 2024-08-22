# Online mode (/offline mode) {#online-mode}
Online mode determines whether the server verify connection against the database of official Minecraft accounts. In practice, this means that only players with the original Minecraft can connect when online mode is enabled, otherwise "cracked" players can also connect. If online mode is disabled (referred to as "offline mode", "cracked" or "warez"), many things follow from this, including risks - see below.

Whether online mode is enabled is determined by the value of `online-mode` in `server.properties`.

## Offline mode and its implications {#offline-mode}
The most serious consequence of offline mode is a decrease of server security. Due to the disabling of online-mode, any player can connect as anyone, including the administrator. Read more [here](../security/offline-mode.md#offline-mode-security).

At the same time, many communities and individuals don't tolerate offline-mode servers, so many people will automatically refuse to help you. For many people, the only tolerated use of offline-mode is as a proxy (where [backend-servers](~backend-server) must be in offline-mode; but of course only if the proxy server is in online-mode, so "cracked" players can't connect), or as a test server where you need multiple/different accounts to test a particular thing.

Also on an offline-mode server, skins are broken. This can be solved with a mod or plugin like [SkinsRestorer](https://skinsrestorer.net/).

Another consequence of offline-mode is that the players doesn't need to have a Minecraft account to join, and can create (= change the name) as many accounts as they want. This makes it easier to bypass bans, perform bot attacks, etc. Servers with offline-mode also usually have a "worse" community.

For large projects, the [EULA](../vanilla/eula.md#eula) can be an problem.

At the same time, players with original Minecraft will lose data when they change their name (which autologin for original accounts, provided by plugins like LibreLogin or FastLogin, solves)

## Data loss when changing online-mode settings {#online-mode-change-data-loss}
In the case where the `online-mode` setting is changed, the player's data is "lost" (the data still exists, but is not associated with the player in any way anymore). Therefore, the `online-mode` setting should be set at the start of the server and not changed afterwards.

This is caused by [changing the UUID](../other/deving-tools.md#uuid-generation). For Vanilla (i.e. "non-plugin") data, this can be solved by renaming the data files from `<old uuid>.ext` to `<new uuid>.ext` (there are some unofficial tools that will do this automatically). This data is located in folders located in the [main world](world.md#main-world) directory, i.e. `/world/playerdata/<uuid>.dat` for standard data like inventories, player locations, etc., `/world/advancements/<uid>.json` for advancements, or `/world/stats/<uid>.json` for stats.

Edit these files only when the server is not running!

You can get the online UUID of a player using a tool like <https://namemc.com> and the offline UUID using a tool like <https://minecraft-serverlist.com/tools/offline-uuid> (case sensitive).