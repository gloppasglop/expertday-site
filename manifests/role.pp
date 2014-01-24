class site::role inherits site::role::params {
  require site
  notify { "site::role": }
  include site::profile::base
  include site::profile::collectd
  include site::profile::gdash::client
}

class site::role::graphite inherits site::role {
  notify { "site::role::graphite": } 
  include site::profile::graphite
} 
