.PHONY: help lint test coverage clean-pubspec clean-gen clean-cov clean install
PACKAGES := $(shell ls packages)


##@
##@ CI dedicated commands
##@

run-tests:  ##@ CI - Run tests on the project without building
	@echo "Cleaning up old dylib and dll files..."
	find . -name "*.dylib" -delete
	find . -name "*.dll" -delete
	@echo "Running tests..."
	flutter test --coverage --coverage-path=coverage/lcov.info --branch-coverage

check-format:  ##@ CI - Check formatting of the project
	@echo "Checking formatting while ignoring code generated files..."
	find . -name "*.dart" ! -name "*.g.dart" ! -name "*.chopper.dart" ! -path '*/generated/*' ! -path './proto/*' ! -path '*.dart_tool/*' | tr '\n' ' ' | xargs dart format --output=show --set-exit-if-changed --line-length=150

ci-lint:  ##@ CI - Run linter on the projects
	flutter analyze --no-pub --no-fatal-infos

ci-install:  ##@ CI - Install dependencies (just for this package)
	flutter pub get

##@
##@ Flutter management commands
##@

lint:  ##@ Run linter on the projects
	flutter analyze

test:  ##@ Run tests on the projects
	for package in $(PACKAGES); do \
		echo "Running tests for $$package"; \
		cd packages/$$package; \
		flutter test --coverage --coverage-path=coverage/$$package.lcov.info --branch-coverage; \
		cd -; \
	done

install:
	for package in $(PACKAGES); do \
		echo "Installing dependencies for $$package"; \
		cd packages/$$package; \
		flutter pub get; \
		cd -; \
	done

format:  ##@ Format the projects
	find . -name "*.dart" ! -name "*.g.dart" ! -name "*.chopper.dart" ! -path '*/generated/*' ! -path './proto/*' ! -path '*.dart_tool/*' | tr '\n' ' ' | xargs dart format --output=write --line-length=150

##@
##@ Utility commands
##@

coverage: ##@ Generate and open the coverage report in the browser
	@# Clean up the coverage folder
	@rm -rf coverage
	@rm -rf coverage-html
	@mkdir -p coverage
	@# Copy all the lcov files to the coverage folder
	@find packages -name *.lcov.info -exec cp -f '{}' coverage/ ';'
	@# Substitute the relative paths into the lcov files so that they can be merged
	@for p in $(PACKAGES); do sed -i '' -E 's/SF:(.+)$$/SF:packages\/'"$$p"'\/\1/g' coverage/$$p.lcov.info; done
	@# Merge coverage into one file
	@find coverage -size +0 -name *.lcov.info -exec echo -a {} \; | xargs lcov -o coverage/coverage.info
	@genhtml coverage/coverage.info --output-directory coverage-html
	@python3 -c "import webbrowser;webbrowser.open('coverage-html/index.html')"

clean-pubspec:  ##@ Clean up pubspec.lock files
	@echo "Cleaning up pubspec files..."
	find -name pubspec.lock -delete
	@echo "Deleted lock files, running pub get..."
	$(MAKE) install

clean-gen:  ##@ Cleans up code generated files
	@echo "Cleaning up generated files..."
	find -name "*.g.dart" -delete
	find -name "*.freezed.dart" -delete
	find -name "*.chopper.dart" -delete

clean-cov:  ##@ Cleans up code coverage files
	@echo "Cleaning up coverage files..."
	find -name "lcov.info" -delete

clean: clean-pubspec clean-gen clean-cov  ##@ Cleans up all generated files

##@
##@ Miscellaneous commands
##@

help: ##@ (Default) Print listing of key targets with their descriptions
	@printf "\nUsage: make <command>\n"
	@grep -F -h "##@" $(MAKEFILE_LIST) | grep -F -v grep -F | sed -e 's/\\$$//' | awk 'BEGIN {FS = ":*[[:space:]]*##@[[:space:]]*"}; \
	{ \
		if($$2 == "") \
			printf ""; \
		else if($$0 ~ /^#/) \
			printf "\n%s\n", $$2; \
		else if($$1 == "") \
			printf "     %-20s%s\n", "", $$2; \
		else \
			printf "\n    \033[34m%-20s\033[0m %s\n", $$1, $$2; \
	}'
.DEFAULT_GOAL := help
