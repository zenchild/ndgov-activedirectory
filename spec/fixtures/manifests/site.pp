node default {
  notify { 'test': }
}

node /testhost/ {
  class {'activedirectory':
    adhost  => 'example.com',
    adport  => '389',
    basedn  => 'dc=example,dc=com',
    aduser  => 'puppetldap@example.com',
    adpass  => 'secret',
  }
}
