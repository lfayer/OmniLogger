OmniLogger
==========

Simple Perl logger module to easily override print and die to an output of choice


USAGE:

Example of overriding print and die to automagically output to a file instead of STDOUT and STDERR.

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

Add a sub-class, inheriting OmniLogger.  Implement log function and, if needed, init and DESTROY.  See https://github.com/lfayer/OmniLogger/blob/master/OmniLogger/File.pm for sample implementation.

(examples and base details: http://fayerplay.com/print-override/

NOTES:
* Both print and die can be overridden at the same time
* Additional output modules can be added under OmniLogger::[Module]
* Will NOT work under frameworks, such as Mungo, where print is already overriden
