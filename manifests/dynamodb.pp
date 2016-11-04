class discr33t_aws::dynamodb inherits discr33t_aws {

  file { 'dynamodb-dir':
    ensure => directory,
    path   => '/opt/dynamodb',
    owner  => root,
    group  => root,
    mode   => '0755',
  }

  file { 'build-dynamodb':
    ensure  => file,
    path    => '/opt/dynamodb/dynamodb_create.rb',
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('discr33t_aws/dynamodb_create.rb.erb'),
    require => File['dynamodb-dir'],
  }

  exec { 'build-dynamodb':
    path        => '/bin',
    cwd         => '/opt/dynamodb',
    command     => 'ruby dynamodb_create.rb',
    subscribe   => File['build-dynamodb'],
    refreshonly => true,
  }
}
