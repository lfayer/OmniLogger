package OmniLogger::File;
use base 'OmniLogger';
use Filehandle;
 
my $_fh;
 
sub init {
    my $self = shift;
    $_fh = FileHandle->new($self->{config}->{'OmniLogger::File'}->{filename},"a+");
}
 
sub log {
    my $self = shift;
    my $msg = shift;
    if (defined $_fh) {
        $_fh->printf("%s","$msg\n");
    }
}
 
sub DESTROY { $_fh->close; }
 
1;
