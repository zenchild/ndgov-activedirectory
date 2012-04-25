# Active Directory users module for Puppet

## Design decisions

* net-ldap instead of ruby-ldap
Since the API is a bit easier and cleaner to work with we decided to use Net::LDAP as
the underly LDAP library. We realize there may be a performance trade-off in comparison
to RubyLDAP but in our tests it really didn't matter all that much.

## Goals

### TODO
* Create a user based on samaccountname
* Map an AD Group to a UNIX group
* If disabled in AD, disable on UNIX
** also configurable to delete
** remove SSH keys
*** :ensure => absent


### DONE
* Have the ability to populate users from a given Active Directory (AD) group 
