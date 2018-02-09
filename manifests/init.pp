class eyp-puppethelloworld(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                          ) inherits eyp-puppethelloworld::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::eyp-puppethelloworld::install': }
  -> class { '::eyp-puppethelloworld::config': }
  ~> class { '::eyp-puppethelloworld::service': }
  -> Class['::eyp-puppethelloworld']

}
