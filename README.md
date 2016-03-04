# Folket (March 4, 2016)

Folket is a Swedish–English dictionary for OS X.

## Installation

1. [Download][archive] an archive with the latest version of the dictionary.
2. Unzip the archive and copy `Swedish-English.dictionary` to
   `~/Library/Dictionaries`.
3. Open the Dictionary app and activate the Swedish–English dictionary in the
   settings.

## Usage

* Tap a word with three fingers on the trackpad.
* Hover the cursor over a word and press ⌃⌘D.
* Open the Dictionary app and type a word.

## Compilation

1. Clone the repository.
2. Download Apple’s [Dictionary Development Kit][apple], which is a part of the
   package called “Auxiliary Tools for Xcode.”
3. Move the “Dictionary Development Kit” directory from the package to the
   directory of the repository.
4. Run `make`.
5. Run `make install`.

## License

Folket is based on the [People’s Dictionary][folkets-index]. The People’s
Dictionary is free. Both the English–Swedish dictionary and Swedish–English
dictionary can be [downloaded][folkets-about] for use under the terms of the
[Distributed Creative Commons Attribution-Share Alike 2.5 Generic][license]
license.

## Acknowledgments

The project is a fork of [MacFolket][macfolket], which is developed by
[Christopher Loessl][loessl].

[archive]: https://github.com/IvanUkhov/Folket/raw/gh-pages/Folket.zip
[apple]: https://developer.apple.com/downloads

[folkets-index]: http://folkets-lexikon.csc.kth.se/folkets/folkets.en.html
[folkets-about]: http://folkets-lexikon.csc.kth.se/folkets/om.en.html
[license]: http://creativecommons.org/licenses/by-sa/2.5

[macfolket]: https://github.com/hashier/MacFolket
[loessl]: http://loessl.org
