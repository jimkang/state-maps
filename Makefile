include config.mk

HOMEDIR = $(shell pwd)
BROWSERIFY = ./node_modules/.bin/browserify
UGLIFY = ./node_modules/uglify-es/bin/uglifyjs

run:
	wzrd app.js:index.js -- \
		-d

build:
	$(BROWSERIFY) app.js | $(UGLIFY) -c -m -o index.js

pushall: sync
	git push origin gh-pages

sync:
	rsync -a $(HOMEDIR)/ $(USER)@$(SERVER):/$(APPDIR) --exclude node_modules/ \
		--omit-dir-times --no-perms
