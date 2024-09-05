## How to create a .zip file {#zip-creation}
*.zip* is an archive file format that allows you to compress multiple files and/or folders into a single file. This file can then be extracted (unzipped).

Do not create *.rar* format files! Unlike *.zip*, this format is not widely supported and for example some web file managers, cannot extract it!

### Windows {#zip-creation-windows}
On a Windows operating system, you can create a *.zip* archive as follows:

1. Select the file(s) and possibly the folder(s) you want to compress (zip)
2. Right-click on the folder/file to zip it.
3. Click *Send*
4. Click *Compressed (zipped) folder*

### macOS/OS X {#zip-creation-macos}
On macOS, you can create a *.zip* archive simply by right-clicking on the file and then clicking *Compress*.

## File extensions and the file icon does not indicate the file extension {#file-extensions}
Windows does not display file extensions by default, so you need to right-click on the file and select *Properties* to see the extension. Since some users do not realize that the file already has an extension, when instructed to name the file, they create a "double extension", e.g. `server-icon.png.png`. Showing extensions is also better in terms of easier navigation, as you automatically see the file extension immediately.

You can enable extension display in File Explorer, as shown in the image below.

![image showing how to disable file extensions on windows](/assets/images/other/windows-file-extensions.png)

It is also important to note that the file icon does not indicate the file extension. Just because a file has a WinRAR icon does not mean that it is a *.rar* file. Even a *zip* file can (and probably will) have a WinRAR icon when WinRAR is installed. It just means that WinRAR is an application intended to open that type of file.

## Spaces in directory names in command line {#spaces-in-path}
If a file path contains a space (e.g. on Windows the 'Program Files' directory), it needs to be enclosed in quotes.

A proper command might look like this, for example:

```sh
"C:\Program Files\Java\jdk-21\bin\java.exe" -Xmx4G -Xms4G -jar paper.jar nogui
```

Otherwise an error such as following will occur
`'C:\Program is not recognized as an internal or external command.'`.