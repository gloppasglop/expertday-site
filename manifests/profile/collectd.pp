class site::profile::collectd {
  notify { "site::profile::collectd": }
  include ::collectd
  include collectd::plugin::write_graphite
}
