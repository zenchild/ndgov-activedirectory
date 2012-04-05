require 'net/ldap'

module Puppet::Parser::Functions
  # Return the members of a group.
  # Note: For the adport do not use the Global Catalog port (3268) because it will not
  #   return uidNumber or gidNumber.
  # @param [String] group the group name we want members of. This needs to be the full
  #   DN and not just a CN.
  # @return [Array<String>] an array of group members with their samaccountname 
  newfunction(:ad_members, :type => :rvalue) do |args|
    group = args[0]
    ldap      = Net::LDAP.new
    ldap.host = lookupvar('activedirectory::adhost')
    ldap.port = lookupvar('activedirectory::adport').to_i
    ldap.base = lookupvar('activedirectory::basedn')
    ldap.auth   lookupvar('activedirectory::aduser'), lookupvar('activedirectory::adpass')
    ldap.bind
    f = Net::LDAP::Filter.construct("(&(objectCategory=user)(memberof=#{group}))")
    attribs = %w{samaccountname uidnumber gidnumber}
    members = ldap.search(:filter => f, :attributes => attribs)

    members.map do |u|
      newh = {}
      u.attribute_names.each do |attr|
        newh[attr.to_s] = u[attr].first
      end
      newh
    end
  end
end
