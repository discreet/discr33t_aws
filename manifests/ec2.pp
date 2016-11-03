class discr33t_aws::ec2 {

  ec2_instance { 'discr33t-master01':
    ensure                   => running,
    region                   => 'us-east-1',
    availability_zone        => 'us-east-1a',
    subnet                   => [
      'discr33t-privatezone01'
    ],
    security_groups          => [
      'discr33t-default',
      'discr33t-remoteaccess'
    ],
    image_id                 => 'ami-6d1c2007',
    key_name                 => 'discr33t',
    instance_type            => 't2.micro',
    monitoring               => false,
    ebs_optimized            => false,
    iam_instance_profile_arn => 'arn:aws:iam::949402414914:instance-profile/Discr33tAdmin',
    virtualization_type      => 'hvm',
    block_devices            => [
      {
        'delete_on_termination' => 'true',
        'device_name'           => '/dev/sda1'
      }
    ],
  }

  ec2_instance { 'discr33t-master02':
    ensure                   => running,
    region                   => 'us-east-1',
    availability_zone        => 'us-east-1b',
    subnet                   => [
      'discr33t-privatezone02'
    ],
    security_groups          => [
      'discr33t-default',
      'discr33t-remoteaccess'
    ],
    image_id                 => 'ami-6d1c2007',
    key_name                 => 'discr33t',
    instance_type            => 't2.micro',
    monitoring               => false,
    ebs_optimized            => false,
    iam_instance_profile_arn => 'arn:aws:iam::949402414914:instance-profile/Discr33tAdmin',
    virtualization_type      => 'hvm',
    block_devices            => [
      {
        'delete_on_termination' => 'true',
        'device_name'           => '/dev/sda1'
      }
    ],
  }
}
