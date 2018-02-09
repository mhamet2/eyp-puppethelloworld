class eyp-puppethelloworld::install inherits <%= metadata.name %> {

  if($eyp-puppethelloworld::manage_package)
  {
    package { $eyp-puppethelloworld::params::package_name:
      ensure => $eyp-puppethelloworld::package_ensure,
    }
  }

}
