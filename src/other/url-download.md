# Downloading a file from URL {#download-from-url}
On a server managed by you (VPS/dedicated server), or in some administration panels in the file manager, you can download a file from a URL. This can be especially useful for users with slow internet, because instead of having to download the file to your computer and then upload it to the server via FTP/web file manager, the file is downloaded directly by the server itself, which typically has high download speed.

## Getting a direct link (address) of a file {#how-to-get-direct-link}
In order to download a file from a URL, you must have a direct link to that file. To get this link, start downloading the file in your browser and right-click on the file in the downling/downloaded files and click something like *Copy Download Link*.

<!-- ![Copy Download Link URL](/assets/images/other/url-download-1.png) -->
![Copy Download Link URL](/assets/images/other/url-download-2.png)

Often you can get the direct address of a file without even starting the download by copying the link that opens when you click download button/link, after which the file *instantly* *automatically* starts downloading (which is not the case with CurseForge, for example, where you need to wait after you click the *Download* button), see image below

![Hover Link Preview](/assets/images/other/modrinth-download.png)

If there is a filename with its expected extension at the end of the link address (bottom left of the image), it is usually a direct link to the file (but it's not *always* the case).

If you want to be sure of the correctness of the link, simply start downloading the file and copy the address of the downloaded/uploaded file as described at the beginning.

## How to download a file from a URL via the command line {#file-url-download-terminal}
On a machine that you manage, and therefore have access to the command line, you can use the command to download a file from a URL. On Linux/macOS, the *wget* or *curl* command is usually used. Both of these commands will download a file with name `icon.png` from a given URL:

```sh
$ curl -o icon.png https://url.com/file-32.png
$ wget -O icon.png https://url.com/file-32.png
```