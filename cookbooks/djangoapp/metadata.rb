name             'djangoapp'
maintainer       'Chris Cabral'
maintainer_email 'vccabral@gmail.com'
license          'All rights reserved'
description      'Installs/Configures a django app with conintuous integration'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'jenkins'
depends 'database'
depends 'mysql'
depends 'python'
depends 'git'