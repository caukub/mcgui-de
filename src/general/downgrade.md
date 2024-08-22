# Downgrade {#downgrade}
Downgrading a server means moving from a higher Minecraft version to a lower one (e.g. from 1.20.4 to 1.20.1).

This action is not supported on Spigot/Paper servers and its forks. In order to revert to the old version, worlds loaded on the newer version must be [deleted](world.md#world-deletion). However, you may encounter other problems (for example, unsupported values in configuration files).

So think carefully about upgrading your server! Upgrading the server (without deleting worlds) is practically irreversible.

Although you may be able to downgrade between certain versions, you may still encounter problems that are not visible at first glance. Therefore the moment you upgrade a server, you can't get to a lower version without deleting worlds, or at least you shouldn't.

Using the [Java flag](../administration/java.md#java-flags) `-DPaper.ignoreWorldDataVersion=true` can be used on Paper (and its [forks](platforms.md#forks)) to disable the automatic shutdown of the server when running a newer world on an older version, but it is generally not recommended, because you have no certainty that the world will not be corrupted (for subversions, e.g. switching from 1.20.6 to 1.20.5 may not be a problem, but you have no certainty. For major downgrades it will almost certainly be a problem (some generated blocks etc. will not exist in the older version, it's possible the world may be straight up corrupted too)).