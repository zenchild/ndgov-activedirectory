# Example instantiation
#   class {'activedirectory':
#     adhost  => 'example.org',
#     adport  => '389',
#     basedn  => 'dc=example,dc=org',
#     aduser  => 'puppet@example.org',
#     adpass  => 'secret',
#   }
class activedirectory($adhost, $adport, $basedn, $aduser, $adpass) {

  # This definition takes a Hash to create a user from in the form:
  #   { samaccountname  => 'name',
  #     uidnumber       => 'uidnum',
  #     gidnumber       => 'gidnum'
  #   }
  define ads_user() {
    user { $name[samaccountname]:
      ensure      => present,
      uid         => $name[uidnumber],
      gid         => $name[gidnumber],
      comment     => $name[cn],
      managehome  => true,
    }
  }
}
