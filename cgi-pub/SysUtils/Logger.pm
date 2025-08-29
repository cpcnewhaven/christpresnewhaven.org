# Copyright 1999, 2000 Interliant, Inc. 
# All Rights Reserved. 
# Name: SysUtils::Logger.pm
# Location: Woburn, MA
# Date modified: Tue Jan  4 14:33:08 EST 2000
# Version: 0.09 
# Description: Simple Perl interface for logging


package SysUtils::Logger;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $AUTOLOAD);
use POSIX qw(strftime);

require Exporter;

@ISA = qw(Exporter AutoLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
	
);
$VERSION = '0.09';

my $DEFAULT_LOG_FILE = 'syslog.log';
my $DEFAULT_FACILITY = $0;

# Preloaded methods go here.

sub new {
   my $class=shift;
   my $attr=shift;
   my $self={};

   bless($self, $class);

   $attr->{log_file} and $self->log_file($attr->{log_file});
   $attr->{facility} and $self->facility($attr->{facility});
   $self->pid($$);

   return $self;
}

sub _open_logfile {
   my $self=shift;
   my $file=shift;

   open(LOGGER, ">> $file") 
	  or print STDERR "SysUtils::Logger: Warning: cannot open $file\n";
   $self->file_handle(*LOGGER);

   return *LOGGER;
}

sub _close_logfile {
   my $self=shift;
   my $fh=$self->file_handle;
   close ($fh);
}

sub date() {
   strftime "%b %d %H:%M:%S", localtime;
}

sub logger {
   my $self=shift;
   my $message=shift;
   my $fh=$self->file_handle;
   print $fh date, " ", $self->facility, "[",$self->pid,"]: $message\n";
}

sub log_file {
   my $self=shift;
   $self->{_log_file}=shift || $self->{_log_file} || $DEFAULT_LOG_FILE;
   if ( defined($self->file_handle) ) {
	  $self->_close_logfile
   }
   $self->_open_logfile($self->{_log_file});
}

sub facility {
   my $self=shift;
   return $self->{_facility}=shift || $self->{_facility} || $DEFAULT_FACILITY;
}

sub file_handle {
   my $self=shift;
   return $self->{_file_handle}=shift || $self->{_file_handle};
}

sub pid {
   my $self=shift;
   return $self->{_pid}=shift || $self->{_pid};
}

sub DESTROY {
   my $self=shift;
   $self->{_file_handle}=undef;
}


# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is the stub of documentation for your module. You better edit it!

=head1 NAME

SysUtils::Logger - Simple logging interface

=head1 SYNOPSIS

  use SysUtils;

  $log_obj=new SysUtils::Logger( {log_file => '/var/log/logfile.log',
		 		  facility => 'program_name'});
  $log_obj->logger("Log This!");

  or

  $log_obj=new SysUtils::Logger;
  $log_obj->log_file('/var/log/logfile.log');
  $log_obj->facility('program_name');
  $log_obj->logger("Log This!");


=head1 DESCRIPTION

  Prints "date [pid] facility: $message\n" to log_file. Both facility and log_file are optional.  If facility is not passed, the default is the program name.  If log_file is not passed, the default is syslog.log in the current directory.
  Future versions may have a setuid portion that will allow any user to log to a central log file.

=head1 AUTHOR

Garrick Staples, gstaples@interliant.com "But don't hold me to it"

=head1 SEE ALSO

perl(1).

=cut
