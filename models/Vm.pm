package Vm;
use strict;
use warnings FATAL => 'all';

# use File::Basename;
use lib '.';
use Db;
our @ISA = qw(Db);

sub new{
	my $class = @_;
	my $self = $class->SUPER::new($_[1], $_[2], $_[3]);
	bless($self,$class);
	return $self;
}

sub select_db{
	my($self,$table_name,$id,$name,$memeory) = @_;
	my $sql_db = "select $id,$name,$memeory from $table_name;";
	if(@_){
		if (defined($table_name)) {
			# body...
			

			if(defined($id) || defined($name) ||defined($memeory)){
				my $sth = my $dbh->prepare($sql_db);
				$sth->execute() or die $DBI::errstr;

				while(my @row = $sth-fetchrow_array()){
					print "@row\n";
				}
			}

		} 
	}
	return 
}
sub insert_db{
	my($self,$table_name,$id,$name,$memeory) = @_;
	my $sql_db = qq{insert into $table_name values($id,$name,$memeory);};
	if(@_){
		if (defined($table_name)) {
			# body...
			

			if(defined($id) || defined($name) ||defined($memeory)){
				my $sth = my $dbh->prepare($sql_db);
				$sth->execute();
			}

		} 
	}
}
sub update_db{
	my($self,$table_name,$id,$name,$memeory) = @_;	
	my $sql_db = qq{update $table_name set \$name = $name where \$id = $id};  ###
	if(@_){
		if (defined($table_name)) {
			# body...
			

			if(defined($id) || defined($name) ||defined($memeory)){
				my $sth = my $dbh->prepare($sql_db);
				$sth->execute();
			}

		} 
	}
}
sub delete_db{
	my($self,$table_name,$id,$name,$memeory) = @_;
	my $sql_db = qq{delete from $table_name where \$id = $id};
	#my $sql_db = qq{delete from $table_name where \$id > $id};
	if(@_){
		if (defined($table_name)) {
			# body...
			

			if(defined($id) || defined($name) ||defined($memeory)){
				my $sth = my $dbh->prepare($sql_db);
				$sth->execute();
			}

		} 
	}

}

1;