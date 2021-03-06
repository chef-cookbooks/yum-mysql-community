default['yum']['mysql57-community']['repositoryid'] = 'mysql57-community'
default['yum']['mysql57-community']['gpgkey'] = 'http://repo.mysql.com/RPM-GPG-KEY-mysql'
default['yum']['mysql57-community']['description'] = 'MySQL 5.7 Community Server'
default['yum']['mysql57-community']['failovermethod'] = 'priority'
default['yum']['mysql57-community']['gpgcheck'] = true
default['yum']['mysql57-community']['enabled'] = true

case node['platform_family']
when 'rhel'
  default['yum']['mysql57-community']['baseurl'] = 'http://repo.mysql.com/yum/mysql-5.7-community/el/$releasever/$basearch/'
when 'fedora'
  default['yum']['mysql57-community']['baseurl'] = 'http://repo.mysql.com/yum/mysql-5.7-community/fc/$releasever/$basearch/'
when 'amazon'
  default['yum']['mysql57-community']['baseurl'] =
    case node['platform_version'].to_i
    when /201./
      'http://repo.mysql.com/yum/mysql-5.7-community/el/6/$basearch/'
    when 2
      'http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/'
    else
      'http://repo.mysql.com/yum/mysql-5.7-community/el/6/$basearch/'
    end
end
