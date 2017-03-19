DDK_DIR ?= Dictionary Development Kit
INSTALL_DIR ?= ~/Library/Dictionaries

name = Folket

xml = dictionary.xml
css = dictionary.css
xsl = dictionary.xsl
plist = dictionary.plist

build = objects
file = ${name}.dictionary
target = ${build}/${file}

all: ${target}

${target}: ${xml} ${css} ${plist}
	"${DDK_DIR}/bin/build_dict.sh" ${name} $^
	touch ${target}

${xml}: folkets_sv_en_public.xml folkets_en_sv_public.xml ${xsl}
	sed '$$ d' folkets_sv_en_public.xml > _$@
	tail -n +3 folkets_en_sv_public.xml >> _$@
	xsltproc -o $@ ${xsl} _$@
	rm _$@

folkets_%_public.xml:
	curl -O http://folkets-lexikon.csc.kth.se/folkets/$@

install: ${target}
	@echo "Installing the dictionary into ${INSTALL_DIR}..."
	mkdir -p ${INSTALL_DIR}
	rm -rf ${INSTALL_DIR}/${file}
	cp -R ${target} ${INSTALL_DIR}/${file}

uninstall:
	@echo "Uninstalling the dictionary from ${INSTALL_DIR}..."
	rm -rf ${INSTALL_DIR}/${file}

publish: ${target}
	cd ${build} && zip -r ${name}.zip ${file}
	git checkout gh-pages
	mv ${build}/${name}.zip ${name}.zip
	git add ${name}.zip
	git commit --amend --message 'Update the archive'
	git push --force
	git checkout master

clean:
	rm -rf ${build}
	rm -rf *.xml

.PHONY: all install uninstall clean
