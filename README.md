# libluajit-build

build scripts for [luajit](https://github.com/LuaJIT/LuaJIT.git)

## Installation

### Swift Package Manager

Not work on macCatalyst platform

```
https://github.com/mpvkit/libluajit-build.git
```

## How to build

```bash
swift run --package-path scripts

or 

swift run --package-path scripts build platforms=ios,macos  #deployment platform: macos,ios,tvos,maccatalyst
```