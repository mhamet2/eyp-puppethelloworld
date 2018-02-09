class eyp-puppethelloworld::service inherits <%= metadata.name %> {

  #
  validate_bool($eyp-puppethelloworld::manage_docker_service)
  validate_bool($eyp-puppethelloworld::manage_service)
  validate_bool($eyp-puppethelloworld::service_enable)

  validate_re($eyp-puppethelloworld::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${<%= metadata.name %>::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $eyp-puppethelloworld::manage_docker_service)
  {
    if($eyp-puppethelloworld::manage_service)
    {
      service { $eyp-puppethelloworld::params::service_name:
        ensure => $eyp-puppethelloworld::service_ensure,
        enable => $eyp-puppethelloworld::service_enable,
      }
    }
  }
}
