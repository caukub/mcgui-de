# Seed Cracking {#seed-cracking}
## Basics {#basics}
Seed cracking is a technique to discover a Minecraft world's "seed". Knowing the seed allows predicting biome and structure generation, giving a significant advantage. It can also be used to determine ore locations, potentially bypassing anti-xray measures.

## Preventing Seed Cracking {#prevent-seed-cracking}
### Changing Structure Seeds {#structure-seeds}
1. Open `spigot.yml` in your server folder.
2. Locate the section with preset structure seeds (e.g., `seed-village`, `seed-desert`).
3. Change values to numbers between 1 and 2147483647.

![Structure Seeds](/assets/images/resources/structure-seeds.png)

### World Generation Datapacks and Plugins {#world-gen-plugins}
Modifying world generation complicates seed cracking:
1. Download suitable datapacks or plugins.
2. Place in `/world/datapacks` or `/plugins/`.
3. Restart the server.

Some popular world generation plugins are [Iris](https://github.com/VolmitSoftware/Iris), [Terra](https://modrinth.com/plugin/terra) and [TerraformGenerator](https://www.spigotmc.org/resources/terraformgenerator-1-18-2-1-21.75132/)

## Effectiveness {#effectiveness}
No solution is 100% effective, but combining these methods significantly hinders seed cracking attempts.