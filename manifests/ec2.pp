class discr33t_aws::ec2 {

  ec2_instance { 'discr33t-master01':
    ensure                   => running,
    region                   => $discr33t_aws::aws_region,
    availability_zone        => 'us-east-1a',
    subnet                   => [
      'discr33t-publiczone01-sn'
    ],
    security_groups          => [
      'discr33t-master-sg'
    ],
    image_id                 => 'ami-6d1c2007',
    key_name                 => 'discr33t',
    instance_type            => 't2.micro',
    monitoring               => false,
    ebs_optimized            => false,
    tenancy                  => 'default',
    block_devices            => [
      {
        'delete_on_termination' => 'true',
        'device_name'           => '/dev/sda1',
        'volume_size'           => '8',
      },
    ],
    user_data                => template('discr33t_aws/user_data/base.sh.erb'),
  }

  ec2_instance { 'discr33t-master02':
    ensure                   => running,
    region                   => $discr33t_aws::aws_region,
    availability_zone        => 'us-east-1b',
    subnet                   => [
      'discr33t-publiczone02-sn'
    ],
    security_groups          => [
      'discr33t-master-sg'
    ],
    image_id                 => 'ami-6d1c2007',
    key_name                 => 'discr33t',
    instance_type            => 't2.micro',
    monitoring               => false,
    ebs_optimized            => false,
    tenancy                  => 'default',
    block_devices            => [
      {
        'delete_on_termination' => 'true',
        'device_name'           => '/dev/sda1',
        'volume_size'           => '8',
      },
    ],
    user_data => template('discr33t_aws/user_data/base.sh.erb'),
  }

  ec2_instance { 'discr33t-slave01':
    ensure            => running,
    region            => $discr33t_aws::aws_region,
    availability_zone => 'us-east-1a',
    subnet            => [
      'discr33t-privatezone01-sn'
    ],
    image_id          => 'ami-6d1c2007',
    key_name          => 'discr33t',
    instance_type     => 't2.micro',
    monitoring        => false,
    ebs_optimized     => false,
    tenancy           => 'default',
    block_devices     => [
      {
        'delete_on_termination' => 'true',
        'device_name'           => '/dev/sda1',
        'volume_size'           => '8',
      },
    ],
    user_data => template('discr33t_aws/user_data/base.sh.erb'),
  }

  ec2_instance { 'discr33t-slave02':
    ensure            => running,
    region            => $discr33t_aws::aws_region,
    availability_zone => 'us-east-1b',
    subnet            => [
      'discr33t-privatezone02-sn'
    ],
    image_id          => 'ami-6d1c2007',
    key_name          => 'discr33t',
    instance_type     => 't2.micro',
    monitoring        => false,
    ebs_optimized     => false,
    tenancy           => 'default',
    block_devices     => [
      {
        'delete_on_termination' => 'true',
        'device_name'           => '/dev/sda1',
        'volume_size'           => '8',
      },
    ],
    user_data => template('discr33t_aws/user_data/base.sh.erb'),
  }
}
