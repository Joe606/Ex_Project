package config;
use strict;
use warnings FATAL => 'all';
use DBI;



=pod
my $driver = "Pg";
my $database = "mydb";
my $dsn = "DBI:$driver:dbname=$database;host=127.0.0.1;port=5432";
my $userid = "postgres";
my $password = "like888***";
my $dbh = DBI->connect($dsn, $userid, $password, {RaiseError => 1}) or die $DBI::errstr;

print "open database successfully\n";
print "$dbh\n";

my $stat = qq(select * from  mydb;);
my $sth = $dbh->prepare($stat);
my $rv = $sth->execute() or die $DBI::errstr;

if($rv < 0){
	print $DBI::errstr;
}

while(my @row = $sth->fetchrow_array()){
	print "@row\n";
}

print "operation  done successfully\n";
$dbh->disconnect();
=cut

my $host = "localhost";         # 主机地址
my $driver = "Pg";           # 接口类型 默认为 localhost
my $database = "mydb";        # 数据库
# 驱动程序对象的句柄
my $dsn = "DBI:$driver:database=$database;host=$host";  
my $userid = "postgres";            # 数据库用户名
my $password = "like888***";        # 数据库密码
 
# 连接数据库
my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;
my $sth = $dbh->prepare("SELECT * FROM vm1");   # 预处理 SQL  语句
$sth->execute();    # 执行 SQL 操作
 
# 注释这部分使用的是绑定值操作
# $alexa = 20;
# my $sth = $dbh->prepare("SELECT name, url
#                        FROM Websites
#                        WHERE alexa > ?");
# $sth->execute( $alexa ) or die $DBI::errstr;
 
# 循环输出所有数据
while ( my @row = $sth->fetchrow_array() )
{
       print join('\t', @row)."\n";
}

my $type_info = $dbh->type_info_all;
print "@$type_info\n";


$sth->finish();
$dbh->disconnect();




1;