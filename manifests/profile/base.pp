class site::profile::base inherits site::profile::base::params {
  require site::profile
  notify { "site::profile::base": }
  # perhaps all nodes at your site use this as a base?
  include collectd
  class { 'collectd::plugin::write_graphite':
  }
}
