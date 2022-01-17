# Minimal raylib + Meson C/C++ template
Minimal template project for C/C++ applications using [raylib](https://www.raylib.com/) built using [Meson](https://mesonbuild.com/).

## Prerequisites
### Windows
I have had the best success building with MinGW (MSYS2) however this was because I didn't want VS build tools on my path constantly.

### Web (On Windows)
I have had tons of issues with emscripten on Windows, so this repo depends on Docker for Windows when building web.

### Web (On Linux)
You'll need to install the usual emscripten tools for raylib.

## Setting up
There are scripts for both native and web use.

I don't really know what the original repo had this here for, so I left it in.
Cross-compiled Windows builds using [MinGW](http://mingw.org):
```sh
$ meson setup --cross-file cross-file/windows32.ini build/win32
# compile with
$ meson compile -C build/win32
```
