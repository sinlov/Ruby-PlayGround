.PHONY: test check clean build dist all

# each tag change this
ENV_DIST_VERSION := 1.0.0

# change project name
ENV_PROJECT_NAME=ruby-playground

ENV_ROOT ?= $(shell pwd)
ENV_ROOT_MAKE_FILE ?= ${ENV_ROOT}/Makefile
ENV_ROOT_MANIFEST = ${ENV_ROOT}/package.json
ENV_CHANGELOG = ${ENV_ROOT}/CHANGELOG.md
ENV_COVERAGE_OUT_FOLDER = ${ENV_ROOT}/coverage/
ENV_GEM_LOCK_FILE = ${ENV_ROOT}/Gemfile.lock
ENV_MODULE_FOLDER ?= ${ENV_ROOT}/lib

utils:
	npm install -g commitizen cz-conventional-changelog conventional-changelog-cli
	ruby -v
	bundle -v
	bundle config list

versionHelp:
	@git fetch --tags
	@echo "project base info"
	@echo " project name         : ${ENV_PROJECT_NAME}"
	@echo " module folder path   : ${ENV_MODULE_FOLDER}"
	@echo ""
	@echo "=> please check to change version, now is [ ${ENV_DIST_VERSION} ]"
	@echo "-> check at: ${ENV_ROOT_MAKE_FILE}:4"
	@echo " $(shell head -n 4 ${ENV_ROOT_MAKE_FILE} | tail -n 1)"
	@echo "-> check at: ${ENV_ROOT_MANIFEST}:3"
	@echo " $(shell head -n 3 ${ENV_ROOT_MANIFEST} | tail -n 1)"

tagBefore: versionHelp
	@cd ${ENV_MODULE_FOLDER} && conventional-changelog -i ${ENV_CHANGELOG} -s --skip-unstable
	@echo ""
	@echo "=> new CHANGELOG.md at: ${ENV_CHANGELOG}"
	@echo "place check all file, then can add tag like this!"
	@echo "$$ git tag -a '${ENV_DIST_VERSION}' -m 'message for this tag'"

cleanCoverageOut:
	@if [ -d ${ENV_COVERAGE_OUT_FOLDER} ]; \
	then rm -rf ${ENV_COVERAGE_OUT_FOLDER} && echo "~> cleaned ${ENV_COVERAGE_OUT_FOLDER}"; \
	else echo "~> has cleaned ${ENV_COVERAGE_OUT_FOLDER}"; \
	fi

cleanGemCache:
	@if [ -f ${ENV_GEM_LOCK_FILE} ]; \
	then rm -f ${ENV_GEM_LOCK_FILE} && echo "~> cleaned ${ENV_GEM_LOCK_FILE}"; \
	else echo "~> has cleaned ${ENV_GEM_LOCK_FILE}"; \
	fi

cleanAll: cleanGemCache
	@echo "=> clean all finish"

installGlobal:
	gem install --user-install bundler

install:
	bundler install

installAll: utils installGlobal install
	@echo "=> install all finish"

rakeTasks:
	bundler exec rake -T

test:
	bundler exec rake test:testAll

testCoverage:
	bundler exec rake -f RakeCoverageUnityTest.rb

cleanTestCoverage:
	bundler exec rake -f RakeCoverageUnityTest.rb cleanOut

testAll:
	bundler exec rake test:testAll

help:
	@echo "ruby module makefile template"
	@echo ""
	@echo " tips: can install node and install utils as"
	@echo "$$ make utils               ~> install utils"
	@echo "  1. then write git commit log, can replace [ git commit -m ] to [ git cz ]"
	@echo "  2. generate CHANGELOG.md doc: https://github.com/commitizen/cz-cli#conventional-commit-messages-as-a-global-utility"
	@echo ""
	@echo "  then you can generate CHANGELOG.md as"
	@echo "$$ make versionHelp         ~> print version when make tageBefore will print again"
	@echo "$$ make tagBefore           ~> generate CHANGELOG.md and copy to module folder"
	@echo ""
	@echo " project name         : ${ENV_PROJECT_NAME}"
	@echo " module folder path   : ${ENV_MODULE_FOLDER}"
	@echo ""
	@echo "Warning: must install node and install module as"
	@echo "$$ make installGlobal       ~> install must tools at global"
	@echo "$$ make install             ~> install project"
	@echo "$$ make installAll          ~> install all include global utils"
	@echo "$$ make rakeTasks           ~> see all rake task"
	@echo " unit test as"
	@echo "$$ make test                ~> only run unit test as change"
	@echo "$$ make testAll             ~> run full unit test"
	@echo "$$ make testCoverage        ~> run full unit test and show coverage"
