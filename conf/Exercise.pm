package Exercise;

use strict;
use warnings;

sub new
{
    # my $class = shift;
    my $class = ref($_[0]);
    my $self = {
        _firstName => shift,
        _lastName  => shift,
        _ssn       => shift,
    };
    # 输出用户信息
    print "$class\n";
    print "$self->{_firstName}\n";
    print "$self->{_lastName}\n";
    print "$self->{_ssn}\n";

    bless $self, $class;
    return $self;
}

1;