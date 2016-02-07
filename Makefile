NAME = "Svensk-English"

XML = MacFolket.xml
CSS = MacFolket.css
XSL = MacFolket.xsl
PLIST = MacFolket.plist

DDK_DIR ?= "Dictionary Development Kit"
DDK_BIN = "$(DDK_DIR)/bin"
OBJECTS = objects

DICTIONARY = $(OBJECTS)/$(NAME).dictionary

INSTALL_DIR ?= ~/Library/Dictionaries

all: fetch convert build

fetch: folkets_en_sv_public.xml folkets_sv_en_public.xml

convert: $(XML)

build: $(DICTIONARY)

folkets_%_public.xml:
	curl -O http://folkets-lexikon.csc.kth.se/folkets/$@

$(XML): folkets_sv_en_public.xml folkets_en_sv_public.xml
	sed '$$ d' folkets_sv_en_public.xml > $@_tmp
	tail -n +3 folkets_en_sv_public.xml >> $@_tmp
	xsltproc -o $@ $(XSL) $@_tmp
	sed 's/\&amp;/\&/g' $@ > $@_tmp
	mv $@_tmp $@

$(DICTIONARY): $(XML) $(CSS) $(PLIST)
	"$(DDK_BIN)/build_dict.sh" $(NAME) $^

install:
	@echo "Installing the dictionary into $(INSTALL_DIR)..."
	mkdir -p $(INSTALL_DIR)
	ditto --noextattr --norsrc $(OBJECTS)/$(NAME).dictionary $(INSTALL_DIR)/$(NAME).dictionary
	touch $(INSTALL_DIR)

uninstall:
	@echo "Uninstalling the dictionary from $(INSTALL_DIR)..."
	rm -rf $(INSTALL_DIR)/$(NAME).dictionary
	touch $(INSTALL_DIR)

clean:
	rm -rf $(OBJECTS)
	rm -rf *.xml

.PHONY: all fetch convert build install uninstall clean
