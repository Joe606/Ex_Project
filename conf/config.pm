package config;
use strict;
use warnings FATAL => 'all';
use DBI;

my $driver = "Pg";
my $database = "mydb";
my $dsn = "DBI:$driver:dbname=$database;host=127.0.0.1;port=5432";
my $userid = "postgres";
my $password = "123456";
my $dbh = DBI->connect($dsn, $userid, $password, {RaiseError => 1}) or die $DBI::errstr;

print "open database successfully\n";


1;