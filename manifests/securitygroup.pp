class discr33t_aws::securitygroup {

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
    region      => 'us-east-1',
    vpc         => 'discr33t-vpc',
  }

  ec2_securitygroup { 'discr33t-slave-sg':
    ensure      => present,
    description => 'Internal VPC Access',
    ingress     => [
      {
        'cidr'      => '10.0.0.0/16',
      },
    ],
    region      => 'us-east-1',
    vpc         => 'discr33t-vpc',
  }
}
