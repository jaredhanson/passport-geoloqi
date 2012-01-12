NODE = node
TEST = ./node_modules/.bin/vows
TESTS ?= test/*-test.js

test:
	@NODE_ENV=test NODE_PATH=lib $(TEST) $(TEST_FLAGS) $(TESTS)

docs: docs/api.html

docs/api.html: lib/passport-geoloqi/*.js
	dox \
		--title Passport-Geoloqi \
		--desc "Geoloqi authentication strategy for Passport" \
		$(shell find lib/passport-geoloqi/* -type f) > $@

docclean:
	rm -f docs/*.{1,html}

.PHONY: test docs docclean
