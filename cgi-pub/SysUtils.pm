# Copyright 1999, 2000 Interliant, Inc. 
# All Rights Reserved. 
# Name: SysUtils.pm
# Location: Woburn, MA
# Date modified: Tue Jan  4 14:34:21 EST 2000
# Version: 0.10
# Description: See perldoc below

package SysUtils;

use strict;
use vars qw/$VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS $DOCROOT/;
use Sys::Hostname;
use SysUtils::Logger;
use File::Find;

require Exporter;

@ISA = qw/Exporter SysUtils::Logger/;
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw//;
@EXPORT_OK = qw/WinOS UnixOS LinuxOS BSDiOS SunOS MacOS OS2 VMS 
	hostname CommandLine Zdocroot Zdocsubdir FileDelim Rm_R debug/;
%EXPORT_TAGS = (
   OSTYPE => [ qw/WinOS UnixOS LinuxOS BSDiOS SunOS MacOS OS2 VMS/ ]
);

$VERSION = '0.10';

{ my $c=join(' ',$0,@ARGV); sub CommandLine() { return $c }; }

sub WinOS()   { $^O eq 'MSWin32' ? 1 : 0 }
sub LinuxOS() { $^O eq 'linux'   ? 1 : 0 }
sub BSDiOS()  { $^O eq 'bsdi'    ? 1 : 0 }
sub SunOS()   { $^O eq 'solaris' ? 1 : 0 }
sub MacOS()   { $^O eq 'MacOS'   ? 1 : 0 }
sub OS2()     { $^O eq 'os2'     ? 1 : 0 }
sub VMS()     { $^O eq 'VMS'     ? 1 : 0 }
sub UnixOS()  { ! (WinOS || MacOS || VMS || OS2) }

sub FileDelim() { MacOS ? ':' : '/'; }

$DOCROOT = UnixOS ? ['','http'] : ['d:','http'];

sub Zdocsubdir($) {
   my ($dom)=shift;
   $dom =~ s/^www\.//i;
   
   my @chars=(split('', $dom, 3))[0,1];
   ($chars[1] eq '' || $chars[1] eq '.') and $#chars=0;

   return join(FileDelim, @chars);
}

sub Zdocroot($) {
   my($dom)=shift;
   $dom =~ s/^www\.//i;

   return join(FileDelim, ref($DOCROOT) ? @$DOCROOT : $DOCROOT, Zdocsubdir($dom), $dom);
}

sub Rm_R {
	local $_ = shift;
	print "$_\n";
	-d $_ || print "\nNothing to delete\n", return;	
	my $sub_r = sub { -d $_ ? rmdir : unlink };
	finddepth(\&$sub_r, @_);
}

sub debug {
    no strict "vars";
    $::DEBUG and print STDERR join(": ","DEBUG",(caller(1))[3] || 'main',@_),"\n";
}

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

SysUtils - A few basic routines for Interliant Engineering

=head1 SYNOPSIS

  use SysUtils qw/:OSTYPE hostname CommandLine 
				  FileDelim Zdocroot Zdocsubdir Rm_R debug/;

  WinOS; UnixOS; LinuxOS; BSDiOS; SunOS; VMS; MacOS;

  $host = hostname; # imported directly from Sys::Hostname;

  $fullpath = Zdocroot("foobar.com");
  $slash = FileDelim; # returns / or : depending on OS

  $How_I_was_called = CommandLine;
  
  Rm_R("c:/winnt"); # will delete recursively everything in the winnt dir
  
  $DEBUG=1;
  debug("Some message");


=head1 DESCRIPTION

So far, just a few things. But growing fast!

CommandLine will return the name of the calling program as it was typed on the command-line with all options.

FileDelim returns the correct File Path Delimiter for the current OS: Warning: it retursn ``/'' for both Unix and MSWin32, : under MacOS.  I don't know enough about other OS types.

Zdocsubdir() returns the the sub directory of a Zeus document root, ie: Zdocsubdir("foo.com") returns "f/o", Zdocsubdir("a.foo.com") returns "a".  This function uses FileDelim.  This breaks with really goofy domainnames like ".com".

Zdocroot returns a full path representing the document root of the domain passed into it for Zeus-style simple hashing.  The File Path Delimeter will reflect the current OS.  By default, the returned path will be in "/http" ("d:/http" under MSWin32); change this by setting $SysUtils::DOCROOT to something else.  If $SysUtils::DOCROOT is an array reference, the elements will be joined with the proper File Path Delimeter.  Zdocroot will never return a trailing File Path Delimeter.  Under MSWin32, Zdocroot will never attempt a leading "d:/" if you have set $SysUtils::DOCROOT.

  # Default behavior
  $fullpath = SysUtils::Zdocroot("www.foobar.com");
	   returns "/http/f/o/foobar.com" under Unix;
	   returns "d:/http/f/o/foobar.com" under MSWin32;

  # Get a relative path
  $SysUtils::DOCROOT="foo"
  $relpath = SysUtils::Zdocroot("foobar.com");
	   returns "foo/f/o/foobar.com" under MSWin32;

  # Get a relative path
  $SysUtils::DOCROOT=[ qw/.. foo bar/ ];
  $relpath = SysUtils::Zdocroot("foobar.com");
	   returns "../foo/bar/f/o/foobar.com" under Unix;

  # Get a leading slash
  $SysUtils::DOCROOT=["", qw/foo bar/ ];
  $fullpath = SysUtils::Zdocroot("foobar.com");
	   returns "/foo/bar/f/o/foobar.com" under Unix;

WinOS, UnixOS, LinuxOS, SunOS, VMS, MacOS, OS2, and BSDiOS all return booleans.  UnixOS is simply !(WinOS || VMS || MacOS || OS2).

Rm_R() recursively deletes files and folders beneath the directory you pass it. It will not delete the directory you pass to it, so if you want it all gone, use rmdir(dir); after you use Rm_R.

The debug() function is kinda nice.  Just set $DEBUG in main of your program to a boolean true and call debug with a string.  It will print to stderr your message with the subroutine's name and line number that called debug().

Nothing is exported by default.  Import all of the OS types with ``use SysUtils qw/:OSTYPE/''.

Centralized logging is available in SysUtils::Logger.

=head1 AUTHOR

Garrick Staples, gstaples@interliant.com

=head1 SEE ALSO

perl(1), Sys::Hostname, SysUtils::Logger, SysUtils::CGI.

=cut
