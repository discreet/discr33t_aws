class discr33t_aws::build {

  contain '::discr33t_aws'

  include '::discr33t_aws::vpc'
  include '::discr33t_aws::subnet'
  include '::discr33t_aws::securitygroup'
}
