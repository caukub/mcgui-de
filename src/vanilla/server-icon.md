# Server icon {#server-icon}
The icon must meet the following requirements:

- size of 64x64 pixels
- file name *server_icon*
- format (and extension) *png*

If the icon does not meet the required size, the online "resize" tools can be used to adjust the icon size.

Thus, the resulting icon must be a 64x64 px *server-icon.png* file. If the icon does not meet one of the requirements, the icon will not appear in the server list.

**After the icon is uploaded, the server must be restarted for the changes to take effect.**

## Icon not working {#server-icon-doesnt-work}
The icon does not display correctly in the following cases:

- The icon does not meet the above requirements

Make sure the icon meets all of the above requirements, including that the resulting file is not named *server-icon.png.png* (due to disabled file extensions on the *Windows*, see [here](../other/desktop.md#file-extensions)).

- Cache

The client may have information about the old/non-functional icon temporarily cached. In this case, the icon will be displayed correctly on <https://mcsrvstat.us/>, but not in the client. If you see the icon correctly on <https://mcsrvstat.us/> but not in the client, you usually just need to restart the client.

- The file is not valid *PNG*

If you originally had the icon in a different format, such as *JPEG*, and you "converted" the icon to *PNG* by overwriting the extension, the icon is not a valid *PNG* file. To convert another format to *PNG*, you need to use a converter (there are many online converters available on the internet).

- Plugin

Some plugins can affect the icon settings, and thus the vanilla icon will not work (usually [MOTD](motd.md#motd) plugins have this feature, which should be disableable in the plugin configuration).