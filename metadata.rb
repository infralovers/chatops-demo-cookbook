name             'chatops_demo'
maintainer       'Infralovers'
maintainer_email 'you@example.com'
license          'team@infralovers.com'
description      'Installs/Configures chatops_demo'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION'))
issues_url 'https://git.redbullmediahouse.com/chef-aws-common/chatops_demo/issues' if respond_to?(:issues_url)
source_url 'https://git.redbullmediahouse.com/chef-aws-common/chatops_demo' if respond_to?(:source_url)

depends 'il-base'
depends 'apt'
depends 'git'
depends 'jenkins'
# depends 'hostsfile'
depends 'lita'
depends 'chef-vault'
#depends 'ssl-vault'
#depends 'ark'
depends 'java'

supports 'ubuntu'
