class puppethelloworld::install inherits <%= metadata.name %> {

  if($puppethelloworld::manage_package)
  {
    package { $puppethelloworld::params::package_name:
      ensure => $puppethelloworld::package_ensure,
    }
  }

}
