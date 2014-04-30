package OmniLogger;
use Symbol;
use Config::Tiny;
 
sub import {
  my $self = shift;
  $self->load_config;
  foreach (@_) {
    if ($_ eq 'stdout') {
      *STDOUT = $self->new;
    } elsif ($_ eq 'stderr') {
      *STDERR = $self->new;
    }
  }
  $self->init(@_);
}
 
sub new {
  my $self = shift;
  my $sym = gensym;
  tie *$sym, $self;
  bless $sym, $self;
}
 
sub TIEHANDLE { bless {}, shift }
 
sub PRINT { shift->log(shift)}
 
sub init { return; }
 
sub log { return; }

sub load_config { shift->{config} = Config::Tiny->read('OmniLogger/omnilogger.conf'); }
 
sub DESTROY { return; }
 
1;
