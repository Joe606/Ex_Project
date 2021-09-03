package Ex_Project::Models::Db;

use strict;
use warnings;

use DBI;

sub new{
	my ($class) = shift;
	my $self = {
		_app => shift,
		_db => undef,
	};

	bless($self, $class);
	return $self;
}

sub conn{


	my $host = "localhost";         # 主机地址
	my $driver = "Pg";           # 接口类型 默认为 localhost
	my $database = "mydb";        # 数据库
	# 驱动程序对象的句柄
	my $dsn = "DBI:$driver:database=$database:$host";  
	my $userid = "postgres";            # 数据库用户名
	my $password = "like888***";        # 数据库密码
	 
	# 连接数据库
	my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;

	#show data you need
	my $sth = $dbh->prepare("SELECT * FROM vm1");   # 预处理 SQL  语句
	$sth->execute();    # 执行 SQL 操作
	 
	# 循环输出所有数据
	while ( my @row = $sth->fetchrow_array() )
	{
	       print join('\t', @row)."\n";
	}

	$sth->finish();
	# $dbh->disconnect();

}

sub add{
	my ($self, $id, $name, $memory) = @_;
	$sql = "insert into table_name(id,name,$memory) values($id,$name,$memory);"
	$sth = $dbh->prepare($sql);
	$sth->execute();
	return;
	
}

sub show_all{
	my ($self, $table_name) = @_;
	$sql = "select * from $table_name;";
	$sth = $dbh->prepare($sql);
	$sth->execute();

	while ( my @row = $sth->fetchrow_array() )
	{
	       print join('\t', @row)."\n";
	}

	return;
}

sub show_one{
	my ($self, $table_name, $id) = @_;  #id/name/memory
	$sql = "select * from $table_name where \$id = $id;";
	$sth = $dbh->prepare($sql);
	$sth->execute();

	while ( my @row = $sth->fetchrow_array() )
	{
	       print join('\t', @row)."\n";
	}

	return;
}

sub change{
	my $self = @_;

}

sub delete{
	my $self = @_;

}







1;


