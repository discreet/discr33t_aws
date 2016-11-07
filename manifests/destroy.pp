class discr33t_aws::destroy inherits discr33t_aws {

  contain '::discr33t_aws'

  file { 'credstash-dir':
    ensure => directory,
    path   => '/opt/credstash',
    owner  => root,
    group  => root,
    mode   => '0755',
  }

  file { 'destroy-credstash':
    ensure  => file,
    path    => '/opt/credstash/credstash_destroy.rb',
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('discr33t_aws/credstash_destroy.rb.erb'),
    require => File['credstash-dir'],
  }

  exec { 'destroy-credstash':
    path        => '/bin',
    cwd         => '/opt/credstash',
    command     => 'ruby credstash_destroy.rb',
    subscribe   => File['destroy-credstash'],
    refreshonly => true,
  }

  ec2_instance { ['discr33t-master01',
                      'discr33t-master02',
                      'discr33t-slave01',
                      'discr33t-slave02']:
    ensure => absent,
    region => $aws_region,
  } ~>

  ec2_securitygroup { ['discr33t-master-sg',
                       'discr33t-slave-sg']:
    ensure => absent,
    region => $aws_region,
  } ~>

  ec2_vpc_internet_gateway { 'discr33t-igw':
    ensure => absent,
    region => $aws_region,
  } ~>

  ec2_vpc_subnet { ['discr33t-publiczone01-sn',
                    'discr33t-publiczone02-sn',
                    'discr33t-privatezone01-sn',
                    'discr33t-privatezone02-sn']:
    ensure => absent,
    region => $aws_region,
  }

  ec2_vpc_routetable { ['discr33t-publiczone-rt',
                        'discr33t-privatezone-rt']:
    ensure => absent,
    region => $aws_region,
  }

  ec2_vpc { $aws_vpc:
    ensure => absent,
    region => $aws_region,
  }
}
