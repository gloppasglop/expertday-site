class site::profile::graphite {
  include ::graphite
  include gdash

   include apache::mod::passenger
   $myvhosts = hiera('apache::vhosts', {})
   create_resources('apache::vhost', $myvhosts)

   gdash::category { "gdash": }

    gdash::dashboard { "gdash":
        name        => "GDash",
        description => "GDash Server",
        category    => "gdash",
        require     => Gdash::Category["gdash"],
    }

    Gdash::Graph <<||>>
    Gdash::Field <<||>>

#   $graphite_fqdn = inline_template( "<%= @fqdn.gsub('.','_')  %>" )
#   gdash::graph { "gdash_load":
#        name        => "Load Average",
#        area        => "none",
#        vtitle      => "Load",
#        description => "Load Average",
#        dashboard   => "gdash",
#        category    => "gdash",
#        require     => Gdash::Dashboard["gdash"],
#    }

#   gdash::field { "${graphite_fqdn}_load_shortterm":
#        name        => "short",
#        scale       => 1,
#        graph       => "gdash_load",
#        color       => "red",
##        alias       => "Short Term (1 minute) ${hostname}",
#        #data        => "sumSeries(collectd.$graphite_fqdn.load.load.shortterm)",
#        data        => "collectd.$graphite_fqdn.load.load.shortterm",
#        category    => "gdash",
#        require     => Gdash::Graph["gdash_load"],
##        dashboard   => "gdash",
#    }


}
