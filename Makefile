all: node_modules/.bin
	@echo "Now look at the Makefile in the jedi/ folder for the build targets"

node_modules/.bin:
	npm install
