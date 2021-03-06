# roots v2.0.6

# Files in this list will not be compiled - minimatch supported
ignore_files: ['_*', 'readme*', '.gitignore', '.DS_Store', '*.conf', 'id_deploy', 'id_deploy.pub', 'README.md', 'building.md', 'Gruntfile.coffee', 'server.js', 'deploy', 'favicon.ico']
ignore_folders: ['.git', 'build', 'node_modules', 'marketing']

# Layout file config
# `default` applies to all views. Override for specific
# views as seen below.
layouts:
  default: 'layout.jade'
  # 'special_view.jade': 'special_layout.jade'

# Locals will be made available on every page. They can be
# variables or (coffeescript) functions.
locals:
  title: 'Zoom The Balloon'
  title_with_markup: ->
    "<h1 class='title'>Welcome to Roots!</h1>"

# Precompiled template path, see http://roots.cx/docs/#precompile
templates: 'assets/js/templates'
