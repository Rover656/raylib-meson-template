project('raylib-meson', 'c', 'cpp')

cc = meson.get_compiler('c')
cxx = meson.get_compiler('cpp')

c_args = []
cpp_args = []
link_args = []
name_suffix = []
dependencies = []

# Raylib configuration
cmake = import('cmake')
raylib_opts = cmake.subproject_options()
raylib_opts.set_install(false)
raylib_opts.add_cmake_defines({
  'BUILD_EXAMPLES': 'OFF',
  # Add other CMake options for Raylib, if needed
})
if cc.get_id() == 'emscripten'
  raylib_opts.add_cmake_defines({
    'PLATFORM': 'Web',
  })
else
  raylib_opts.add_cmake_defines({
    'PLATFORM': 'Desktop',
  })
endif
raylib_subproject = cmake.subproject('raylib', options: raylib_opts)
dependencies += raylib_subproject.dependency('raylib')

# General configuration
if host_machine.system() == 'windows'
  dependencies += [
    cc.find_library('winmm'),
    raylib_subproject.dependency('glfw')
  ]
elif host_machine.system() == 'darwin'
  # TODO
elif host_machine.system() == 'linux'
  dependencies += [
    cc.find_library('m'),
    cc.find_library('dl'),
    raylib_subproject.dependency('glfw')
  ]
elif host_machine.system() == 'emscripten'
  link_args += [
    '-s', 'ENVIRONMENT=web',
    '-s', 'USE_GLFW=3',
    '--preload-file', meson.current_source_dir() / 'assets' + '@/assets',
  ]
  name_suffix = 'html'
endif

# Asset directory
if get_option('buildtype') == 'release' or host_machine.system() == 'emscripten'
    add_project_arguments('-DASSETS_PATH="assets/"', language: ['c', 'cpp'])
else
    add_project_arguments('-DASSETS_PATH="' + meson.current_source_dir() / 'assets/' + '"', language: ['c', 'cpp'])
endif

# Project files
inc_dir = include_directories(
  'src',
)

sources = files(
  'src/main.c',
)

executable('raylib-meson',
  sources,
  c_args: c_args,
  cpp_args: cpp_args,
  dependencies: dependencies,
  include_directories: inc_dir,
  link_args: link_args,
  name_suffix: name_suffix,
  gui_app: get_option('buildtype') == 'release'
)
