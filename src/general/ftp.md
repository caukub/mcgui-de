# FTP/SFTP {#ftp}
(S)FTP is a protocol that allows the transfer of files between two remote computers. The server files can be accessed without logging into the admin (web)panel. This option is therefore suitable when the server files cannot be accessed via the admin panel or the admin panel interface has certain limitations. Some people prefer FTP for the convenience of being able to edit files in any editor installed on their computer.

## Connecting to (S)FTP {#connect}
An FTP client is required to connect to (S)FTP. The most commonly used are WinSCP and FileZilla.

Once you open the FTP client, simply enter the login credentials provided by your service provider.

In case you want to connect via FTP client to a server managed by you (VPS/dedicated server), the easiest solution is to use SFTP, where you just need to enter your SSH credentials (since SFTP runs over SSH).
Another option is to create your own FTP server. There are many tutorials on how to do so on the internet.

## Other {#other}
WinSCP has a feature to calculate the size of a directory. This can be used especially when you need to find out what is taking up a lot of disk space and you don't have access more suitable tools.

FTP clients usually allow you to set up your own file editor. Commonly used editors include [Notepad++](https://notepad-plus-plus.org/) (Windows only), [Sublime Text](https://www.sublimetext.com/), or [VSCodium](https://vscodium.com/). If using the built-in WinSCP editor, make sure that the character encoding is set to `UTF-8`. Otherwise, special characters and diacritics will be broken.

If you can extract (unzip) the files (e.g. in the administration panel), if you are uploading a folder with a large number of files, it is advisable to *zip* the files, upload the *.zip* file and then extract, as uploading a large number of files can take noticeably longer (at the same time, if you have slow internet, it may be faster due to compression) than uploading single file.