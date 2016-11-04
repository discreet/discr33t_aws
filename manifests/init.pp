class discr33t_aws {

  $aws_region     = hiera('discr33t::region')
  $aws_access_key = hiera('discr33t::access_key')
  $aws_secret_key = hiera('discr33t::secret_key')

  package { ['epel-release',
             'gcc',
             'python-devel',
             'python-pip']:
    ensure => latest,
  } ->

  package { ['pip',
             'credstash',
             'awscli']:
    ensure   => latest,
    provider => pip,
  } ->

  package { 'system-rubies':
    ensure   => latest,
    name     => 'aws-sdk',
    provider => gem,
  } ->

  package { ['aws-sdk-core',
             'retries',
             'aws-sdk']:
    ensure   => latest,
    provider => puppet_gem,
  }

  file { 'aws-dir':
    ensure => directory,
    path   => '/root/.aws',
    owner  => vagrant,
    group  => vagrant,
    mode   => '0700',
  }

  $cred_default = {'path'    => '/root/.aws/credentials',
                   'require' => File['aws-dir'],
                   'ensure'  => 'file',
                  }

  $cred_data = {
    'default' => {
      'aws_access_key_id'     => $aws_access_key,
      'aws_secret_access_key' => $aws_secret_key,
      'region'                => $aws_region,
    }
  }
   create_ini_settings($cred_data, $cred_default)
}
