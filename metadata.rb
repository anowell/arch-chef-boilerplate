name             'base'
maintainer       'Anthony Nowell'
maintainer_email 'anowell@gmail.com'
license          'All rights reserved'
description      'Base configuration recipes'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.10'

depends "cron"
depends "logrotate"
depends "sudo"
depends "users"
