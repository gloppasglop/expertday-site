class site::profile::gdash::server {
  notify { "site::profile::gdash::server": }
  include gdash

  gdash::category { "gdash": }

  gdash::dashboard { "gdash":
        name        => "GDash",
        description => "GDash Server",
        category    => "gdash",
        require     => Gdash::Category["gdash"],
   }

   Gdash::Graph <<||>>
   Gdash::Field <<||>>


}
