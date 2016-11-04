class discr33t_aws::credstash inherits discr33t_aws {

  file { 'credstash-dir':
    ensure => directory,
    path   => '/opt/credstash',
    owner  => root,
    group  => root,
    mode   => '0755',
  }

  file { 'build-credstash':
    ensure  => file,
    path    => '/opt/credstash/credstash_create.rb',
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('discr33t_aws/credstash_create.rb.erb'),
    require => File['credstash-dir'],
  }

  exec { 'build-credstash':
    path        => '/bin',
    cwd         => '/opt/credstash',
    command     => 'ruby credstash_create.rb',
    subscribe   => File['build-credstash'],
    refreshonly => true,
  }
}
