# Point at any base image that you find suitable to extend.
FROM emscripten/emsdk:latest

RUN apt update && apt install -y ninja-build
RUN pip3 install meson

CMD ["/bin/sh", "/app/scripts/build_web.sh"]