class site::role inherits site::role::params {
  require site
  notify { "site::role": }
  include site::profile::base
  include site::profile::gdash::client
}



class site::role::graphite inherits site::role {
  include site::profile::graphite
} 
