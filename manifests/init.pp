class discr33t_aws {

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

  package { ['aws-sdk-core',
             'retries']:
    ensure   => latest,
    provider => puppet_gem,
  }

  file { 'aws-dir':
    ensure => directory,
    path   => '/root/.aws',
    owner  => root,
    group  => root,
    mode   => '0700',
  }

  $cred_default = {'path'    => '/root/.aws/credentials',
                   'require' => File['aws-dir'],
                   'ensure'  => 'file',
                  }

  $cred_data = {
    'default' => {
      'aws_access_key_id'     => hiera('discr33t::access_key'),
      'aws_secret_access_key' => hiera('discr33t::secret_key'),
      'region'                => 'us-east-1',
    }
  }
   create_ini_settings($cred_data, $cred_default)
}
