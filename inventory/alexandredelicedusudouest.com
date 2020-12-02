[http]
etno

[sql]
stereo

[all:vars]
httpd=apache
application=git
source_host_ip=37.187.55.118
name=alexandredelicedusudouest
domain=alexandredelicedusudouest.com
repository=git@github.com:madef/alexandredelicedusudouest.git
version=prod
writing_dirs=[]
alias=[]
create_root_dir=false
mysql_host=91.121.68.131
mysql_database=alexandredelicedusudouest
mysql_user=alexandredelicedusudouest
