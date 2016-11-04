class discr33t_aws::subnet {

  ec2_vpc_subnet { 'discr33t-publiczone01-sn':
    ensure                  => present,
    availability_zone       => 'us-east-1a',
    cidr_block              => '10.0.201.0/24',
    map_public_ip_on_launch => true,
    region                  => $discr33t_aws::aws_region,
    route_table             => 'discr33t-publiczone-rt',
    vpc                     => 'discr33t-vpc',
  }

  ec2_vpc_subnet { 'discr33t-publiczone02-sn':
    ensure                  => present,
    availability_zone       => 'us-east-1b',
    cidr_block              => '10.0.202.0/24',
    map_public_ip_on_launch => true,
    region                  => $discr33t_aws::aws_region,
    route_table             => 'discr33t-publiczone-rt',
    vpc                     => 'discr33t-vpc',
  }

  ec2_vpc_subnet { 'discr33t-privatezone01-sn':
    ensure                  => present,
    availability_zone       => 'us-east-1a',
    cidr_block              => '10.0.101.0/24',
    map_public_ip_on_launch => false,
    region                  => $discr33t_aws::aws_region,
    route_table             => 'discr33t-privatezone-rt',
    vpc                     => 'discr33t-vpc',
  }

  ec2_vpc_subnet { 'discr33t-privatezone02-sn':
    ensure                  => present,
    availability_zone       => 'us-east-1b',
    cidr_block              => '10.0.102.0/24',
    map_public_ip_on_launch => false,
    region                  => $discr33t_aws::aws_region,
    route_table             => 'discr33t-privatezone-rt',
    vpc                     => 'discr33t-vpc',
  }
}
