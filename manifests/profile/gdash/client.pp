class site::profile::gdash::client {
  notify { "site::profile::gdash::client": }
  #include gdash

#   #gdash::category { "gdash": }
#
#    gdash::dashboard { "gdash":
#        name        => "GDash",
#        description => "GDash Server",
#        category    => "gdash",
#        require     => Gdash::Category["gdash"],
#    }

   $graphite_fqdn = inline_template( "<%= @fqdn.gsub('.','_')  %>" )

   @@gdash::graph { "gdash_load_${graphite_fqdn}":
        name        => "Load Average ${graphite_fqdn}",
        area        => "none",
        vtitle      => "Load",
        description => "Load Average",
        dashboard   => "gdash",
        category    => "gdash",
        require     => Gdash::Dashboard["gdash"],
    }

   @@gdash::field { "${graphite_fqdn}_load_shortterm":
        name        => "short ${graphite_fqdn}",
        scale       => 1,
        graph       => "gdash_load_${graphite_fqdn}",
        color       => "red",
        alias       => "Short Term (1 minute) ${hostname}",
        #data        => "sumSeries(collectd.$graphite_fqdn.load.load.shortterm)",
        data        => "collectd.$graphite_fqdn.load.load.shortterm",
        category    => "gdash",
#        require     => Gdash::Graph["${graphite_fqdn}_gdash_load"],
        dashboard   => "gdash",
    }


}
