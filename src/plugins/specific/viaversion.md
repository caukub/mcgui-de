# ViaVersion Plugin {#viaversion}
ViaVersion (and its addon plugins ViaBackwards and ViaRewind) is a plugin that allows connections from a different version of Minecraft than the server version.

Using the following tool, you can easily find out which addon (ViaBackwards/ViaRewind) you need and how to block other versions (if any): <https://jo0001.github.io/ViaSetup/index.html?lang=en>

Ideally, it is generally recommended to use ViaVersion only when new Minecraft version is released and you are "stuck" (because you don't want to update yet due to experimental builds, plugins are not updated yet, ...) but you want to support players on the new versions.

It's important to note that supporting other versions adds compatibility to the players only. Nothing changes from the server side. Therefore, for example, if a plugin is not working and someone asks what your server version is, don't answer something like "1.16 to 1.20", only the "default" server version matter.

## Old players on new versions {#old-players-new-version}
Due to the change in world height for new versions, players with version 1.16 and older see the world bugged from a certain Y level. How to solve this can be found at the following link: <https://gist.github.com/Jo0001/4fe96cf5a78c8a00560ea985f3b9eb22>

However, it is generally *not* recommended to support versions that old as it will probably be counterproductive.

## Allow specific versions to connect {#blocked-versions}
If you want to block players from connecting with a particular version, you can do so simply by using the tool mentioned in the introduction or by setting `blocked-versions` or `blocked-protocols` in the config, which you can generate using this tool: <https://via.krusic22.com>