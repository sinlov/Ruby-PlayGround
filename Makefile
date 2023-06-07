.PHONY: test check clean build dist all

ENV_DIST_VERSION := 1.0.0

ENV_PROJECT_NAME=ruby-playground

ENV_ROOT ?= $(shell pwd)
ENV_ROOT_MAKE_FILE ?= ${ENV_ROOT}/Makefile
ENV_ROOT_MANIFEST = ${ENV_ROOT}/package.json
ENV_CHANGELOG = ${ENV_ROOT}/CHANGELOG.md
ENV_COVERAGE_OUT_FOLDER = ${ENV_ROOT}/coverage/
ENV_GEM_LOCK_FILE = ${ENV_ROOT}/Gemfile.lock
ENV_MODULE_FOLDER ?= ${ENV_ROOT}/lib

env:
	ruby -v
	bundle -v
	bundle config list

cleanCoverageOut:
	-@RM -r ${ENV_COVERAGE_OUT_FOLDER}
	$(info has clean ${ENV_COVERAGE_OUT_FOLDER})

cleanGemCache:
	-@RM -r ${ENV_GEM_LOCK_FILE}
	$(info has clean ${ENV_GEM_LOCK_FILE})

cleanAll: cleanGemCache
	@echo "=> clean all finish"

installGlobal:
	gem install --user-install bundler

install:
	bundler install

installAll: utils installGlobal install
	@echo "=> install all finish"

tasks:
	bundler exec rake -T

taskClean:
	bundler exec rake cleanAll

test: export RUBY_SIMPLE_COV=off
test:
	bundler exec rake test:testAll

testCoverage: export RUBY_SIMPLE_COV=on
testCoverage:
	$(info bundler exec rake -f RakeCoverageUnityTest.rb)
	bundler exec rake test:testAll

cleanTestCoverage:
	bundler exec rake -f RakeCoverageUnityTest.rb cleanOut

testAll: test
	@echo "=> finish test all"

utils:
	npm install -g commitizen cz-conventional-changelog conventional-changelog-cli

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
	@echo "$$ make env                 ~> show env"
	@echo "$$ make installGlobal       ~> install must tools at global"
	@echo "$$ make install             ~> install project"
	@echo "$$ make installAll          ~> install all include global utils"
	@echo "$$ make tasks               ~> see all rake task"
	@echo "$$ make taskClean           ~> do rake cleanAll"
	@echo " unit test as"
	@echo "$$ make test                ~> only run unit test as change"
	@echo "$$ make testAll             ~> run full unit test"
	@echo "$$ make testCoverage        ~> run full unit test and show coverage"
