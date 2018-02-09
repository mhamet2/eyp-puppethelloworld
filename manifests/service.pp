class puppethelloworld::service inherits <%= metadata.name %> {

  #
  validate_bool($puppethelloworld::manage_docker_service)
  validate_bool($puppethelloworld::manage_service)
  validate_bool($puppethelloworld::service_enable)

  validate_re($puppethelloworld::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${<%= metadata.name %>::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $puppethelloworld::manage_docker_service)
  {
    if($puppethelloworld::manage_service)
    {
      service { $puppethelloworld::params::service_name:
        ensure => $puppethelloworld::service_ensure,
        enable => $puppethelloworld::service_enable,
      }
    }
  }
}
