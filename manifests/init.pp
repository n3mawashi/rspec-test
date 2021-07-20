# Test class to run rpsec against.

class nginx (
  String $docroot,  # This parameter can be passed in from Hiera or classification and can be tested with `let(:params)`
) {
  package { 'nginx':
    ensure => present,
  }
  file { $docroot:
    ensure => directory,
  }
  file { '/var/www/index.html':
    ensure  => file,
    require => Package['nginx'],
  }
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
