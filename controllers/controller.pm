package Controller;
use strict;
use warnings FATAL => 'all';
use DBI;
# use HTML::Template;
use lib "../models/";
use Db;
use Vm;

=pod
sub new {
    my ($class, $app) = @_;
    my $self = {
	             app => $app
                      }
    bless $self, $class;
    return $self;
}

sub add{
    my ($self, $vars) = @_;
    eval{"insert into mydb()values();"}
    return;
}
sub delete{}
sub alter{}
sub show{
    #my ($self, $vars) = @_;
    eval{"select * from mydb;"}
    return;
}
=cut

my $vm1 = Vm->new();
$vm1->select_db("vm1",1);


1;