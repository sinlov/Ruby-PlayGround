[![ruby-ubuntu](https://github.com/sinlov/Ruby-PlayGround/actions/workflows/ruby-ubuntu.yml/badge.svg)](https://github.com/sinlov/Ruby-PlayGround/actions/workflows/ruby-ubuntu.yml)
[![ruby-macos](https://github.com/sinlov/Ruby-PlayGround/actions/workflows/ruby-macos.yml/badge.svg)](https://github.com/sinlov/Ruby-PlayGround/actions/workflows/ruby-macos.yml)
[![ruby-windows](https://github.com/sinlov/Ruby-PlayGround/actions/workflows/ruby-windows.yml/badge.svg)](https://github.com/sinlov/Ruby-PlayGround/actions/workflows/ruby-windows.yml)
[![codecov](https://codecov.io/gh/sinlov/Ruby-PlayGround/branch/main/graph/badge.svg)](https://codecov.io/gh/sinlov/Ruby-PlayGround)

# this is my Ruby PlayGround

- main page [https://github.com/sinlov/Ruby-PlayGround](https://github.com/sinlov/Ruby-PlayGround)

# env

| item | version | desc                                                     |
|------|---------|----------------------------------------------------------|
| ruby | 3.2.2   | 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-darwin22] |

## bundle

### build

| item | version | desc                                                                     |
|------|---------|--------------------------------------------------------------------------|
| rake | 13.0.0  | [![](https://img.shields.io/gem/v/rake)](https://rubygems.org/gems/rake) |

### development

| item            | version | desc                                                                                           |
|-----------------|---------|------------------------------------------------------------------------------------------------|
| faker           | 3.2.0   | [![](https://img.shields.io/gem/v/faker)](https://rubygems.org/gems/faker)                     |
| rufus-scheduler | 3.9.0   | [![](https://img.shields.io/gem/v/rufus-scheduler)](https://rubygems.org/gems/rufus-scheduler) |

### test

| item      | version | desc                                                                               |
|-----------|---------|------------------------------------------------------------------------------------|
| minitest  | 5.18.0  | [![](https://img.shields.io/gem/v/minitest)](https://rubygems.org/gems/minitest)   |
| simplecov | 0.19.1  | [![](https://img.shields.io/gem/v/simplecov)](https://rubygems.org/gems/simplecov) |
| codecov   | 0.4.3   | [![](https://img.shields.io/gem/v/codecov)](https://rubygems.org/gems/codecov)     |
| optimist  | 3.0.1   | [![](https://img.shields.io/gem/v/optimist)](https://rubygems.org/gems/optimist)   |

# dev

```bash
# first use
$ make env
$ make install

# and see rake tasks
$ rake -T

# run all test case
$ rake test:testAll
```