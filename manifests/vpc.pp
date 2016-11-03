class discr33t_aws::vpc {

  ec2_vpc { 'discr33t':
    ensure           => present,
    region           => 'us-east-1',
    cidr_block       => '10.0.0.0/16',
    instance_tenancy => 'default',
  }

  ec2_vpc_internet_gateway { 'discr33t-igw':
    ensure => present,
    region => 'us-east-1',
    vpc    => 'discr33t',
  }

  ec2_vpc_routetable { 'discr33t-privatezone01':
    ensure => present,
    region => 'us-east-1',
    vpc    => 'discr33t',
    routes => [
      {
        'destination_cidr_block' => '10.0.0.0/16',
        'gateway'                => 'local',
      }
    ],
  }

  ec2_vpc_routetable { 'discr33t-privatezone02':
    ensure => present,
    region => 'us-east-1',
    vpc    => 'discr33t',
    routes => [
      {
        'destination_cidr_block' => '10.0.0.0/16',
        'gateway'                => 'local',
      }
    ],
  }
}
