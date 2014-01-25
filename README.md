OmniLogger
==========

Simple Perl logger module to easily override print and die to an output of choice


USAGE:

Standard function call:

```perl
use OmniLogger::File;

my $logger = OmniLogger::File->new;
$logger->log("Hello World!");
```

Global override of print:

```perl
#!/usr/bin/perl
use OmniLogger::File qw(stdout);

print "Hello World!";
```

Global override of die:

```perl
#!/usr/bin/perl
use OmniLogger::File qw(stderr);

die "Goodbye Cruel World!";
```

HOW TO ADD DIFFERENT OUTPUTS:
(examples and base details: http://fayerplay.com/print-override/

Add a sub-class, inheriting OmniLogger under OmniLogger/.  Implement log function and, if needed, init and DESTROY.  See https://github.com/lfayer/OmniLogger/blob/master/OmniLogger/File.pm for sample implementation.


NOTES:
* Both print and die can be overridden at the same type
* Additional output modules can be added under OmniLogger::[Module]
* Will NOT work under frameworks, such as Mungo, where print is already overriden
