# Bans {#bans}
*Ban* means denying the player access to the server. On the other hand, *unban* means to cancel the restriction (cancelling the ban). Either the Minecraft account or the IP address can be banned. Bans are by default (= when not using any ban plugin/mod) stored in the `banned-players.json` and `banned-ips.json` files.

## Ban plugins {#ban-plugin}
If you need more sophisticated punishment system, you can use a plugin. Personally, I recommend [LibertyBans](https://www.spigotmc.org/resources/libertybans.81063/). If you would like to use the AdvancedBan plugin, you should avoid it. The plugin is no longer under active development and contains bugs.

## Commands {#ban-commands}
The vanilla command to cancel a ban is `pardon`, not *unban*. The `unban` command is provided by plugins or mods.

- `ban <nick> [reason]` - bans a player from the server
- `ban-ip <ip address> [reason]` - bans the IP address from the server
- `pardon <nick>` - unbans the player account (cancels the punishment)
- `pardon-ip <ip address>` - unbans the IP address

## Ban types {#ban-types}
The Minecraft server allows you to ban a user in two ways:

1. Banning the account
2. Banning an IP address

Please keep in mand that both types of ban can be bypassed quite easily.

## Ban evading {#ban-evading}
If the server is in [offline-mode](../general/online-mode.md#online-mode), to bypass the account ban, the player just needs to change the nickname, as a new nickname is a new account for a Minecraft server in offline mode. However, even if the server is in [online-mode](../general/online-mode.md#online-mode), one can have many original accounts, since alt accounts can be purchased in large quantities for a fraction of the official price.

One can easily change the IP address by using a hotspot, proxy or VPN, connecting from another internet network, or some users have dynamic IP address, which means that their IP address changes over time.

There are plugins (or system-level programs) that block VPN services (or players connecting from certain regions (typically countries) other than the allowed ones, which can be especially helpful for some smaller European countries, as most free VPN services do not allow connections from these countries), but no such solution is 100%.
Most public anti-VPN services should be able to detect a VPN connection from public VPN services easily with such a solution; however, in other cases (e.g. a private VPN server), it may not be as simple. That said, it could or could not, depending on the specific IP address and configuration of the "protection". The stricter the "protection" configuration, the greater the chance of blocking legitimate users. At the same time, some users use VPNs regularly, even though they are not trying to bypass a ban.

Also keep in mind that multiple different people may have the same IP address. It may not just be multiple people in the same household. ISPs often assign a single IP address to larger areas (there is limited number of IP addresses), so thousands of people share same IP address.

In general, therefore, whoever really wants to can get around the ban, and so it is often unnecessary to invest too much time and energy in a solution that will "ban" the user at any cost, because in principle this is not possible.