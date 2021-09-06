package Vm;
use strict;
use warnings FATAL => 'all';

# use File::Basename;
use lib '.';
use Db;
our @ISA = qw(Db);
our ($dbh);

sub new{
	# my $class = @_;
	my $class = shift;
	my $self = $class->SUPER::new($_[1], $_[2], $_[3]);

	print "this is a subclass tag:$class\n";

	bless($self,$class);
	return $self;
}

# sub conn{
# 	print "inherit original\n";
# }

sub select_db{
	my($self,$table_name,$id,$name,$memory) = @_;
	my $sql_db;
	if(defined($id) and defined($name) and defined($memory)){
		$sql_db = "select $id,$name,$memory from $table_name;";
		print $sql_db."\n";
	}elsif(defined($id) && defined($name) && undef($memory)){
		$sql_db = "select $id,$name from $table_name;";
		print $sql_db."\n";

	}elsif(defined($id) or defined($name) or defined($memory)){
		$sql_db = "select $id from $table_name;";
		print $sql_db."\n";

	}
	
	if(@_){
		if (defined($table_name)) {
			# body...
			

			if(defined($id) || defined($name) ||defined($memory)){
				print "dayin $sql_db\n";
				print "$dbh\n";
				print "sth is what\n";
				my $sth = $dbh->prepare($sql_db);
				$sth->execute() or die $DBI::errstr;
				print "fetch data from database seccessfully\n";

				while(my @row = $sth->fetchrow_array()){
					print "@row\n";
				}
			}

		} 
	}
	return;
}

sub insert_db{
	my($self,$table_name,$id,$name,$memory) = @_;
	my $sql_db = qq{insert into $table_name(id,name,memory) values(?,?,?);};
	print "$sql_db\n";

	if(@_){
		if (defined($table_name)) {
			# body...
			

			if(defined($id) && defined($name) and defined($memory)){
				my $sth = $dbh->prepare($sql_db);
				$sth->execute($id,$name,$memory);
				print "populate data successfully\n";
			}

		} 
	}
}

sub update_db{
	my($self,$table_name,$id,$name,$memory) = @_;	
	my $sql_db = qq{update $table_name set name = ? where id = ?};  ###
	print "$sql_db\n";

	if(@_){
		if (defined($table_name)) {
			# body...
			

			if(defined($id) || defined($name) ||defined($memory)){
				my $sth = $dbh->prepare($sql_db);
				$sth->execute($name,$id);
				print "update successfully\n";
			}

		} 
	}
}

sub delete_db{
	my($self,$table_name,$id,$name,$memory) = @_;
	my $sql_db = qq{delete from $table_name where id = ?};
	#my $sql_db = qq{delete from $table_name where \$id > $id};
	if(@_){
		if (defined($table_name)) {
			# body...
			

			if(defined($id) || defined($name) ||defined($memory)){
				my $sth = $dbh->prepare($sql_db);
				$sth->execute($id) or die $DBI::errstr;
				print "delete successfully\n";
			}

		} 
	}

}

1;