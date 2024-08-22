# Anticheat {#anticheat}
## Basics {#basics}
As you can probably tell from the name, anticheat is plugin that detect cheats.

No anticheat is perfect. Every anticheat did have, have, and will have [bypasses](#anticheat-bypass) and [false positives](#false-positives).

## Best anticheat plugin? {#anticheat-choice}
There are many anticheats, but not so many "seasoned" ones. The most used free anticheats currently include [NoCheatPlus Updated](https://github.com/Updated-NoCheatPlus/NoCheatPlus) and [GrimAC](https://www.spigotmc.org/resources/grim-anticheat.99923/), while the paid ones include [Vulcan](https://www.spigotmc.org/resources/vulcan-anti-cheat-advanced-cheat-detection-1-7-1-21.83626/) and [Spartan](https://www.spigotmc.org/resources/spartan-anti-cheat-advanced-cheat-hack-detection-1-7-1-21.25638/).

I will not personally recommend any of the anticheats (although I think one is generally the ideal choice for most classic servers (not necessarily one of the above)). Make your own research, but I think you should consider the following: every server has different requirements for anticheat. I think it makes a big difference if you want an anticheat for a PVP server or a classic survival server. For example, in my opinion (you can disagree) on a classic survival server you want to cover as many cheaters as possible with as many cheats as possible. Do you want to have an anticheat with "precision checks" when I lose other checks, which another anticheat with less precision checks provide? Why do I even need precision checks on a classic survival server? How many players have their cheats set at such values that a "precision checks" detects it, but a standard one doesn't? Does it bother me if the anticheat doesn't detect such a player? On the PVP server, on the other hand, it's a different story. Some anticheats support detection of bedrock players and some don't. These are all things to consider.

But for the needs of most servers, all of the most commonly used anticheats will be sufficient and won't outright make a mistake no matter which of the "seasoned" anticheats you choose.

## Bypass {#bypass}
Bypass indicates a cheat usage for which the anticheat has [checks](#anticheat-check) but is not detected by it.

## False positives {#false-positives}
"False positives" denotes a situation where anticheat detects a cheat (["check is failed"](#anticheat-check)) on a player, even no cheat was used. There can be many reasons for this - for example, a bad configuration, a conflict with another plugin, or certain cheats may not work properly in certain situations, such as when the player has a high ping.

When anticheat detects a cheat, it does not necessarily mean that it has been used.

## What are checks {#check}
Check indicates what cheats the anticheat checks for. Such a check is usually marked with the name of the cheat and a letter. Different cheats are implemented in different ways, so anticheat must detect these different ways. The way in which the cheat is detected is distinguished by these letters. For example, an autoclicker "A" may indicate the detection of an unrealistic amount of CPS (e.g. 50). Autoclicker check "B" may detect that a player clicks consistently at exactly the same frequency.

```
- Aim: A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
- Auto Block: A, B, C
- Auto Clicker: A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
```

When a player check fails, it means that the anticheat thinks that the player has used this cheat. When a check fails, an alert usually appears in chat for players with [permissions](../general/permissions.md#permissions), which is a message informing them that the check has failed:

```
<Notch failed> [Jesus](Type: A) (VL: 30)
```

## Client brand {#client-brand}
The "client brand" information (the platform (and version) of the client the player is using, e.g. Vanilla, Fabric, Forge) is sent by the client itself, so if the cheat client says it is running on Vanilla, the client brand will be Vanilla. For this reason, the client brand cannot be trusted.

## Anti-Xray {#antixray}
The best protection against x-ray is the built-in Paper Anti-Xray feature which can be used on Paper and its forks. You can read more about it at the following link: <https://docs.papermc.io/paper/anti-xray>

### Can be Anti-Xray bypassed? {#antixray-bypass}
This part is a taken from the following article by *EterNity*: <https://www.paper-chan.moe/paper-optimization/#Anti-Xray>

"Without going into too many technical details, with enough effort, people may still be able to bypass the anti-xray feature due to how the Minecraft client processes the information around a player. It is still possible to bypass the anti-xray measures provided above.

Alternative Methods to prevent xrays

Method 1 - RayTraceAntiXray Plugin

If you have spare CPU threads available on your server, consider stonar96's RayTraceAntiXray addon. It provides unpassable solution with additional resource usage.

Method 2 - Manual staff audit

By combining the usage of OreAnnouncer and the preview feature from CoreProtect, staff members can audit a player's mining tunnel and easily determine if they are cheating or not (by looking for signs of unusual tunnel layouts and checking if the ores were visible to them). This method, although manual, is 100% effective and requires zero additional resources. It is likely the ideal solution for small or friendly servers.

How to Manual Audit

Step 1: Be notified by OreAnnouncer about unusual amount of ores mined.

Step 2: Teleport to the coordinates of player mining tunnel.

Step 3: Run CoreProtect commend such as `/co rollback action:-block exclude:stone,deepslate,dirt,gravel,andesite,diorite,granite radius:8 time:24h #preview`

If you notice the suspect digging toward ores without a line of sight, it is a strong indication that the player is using x-ray."