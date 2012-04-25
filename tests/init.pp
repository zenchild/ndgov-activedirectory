class {'activedirectory':
  adhost  => 'example.com',
  adport  => '389',
  basedn  => 'dc=example,dc=com',
  aduser  => 'puppetldap@example.com',
  adpass  => 'secret',
}

#$users = ads_members("CN=UNIX Admin, DC=example, DC=com"
$users = [
  {'samaccountname'  => 'tuser',
   'comment'         => 'Test User',
   'uidnumber'       => '5000',
   'gidnumber'       => '100'},
  {'samaccountname'  => 'tuser2',
   'uidnumber'       => '5001',
   'gidnumber'       => '100'}
]
 
activedirectory::ads_user { $users: }
