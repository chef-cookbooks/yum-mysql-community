default['yum']['mysql55-community']['repositoryid'] = 'mysql55-community'
default['yum']['mysql55-community']['gpgkey'] = 'https://raw.githubusercontent.com/chef-cookbooks/yum-mysql-community/master/files/mysql_pubkey.asc'
default['yum']['mysql55-community']['description'] = 'MySQL 5.5 Community Server'
default['yum']['mysql55-community']['failovermethod'] = 'priority'
default['yum']['mysql55-community']['gpgcheck'] = true
default['yum']['mysql55-community']['enabled'] = true

case node['platform_family']
when 'rhel'
  case node['platform']
  when 'redhat', 'oracle' # ~FC024
    case node['platform_version'].to_i
    when 5
      # Real Redhat identifies $releasever as 5Server and 6Server
      default['yum']['mysql55-community']['baseurl'] = 'http://repo.mysql.com/yum/mysql-5.5-community/el/5/$basearch/'
    when 6
      default['yum']['mysql55-community']['baseurl'] = 'http://repo.mysql.com/yum/mysql-5.5-community/el/6/$basearch/'
    when 7
      default['yum']['mysql55-community']['baseurl'] = 'http://repo.mysql.com/yum/mysql-5.5-community/el/7/$basearch/'
    end
  else # other rhel. only 6 and 7 for now
    default['yum']['mysql55-community']['baseurl'] = 'http://repo.mysql.com/yum/mysql-5.5-community/el/$releasever/$basearch/'
  end
when 'amazon'
  case node['platform_version']
  when /201.*/
    default['yum']['mysql55-community']['baseurl'] = 'http://repo.mysql.com/yum/mysql-5.5-community/el/6/$basearch/'
  when /2\..*/
    default['yum']['mysql55-community']['baseurl'] = 'http://repo.mysql.com/yum/mysql-5.5-community/el/7/$basearch/'
  else
    default['yum']['mysql55-community']['baseurl'] = 'http://repo.mysql.com/yum/mysql-5.5-community/el/6/$basearch/'
  end
end
