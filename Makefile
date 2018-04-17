BROWSERIFY = ./node_modules/.bin/browserify
#UGLIFY = ./node_modules/uglify-es/bin/uglifyjs
UGLIFY = ./node_modules/.bin/uglifyjs
TRANSFORM_SWITCH = -t [ babelify --presets [ es2015 ] ]

run:
	wzrd app.js:index.js -- \
		-d \
		$(TRANSFORM_SWITCH)

build:
	$(BROWSERIFY) $(TRANSFORM_SWITCH) app.js | $(UGLIFY) -c -m -o index.js

pushall:
	git push origin gh-pages

prettier:
	prettier --single-quote --write "**/*.js"
