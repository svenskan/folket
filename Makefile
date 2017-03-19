NAME = Folket

XML = dictionary.xml
CSS = dictionary.css
XSL = dictionary.xsl
PLIST = dictionary.plist

DDK_DIR ?= "Dictionary Development Kit"
DDK_BIN = "$(DDK_DIR)/bin"
BUILD = objects

FILE = $(NAME).dictionary
TARGET = $(BUILD)/$(FILE)

INSTALL_DIR ?= ~/Library/Dictionaries

all: $(TARGET)

$(TARGET): $(XML) $(CSS) $(PLIST)
	"$(DDK_BIN)/build_dict.sh" $(NAME) $^
	touch $(TARGET)

$(XML): folkets_sv_en_public.xml folkets_en_sv_public.xml $(XSL)
	sed '$$ d' folkets_sv_en_public.xml > _$@
	tail -n +3 folkets_en_sv_public.xml >> _$@
	xsltproc -o $@ $(XSL) _$@
	rm _$@

folkets_%_public.xml:
	curl -O http://folkets-lexikon.csc.kth.se/folkets/$@

install: $(TARGET)
	@echo "Installing the dictionary into $(INSTALL_DIR)..."
	mkdir -p $(INSTALL_DIR)
	rm -rf $(INSTALL_DIR)/$(FILE)
	cp -R $(TARGET) $(INSTALL_DIR)/$(FILE)

uninstall:
	@echo "Uninstalling the dictionary from $(INSTALL_DIR)..."
	rm -rf $(INSTALL_DIR)/$(FILE)

publish: $(TARGET)
	cd $(BUILD) && zip -r $(NAME).zip $(FILE)
	git checkout gh-pages
	mv $(BUILD)/$(NAME).zip Folket.zip
	git add Folket.zip
	git commit --amend --message 'Update the archive'
	git push --force
	git checkout master

clean:
	rm -rf $(BUILD)
	rm -rf *.xml

.PHONY: all install uninstall clean
