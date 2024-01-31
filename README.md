<p align="center">
    <img src="https://fonts.nhat.io/icon.png" width="128"/><br/>
    <a href="https://fonts.nhat.io"><b>Ligaturized Fonts</b></a><br/><br/>
    A collection of ligaturized fonts for use in code editors and IDEs.
</p>
<br/>

![image](https://github.com/nhatthm/ligaturizer/assets/1154587/c635112d-947f-4f4a-95b4-7abf559c4f96)

## Install

- Find the list of available fonts, visit [fonts.nhat.io](https://fonts.nhat.io)
- Click on the download link to download the font.
- Extract the archive and install the font.

On Windows:
- Select the fonts you want to install. You can click to select one font, Control-click to select several fonts, or Shift-click to select a contiguous group of fonts.
- Right-click the selected fonts and choose `Install`.

On Mac:
- Before installing your fonts, quit all active applications.
- Copy or move all the font files from their individual font folders into `~/Library/Fonts` (i.e., the Fonts folder in your personal Library folder).

On Linux:
- Follow the instruction of your Linux distribution on the internet.

## Development

### Prerequisites

- [Ligaturizer](https://github.com/nhatthm/ligaturizer) binary or its docker image.
    - For the binary:
        - `python = 3.11`, `fontforge` and the python bindings.
        - Fira Code 3.1 OTF files.
    - For the docker image: `docker`.
- `make`
- `jq`
- `curl`

### Build a font locally

Ensure the font configuration is correct, for example [`config/cousine.json`](./config/cousine.json).

Run `make fonts/<font-id>` to download the font, for example: `make fonts/cousine`. The font will be downloaded from the source and saved to the `fonts/<font-id>` directory.

Run `make ligaturize-font-<font-id>` to ligaturize the font, for example: `make ligaturize-cont-cousine`. The ligaturized font will be saved to the `out/output/<font-id>` and `out/output-with-chars/<font-id>` directory.

> [!NOTE]
>
> If you use the `ligaturizer` binary, you have to set the `LIGATURE_FONT_DIR` to the directory that contains the Fira Code 3.1 OTF files.
>
> For example:
> ```shell
> $ LIGATURE_FONT_DIR=/path/to/fira-code/otf make ligaturize-font-cousine
> ```

### Build a font using GitHub Actions

All the fonts listed in the [`config`](./config) directory are built using GitHub Actions. The workflow is defined in the [workflow file](./.github/workflows/build-fonts.yaml).

The fonts are versioned using the original font version and the build number. The build number is the date of the build in the format `YYMMDD`. If there are multiple builds in the same day, the build number is appended with a incrementing number.

Example 1: `ubuntu-sans-mono/1.4.0+240208.2`
- We ligaturized Ubuntu Sans Mono v1.4.0.
- We built the font on 2024-02-08.
- It was the third build on that day.

Example 2: `spacemono/1.0.0+240208`
- We ligaturized Space Mono v1.0.0.
- We built the font on 2024-02-08.
- It was the first build on that day.

> [!IMPORTANT]
> If there is no change in the config file, the `Ligaturizer` version, and the `FontForge` version, we don't build the font again.

## Contributing

- For bug reports related to the ligaturizer, please go to the [`Ligaturizer`](https://github.com/nhatthm/ligaturizer/issues).
- For a new font support request, please submit a pull request or open an issue in this repository.

## Copyright

All fonts and ligatures are owned by their respective legal owners. The project does not own any of the fonts, it only provides ligaturized versions of the fonts using the [Ligaturizer](https://github.com/nhatthm/ligaturizer) tool.

## Credits

- [Icon](./templates/icon.png) by [Freepik](https://www.flaticon.com/free-icon/fonts_266105)
- [Banner](https://github.com/nhatthm/ligaturizer/assets/1154587/c635112d-947f-4f4a-95b4-7abf559c4f96) by [Ligaturizer](https://github.com/ToxicFrog/Ligaturizer)
- [404 page template](https://codepen.io/diogo_ml_gomes/pen/PyWdLb) by [Diogo Gomes](https://codepen.io/diogo_ml_gomes)
