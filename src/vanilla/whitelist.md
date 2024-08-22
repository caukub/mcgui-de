# Whitelist {#whitelist}
Whitelist is a feature that only allows players who are added to the whitelist to join.

Whether the whitelist is enabled is determined by the value of `whitelist` in `server.properties` (it is disabled by default). This value can be changed at runtime with the `whitelist on` (turns whitelist on) and `whitelist off` (turns whitelist off) commands.

## Basic commands {#commands}
- `whitelist on` - turns whitelist on
- `whitelist off` - turns whitelist off
- `whitelist add <nick>` - adds a player to the whitelist
- `whitelist remove <nick>` - removes a player from the whitelist

## Other commands {#other-commands}
- `whitelist list` - displays the list of players on the whitelist
- `whitelist reload` - reloads the whitelist (reloads changes after manually editing the `whitelist.json` file without restarting the server)

## Whitelist on server with offline mode {#offline-mode}
### Whitelist as protection {#offline-mode-protection}
Whitelist on offline-mode servers in no way serves as a form of protection, see [here](../security/offline-mode.md#whitelist-as-protection).

### Whitelist problem on offline mode servers {#offline-mode-problem}
If the server is running in offline mode, it may happen that even after adding a player to the whitelist the player will not be able to connect. This occurs if the player has never connected to the server before (or if they have but their data has been deleted), and if the player is connecting with a name for which an original account exists.

#### Cause {#offline-mode-problem-cause}
Adding players to the whitelist works as follows:

If a player has ever joined the server before, the name and UUID they played with is added to the whitelist. However, if the player has never joined the server, and the player has a name that original account has (case-insensitive), the online UUID is added to the whitelist. However, the player connects with the offline UUID since the server is in offline mode. When the whitelist is on, in order for the player to connect, the UUID from the whitelist must match the player's UUID, which does not happen as the offline and online UUIDs are different.

#### Solution {#offline-mode-problem-solution}
I.

The first solution is to manually edit the UUID, the procedure looks like this:

1. Add the player to the whitelist with the command `whitelist add <nick>`.
2. Generate an offline UUID. You can do this e.g. [here](https://minecraft-serverlist.com/tools/offline-uuid)
3. Replace the player's UUID in the `whitelist.json` file with the generated UUID from the previous step
4. Apply the changes using the `whitelist reload` command

II.

The second solution is to turn the whitelist off with `whitelist off` command, wait for the player to connect, add him to the whitelist with `whitelist add <nick>`, and then turn the whitelist back on with `whitelist on` command.

III.

The third, ideal, least annoying solution is to disable the Vanilla whitelist (with `whitelist off`) and use a plugin or mod such as EasyWhitelist that only works with names instead of UUIDs.

## Other details {#other}
The list of players on the whitelist is stored in a `whitelist.json` file, which is in [JSON](../general/configs.md#json) format. It contains the player name and their UUID:

```json
[
  {
    "uuid": "b50ad385-829d-3141-a216-7e7d7539ba7f",
    "name": "Notch"
  },
  {
    "uuid": "a762f560-4fce-3236-812a-b80efff0b62b",
    "name": "jeb_"
  }
]
```

## Notes {#notes}
- Players with OP can connect to the server even if they are not on the whitelist (does not apply for Bedrock edition)
- In Bedrock edition 1.18.10 the whitelist has been renamed to `allowlist`