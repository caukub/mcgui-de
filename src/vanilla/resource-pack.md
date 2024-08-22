# Server resourcepack {#resourcepack}
The server resourcepack can be set by setting the value of `resource-pack` in [*server.properties*](server-properties.md#server-properties) to [direct link (address) of the file](../other/url-download.md#direct-download-link) where the resource pack is located (or possibly by a plugin).

You can use website like <https://mc-packs.net/>, DropBox or MediaFire to upload the pack to be downloadable. Remember you have to always set the [direct link (address)](../other/url-download.md#direct-download-link) of the file (pack).

## Other settings {#other-settings}
- `resource-pack-prompt` - adds a custom message to be displayed when prompted to download the resource pack
- `require-resource-pack` - if set to `true`, the player will be disconnected from the server if the server resource pack is refused (can be bypassed with unofficial Minecraft client)
- `resource-pack-sha1` - SHA1 hash of the resource pack used to verify its integrity

## Limits {#resourcepack-limits}
The size of the server resource pack is limited depending on the version to the following sizes:

| Version        | Max Size |
|----------------|----------|
| > 1.18         | 250 MiB  |
| 1.15 to 1.17.1 | 100 MiB  |
| < 1.15         | 50 MiB   |

## Resource pack vs texture pack {#resourcepack-vs-texturepack}
"Resource pack" and "texture pack" generally mean the same thing. Even if something is described as "texture pack", use it the same way you would use a resourcepack.
<!-- difference -->

## Notes {#notes}
If an error occurs, the client logs the error, not the server.