class discr33t_aws::destroy {

  contain '::discr33t_aws'

  ec2_instance { ['discr33t-master01',
                      'discr33t-master02',
                      'discr33t-slave01',
                      'discr33t-slave02']:
    ensure => absent,
    region => 'us-east-1',
  } ~>

  ec2_securitygroup { ['discr33t-master-sg',
                       'discr33t-slave-sg']:
    ensure => absent,
    region => 'us-east-1',
  } ~>

  ec2_vpc_internet_gateway { 'discr33t-igw':
    ensure => absent,
    region => 'us-east-1',
  } ~>

  ec2_vpc_subnet { ['discr33t-publiczone01-sn',
                    'discr33t-publiczone02-sn',
                    'discr33t-privatezone01-sn',
                    'discr33t-privatezone02-sn']:
    ensure => absent,
    region => 'us-east-1',
  }

  ec2_vpc_routetable { ['discr33t-publiczone-rt',
                        'discr33t-privatezone-rt']:
    ensure => absent,
    region => 'us-east-1',
  }

  ec2_vpc { 'discr33t-vpc':
    ensure => absent,
    region => 'us-east-1',
  }
}
