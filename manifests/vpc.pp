class discr33t_aws::vpc {

  ec2_vpc { 'discr33t-vpc':
    ensure           => present,
    region           => $discr33t_aws::aws_region,
    cidr_block       => '10.0.0.0/16',
    instance_tenancy => 'default',
  }

  ec2_vpc_internet_gateway { 'discr33t-igw':
    ensure => present,
    region => $discr33t_aws::aws_region,
    vpc    => 'discr33t-vpc',
  }

  ec2_vpc_routetable { 'discr33t-publiczone-rt':
    ensure => present,
    region => $discr33t_aws::aws_region,
    vpc    => 'discr33t-vpc',
    routes => [
      {
        'destination_cidr_block' => '10.0.0.0/16',
        'gateway'                => 'local',
      },
      {
        'destination_cidr_block' => '0.0.0.0/0',
        'gateway'                => 'discr33t-igw',
      },
    ],
  }

  ec2_vpc_routetable { 'discr33t-privatezone-rt':
    ensure => present,
    region => $discr33t_aws::aws_region,
    vpc    => 'discr33t-vpc',
    routes => [
      {
        'destination_cidr_block' => '10.0.0.0/16',
        'gateway'                => 'local',
      },
    ],
  }
}
