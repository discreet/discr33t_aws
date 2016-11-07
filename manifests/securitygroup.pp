class discr33t_aws::securitygroup inherits discr33t_aws {

  ec2_securitygroup { 'discr33t-master-sg':
    ensure      => present,
    description => 'SSH access into the Master instances',
    ingress     => [
      {
        'cidr'      => '0.0.0.0/0',
        'protocol'  => 'tcp',
        'from_port' => '22',
        'to_port'   => '22',
      },
    ],
    region      => $aws_region,
    vpc         => $aws_vpc,
  }

  ec2_securitygroup { 'discr33t-slave-sg':
    ensure      => present,
    description => 'Internal VPC Access',
    ingress     => [
      {
        'cidr'      => '10.0.0.0/16',
      },
    ],
    region      => $aws_region,
    vpc         => $aws_vpc,
  }
}
