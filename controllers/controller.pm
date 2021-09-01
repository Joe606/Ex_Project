package controller;
use strict;
use warnings FATAL => 'all';
use DBI;
use HTML::Template;

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



1;