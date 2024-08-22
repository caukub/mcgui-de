# mcgui-de
An extensive Minecraft Server Handbook (400,000+ characters) which you can read [here](https://mcgui.de).

## Installation
> [!IMPORTANT]  
> You are not allowed to publish the book, see [license](#license).

### Standard
1. Install *mdbook*: https://rust-lang.github.io/mdBook/guide/installation.html
2. Build the book using `mdbook build` command

After performing `mdbook build` command, static content will be generated in `/book/` directory.

### From scratch

1. Install *mdbook*: https://rust-lang.github.io/mdBook/guide/installation.html
2. Install preprocessors
```sh
$ cargo install mdbook-catppuccin && mdbook-catppuccin install
$ cargo install mdbook-alerts && echo "[preprocessor.alerts]" >> book.toml
$ cargo install mdbook-hints && echo "[preprocessor.hints]" >> book.toml
```
3. Copy *hints.css*, *hints.js* (eventually *ko-fi.js*) files from `/theme/` directory in this repository into the mdBook's `/theme/` directory
and update `additional-css` and `additional-js` keys within the `book.toml` as shown below
```diff
[output.html]
-additional-css = ["..."]
+additional-css = ["...", "theme/hints.css"]

-additional-js = ["..."]
+additional-js = ["...", "theme/hints.js"]
```
4. In the `/theme/index.hbs` file, add following lines to the div with *right-buttons* class.
```hbs
{{#if true}}
  <a href="/appendix.html#translations" title="Translations" aria-label="Translations">
    <i id="translation" class="fa fa-language"></i>
  </a>
{{/if}}
``` 
and following lines before the custom JS scripts
```html
<!-- Here -->
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://unpkg.com/tippy.js@6"></script>

<!-- Custom JS scripts -->
```
5. Create `hints.toml` file in your mdBook's root directory (same location where the *book.toml* lives)
6. Build the book using `mdbook build` command

After performing last command, static content will be generated in `/book/` directory.

---

If you want to remove image metadata and convert Typst files (usually diagrams) into images, perform `sh images.sh` command in terminal.
Following tools must be installed:
- rsvg-convert
- ImageMagick
- Typst
- exiftool
## Contributing
More information about contributing can be found [here](/src/appendix.md#contributing).

## License
License can be found [here](/src/appendix.md#license).

