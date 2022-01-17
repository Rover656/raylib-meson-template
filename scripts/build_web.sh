#!/bin/bash

cd /app
rm build/web/* -r
meson setup --cross-file cross-file/web.ini build/web
meson compile -C build/web