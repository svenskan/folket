# MacFolket

MacFolket is a Swedish–English dictionary for OS X.

## Installation

1. [Download][download] an archive with the latest version of the dictionary.
2. Unzip the archive and copy `Swedish-English.dictionary` to
   `~/Library/Dictionaries`.
3. Open the Dictionary application and activate the Swedish–English dictionary
   in the settings.

## Compilation

1. Clone the repository.
2. Download Apple’s [Dictionary Development Kit][apple], which is a part of the
   package called “Auxiliary Tools for Xcode.”
3. Move the “Dictionary Development Kit” directory from the package to the
   directory of the repository.
4. Run `make`.
5. Run `make install`.

## Acknowledgments

The repository is a fork of [MacFolket][macfolket], which is developed by
[Christopher Loessl][loessl].

[download]: https://github.com/IvanUkhov/MacFolket/raw/gh-pages/MacFolket.zip
[apple]: https://developer.apple.com/downloads
[macfolket]: https://github.com/hashier/MacFolket
[loessl]: http://loessl.org
