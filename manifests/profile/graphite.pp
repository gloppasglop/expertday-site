class site::profile::graphite {
  include ::graphite
  include gdash

  include apache::mod::passenger
  $myvhosts = hiera('apache::vhosts', {})
  create_resources('apache::vhost', $myvhosts)

  gdash::category { "Expertday": }

  gdash::dashboard { "OS Metrics":
        description => "OS Metrics",
        category    => "Expertday",
        require     => Gdash::Category["Expertday"],
  }

  gdash::dashboard { "Web Server Metrics":
        description => "Web Server Metrics",
        category    => "Expertday",
        require     => Gdash::Category["Expertday"],
  }

  Gdash::Graph <<||>>
  Gdash::Field <<||>>

}
