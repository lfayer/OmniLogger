package OmniLogger::File;
use base 'OmniLogger';
use Filehandle;
use POSIX qw( strftime );
 
my $_fh;
 
sub init {
  my $self = shift;
  $_fh = FileHandle->new($self->{config}->{'OmniLogger::File'}->{filename},"a+");
  $self->SUPER::init(@_);
}
 
sub log {
  my $self = shift;
  my $msg = shift;
  if (defined $_fh) {
    $_fh->printf("%s","[".strftime("%Y-%m-%d %H:%M:%S", localtime(time))."] $msg\n");
  }
}
 
sub DESTROY { $_fh->close; }
 
1;
