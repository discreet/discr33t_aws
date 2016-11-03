class discr33t_aws::securitygroup {

  ec2_securitygroup { 'discr33t-http':
    ensure      => 'present',
    description => 'Allow remote access to http',
    ingress     => [
      {
        'cidr'      => '10.0.0.0/8',
        'from_port' => '80',
        'protocol'  => 'tcp',
        'to_port'   => '80'
      }
    ],
    region      => 'us-east-1',
    vpc         => 'discr33t',
  }

  ec2_securitygroup { 'discr33t-default':
    ensure      => 'present',
    description => 'default VPC security group',
    ingress     => [
      {
        'from_port'      => '0',
        'protocol'       => '-1',
        'security_group' => 'default',
        'to_port'        => '0'
      }
    ],
    region      => 'us-east-1',
    vpc         => 'discr33t',
  }

  ec2_securitygroup { 'discr33t-remoteaccess':
    ensure      => 'present',
    description => 'Allow Remote access via 22',
    ingress     => [
      {
        'cidr'      => '10.0.0.0/8',
        'from_port' => '22',
        'protocol'  => 'tcp',
        'to_port'   => '22'
      },
      {
        'cidr'      => '10.0.0.0/8',
        'from_port' => '-1',
        'protocol'  => 'icmp',
        'to_port'   => '-1'
      }
    ],
    region      => 'us-east-1',
    vpc         => 'discr33t',
  }
}
