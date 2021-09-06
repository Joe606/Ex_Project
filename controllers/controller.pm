package Controller;
use strict;
use warnings FATAL => 'all';
use DBI;
# use HTML::Template;
use FindBin;
use File::Spec;
# use lib 'E:\perl_project\Ex_Project\models\/';
use lib File::Spec->catdir($FindBin::Bin, '..', 'models');
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

my $vm1 = Vm->new("vm1",1,88);
$vm1->conn();
# $vm1->select_db("vm1","id");

$vm1->select_db("vm1","id","name","memory");
$vm1->insert_db("vm1",2,'no_2',98);
$vm1->update_db("vm1",2,"no_why");
$vm1->delete_db("vm1",2,'no_why',98);




1;