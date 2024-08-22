# Configuration files {#config}
Configuration files are files used to configure plugins, mods, and the server itself.

## Basics {#config-basics}
Generally, to reflect changes in the server files (such as `server.properties`, `server-icon.png`, or `spigot.yml`), you need to restart the server (restart, not reload!). However, there are exceptions, such as `purpur.yml` or `velocity.toml`, where changes can be loaded without restarting using the `purpur reload` and `velocity reload` commands.

As for plugin configuration files, most plugins have a command to load changes without restart. Read the plugin documentation for more information, for example EssentialsX has an `essentials reload` command. In case the plugin does not have a reload command, restart the server.

**Do not use the `reload` command** or plugins for reloading plugins (such as PlugManX). The explanation why can be found [here](../plugins/reload.md#reload).

## Searching in configuration files {#config-search}
If you don't know where to find a some thing in the configuration, don't ask for a specific line. Listing lines is bad, as they may vary depending on the plugin version and the user's specific configuration. The lines are irrelevant from the plugin's (program) point of view.

In the case where you are looking for specific text in the configuration, you can enable text search in basically all applications using the *Ctrl + F* shortcut.

In the case where you are looking for a particular thing but don't know what it's specifically called, search by keywords.

If you're looking for specific continuous text, watch out for [color-codes](#color-codes). If you were to search for "server skyblock is full" in a configuration file with the following content, you would not find anything in the file
```txt
Server &lSkyBlock is full
```
The same goes for variables.
```txt
Server %gamemode% is full
```

## Configuration file resets {#config-reset}
Configuration files are reset in two cases in particular:

1. the configuration file was modified while the server was running.

In some cases, a config may reset if it is manually modified while the server is running. This happens for example with BungeeCord or Multiverse-Core config. However, this is not standard. In this case, the config must be modified while the server is shut down, or a command must be used to modify the values in the config if such a command exists (e.g. `mv config prefixchat false` for Multiverse-Core)

2. The file is not valid

Each configuration format has its own rules that must be followed. Otherwise, the file is not valid. If these rules are violated, the configuration file may be reset to the default or backup state.

If you don't know where the error is in the file, check for validity via [validator](#config-validator) before saving, and save the file only when you are sure it is valid.

## Types {#config-type-mismatch}
When a program (server, plugin) reads a configuration file, it expects the value to have a certain type. If a type other than what the program expects is used (for example, a text is provided instead of a number), an error occurs. This happens, for example, when you use a text for a value that expects a number.

A specific example of such an error would be, for example, if you switched from a newer version of Paper to a version that does not yet support the `default` value in the configuration. In this case, the server will crash because the fields that expects a number has value of `default`.

- Text (String)

A *String* is, in simplified terms, a text.

```yaml
chatrequireslogin: "Chat Requires Login"
```

- Number (Integer)

An *Integer* is, simply put, an integer.

```yaml
max-players: 20
```

- Decimal Number (Double/Float)

The type *double* and *float* is, simply put, a decimal number.

```yaml
spawn-location:
  x: 2.5
  y: 50
  z: 2.5
```

For decimal numbers, you can usually write an integer (and vice versa), as shown for `y`. The value will be converted to decimal type automatically. The same is true for booleans, for example - the text *"true "* will be automatically converted to a boolean type value (not necessarily, but almost always it works). However, if a text such as `hello` is used, even though a number is expected, an error will occur, because the program is unable to correctly convert the type (text - String) to the expected type (number - Integer).

- boolean

The value of type *boolean* can be either `true` or `false`. That can be, depending on the context, represented as true/false, yes/no, or on/off.

```yaml
send-position: true
```

- List (Array)

List (Array) contains a list of certain values. In the Y(A)ML format, it can be written multiple ways. Usually it's:

```yaml
player-list: ["Notch", "Cake"]
```

and

```yaml
player-list:
- "Notch"
- "Cake"
```

These notations are identical.

### ︌{#list-string-type-mismatch}

In the case where the server/plugin expects to read a list (Array) type, it is necessary for that type to remain a list, that is, if the original value looks like this:

```yaml
player-list: ["Notch", "Cake"]
```

you cannot set a text (String) as a value, even if there is only one value in the list. In this case below, an error would occur because the plugin expects a list but get a text.

```yaml
player-list: "Notch"
```

This can be easily fixed by setting the value back to the list type.

```yaml
player-list: ["Notch"]
```

An empty list value looks like this:

```yaml
player-list: []
```

## Comments {#config-comment}
A comment in a configuration file is text that will be ignored when parsing the file. For example, a comment in Y(A)ML format starts with the `#` character.

Simply put, this means that the program (server, plugin) ignores the text after `#`, and therefore has no effect on the settings.

```yaml
delay: 500 # in milliseconds <- note
# delay: "500" here the whole line is commented out, so it is the same as if the line was not in the file
```

But of course the `#` character can be used in text values without any problem, e.g.

```yaml
content: "Position: #1"
```

## Formats {#config-format}
Each configuration file has its own format, and each format has its own rules. If these rules are not respected, the format is not valid. Most often, the plugin or part of it will not work, or the server may shut down/crash, especially if error occurs in server files (e.g. `spigot.yml`).

### YML/YAML {#yaml}
YML is the most widely used configuration file format for plugins.

For example, a Y(A)ML file might look like this:

```yaml
server_connect_timeout: 5000
remote_ping_cache: -1
player_limit: -1
permissions:
  default:
  - bungeecord.command.server
  - bungeecord.command.list
timeout: 30000
log_commands: false
network_compression_threshold: 256
online_mode: true
```

#### Y(A)ML Rules {#config-format-yaml}
As mentioned above, each configuration format has its own rules that must be followed. If these rules are broken, the file is not valid and the result can range from a broken part of the plugin to a broken plugin or a server (server crashes).

For indentation, either 2 or 4 spaces are used by default. In YML format, indentation must be respected, i.e. each key in subsection must be as far from the edge as all other keys in that section, i.e. the first example is not valid YML, but the second is.

```yaml
key: "value"
colors:
  red: "#ff0000"
   blue: "#0000ff"
  green: "#00ff00"
```

```yaml
key: "value"
colors:
  red: "#ff0000"
  blue: "#0000ff"
  green: "#00ff00"
```

Tab character cannot be used for indentation, only space (some editors like VSCode automatically replace tab with spaces). Also, key names (in the same section) cannot exist multiple times.

Below are examples of other common mistakes when using the Y(A)ML format.

#### Examples of common mistakes {#common-yaml-mistakes}
This section provides examples of the most common errors in the YML format. Other errors include type mismatch, which is explained [here](#list-string-type-mismatch).

```yaml
servers:
  survival:
    address: guardian.myhost.com:59700
    motd: Just another Bungee server
    restricted: false
  lobby: guardian.myhost.com:59700
  skyblock:
    address: bat.myhost.com:36830
    motd: Just another Bungee server
    restricted: false
```

In this example, the YML format itself is not invalid, but the program will not be able to read the configuration file (specifically the `lobby` server in the `servers` section) correctly, since the value of `lobby` is the text `guardian.myhost.com:59700`, and `lobby` is supposed to be a section only, so this text is supposed to be at the `address` field in the `lobby` section, as it is shown in other servers.

```yaml
ping_passthrough: false
server_name:Shadowmc
pvp: false
```

In this example, the YML format is not valid because there is no space between the `priorities` field and its value.

```yaml
Lobby:
  address: "localhost:25565"
  address: "localhost:25566"
```

In this example, the YML format is not valid because it contains duplicate keys.

```yaml
content: '&c&lPlayers with the most kill's'
```

###### ︌{#yaml-escape}
In this example, the YML format is not valid due to a single parenthesis in the text. This can be fixed by either using two single quotes instead of one (which is called escaping):

```yaml
content: '&c&lPlayers with the most kill's'
```

or by replacing single quotes with regular quotes:

```yaml
content:"&c&lPlayers with the most kill's"
```

```yaml
colors:
  red: "#ff0000"
   blue: "##0000ff"
  green: "#00ff00"
```

In this example, the YML is not valid due to bad indentation of *blue*. It must be indented the same way the *red* and *green* is.s

```yaml
spawn-limits:
		monsters: 70
```

Although no error may be visible at first glance, the YAML is not valid due to the use of the indentation tab. A valid Y(A)ML cannot use tabs for indentation, only spaces!

```yaml
boss-bar: <rainbow>&lPINATA: '%hit%HIT%S% LEFT
```

YML is not valid here. If the text contains special characters, it is a good idea to wrap the text in quotes (but be careful if the text already contains a quote and you want to use the same type of quotes to wrap it, see [here](#yaml-escape)).

### JSON {#json}
JSON is another common format. While JSON is not a format intended for configuration files (although some use it that way), you may need to edit the JSON file manually (e.g.
`whitelist.json`).

The content of a valid empty JSON file looks like this: `[]`. **A blank file is not a valid JSON file!**

For example, a JSON file might look like this:

```json
{"dog": "woof", "cat": "meow", "list":[1, 2, 3, 4], "people":[{"name": "josh", "age": 22}, {"name": "andrea", "age": 23}]}
```

Since larger JSON files may be harder to read, a tool like [JSON Viewer/Editor](#config-viewer) may be useful.

### Other formats {#config-other-formats}
There are a number of other formats, such as *properties*, *TOML*, and *HOCON*. However, this should not be a problem, as the basic principles are the same across formats, and only the notation differs slightly (which you will get to after a while of using the format)

## Message formats/formatting {#config-formats}
In the configuration files, messages can be formatted in different ways.

### MiniMessage {#minimessage}
MiniMessage is a modern standard that the vast majority of updated plugins support. You can read more about it here:
<https://docs.advntr.dev/minimessage/format.html>

To easily preview MiniMessage messages, you can use the
<https://docs.advntr.dev/minimessage/format.html>

### Color codes {#color-codes}
Before the MiniMessage format was created, virtually the only way to color a message was with color codes, using the `&` character (or `§` for some plugins/server configuration files) - `&4&lThis text is dark red and thick. &0This part is black.`

The list of color codes can be found here:
<https://minecraft.fandom.com/wiki/Formatting_codes>

Warning! If you combine multiple codes, the color comes first, so the correct use is `&4&l` instead of `&l&4`. If the first would be '&l' (code for bold text), the text will not be bold.

### RGB/HEX and gradient {#rgb}
RGB/HEX colors can be used from version 1.16 onwards. Players running an older version of the client (being able to connect thanks to ViaVersion) will not see HEX colors, even if the server is running a version that supports HEX colors.

To create a gradient, the MiniMessage format directly supports it - <https://docs.advntr.dev/minimessage/format.html#gradient>

If you can't use it, the following tool can be used - <https://www.birdflop.com/resources/rgb/>

### New line {#new-line}
If the server/plugin doesn't allow creating multiple lines using a list, you can often use the `\n` symbol, for example

```yaml
# spigot.yml
messages:
  restart: "Server is restarting\nTry reconnecting in a minute"
```

## Tools {#config-tools}
### Validators {#config-validator}
A validator is a tool that is used to check the validity of a particular format. In the case where the format is not valid, the validator prints the line on which the error occurred. The number of that line may not be the line directly causing the problem, however if it is not, it will probably be very close to it.

For example, you can find the YAML validator at the following link: <https://jsonformatter.org/yaml-validator>

There are many such validators for different formats, but for Y(A)ML I personally recommend this particular one, as some other validators may not show some errors at a glance (e.g. duplicate keys).

### Viewer/Editor {#config-viewer}
Viewer is a tool that is used to display the contents of a file more clearly. This can be especially useful for large and less readable files (especially JSON ones). An editor is a tool that allows easier editing of such files. Although it is mostly unnecessary for such a purpose on Minecraft servers, it can still be used as a viewer.

Examples of such tools include [this YAML viewer](https://jsonformatter.org/yaml-viewer#Sample) and [this JSON viewer](https://jsonformatter.org/json-viewer#Sample).

### Formatter/Prettier/Beautify {#config-prettier}
When you search for "\<format\> formatter" (sometimes called prettier/beautify) in your browser, you will find many online tools that can format your text into a more readable form, e.g. from

```json
{"dog": "woof", "cat": "meow", "list":[1, 2, 3, 4], "people":[{"name": "josh", "age": 22}, {"name": "andrea", "age": 23}]}
```

you get

```json
{
    "dog": "woof",
    "cat": "meow",
    "list": [
        1,
        2,
        3,
        4
    ],
    "people": [
        {
            "name": "josh",
            "age": 22
        },
        {
            "name": "andrea",
            "age": 23
        }
    ]
}
```

### Converter {#config-converter}
If you need to convert one format to another for some reason, you can find tools for this purpose for basically any widely used formats (e.g. <https://jsonformatter.org/yaml-to-json#Sample>).

## Dot notation {#dot-notation}
Dot notation in configuration files refers to notation where a dot indicates a transition to a "subsection", so for example the `entities.spawning.monster-spawn-max-light-level` notation indicates following field:

```yaml
entities:
  spawning:
    monster-spawn-max-light-level: <value>
```

## Other {#other}
The file extension does not necessarily match the file format. For example, Dynmap config is in YML format, even though the configuration file is named `configuration.txt`.

## Terminology {#terminology}
The term `config` is used to refer to both the `config.yml` file and any configuration file. What is meant by "config" always depends on the context.