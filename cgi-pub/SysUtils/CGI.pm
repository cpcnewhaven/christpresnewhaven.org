# Copyright 1999, 2000 Interliant, Inc. 
# All Rights Reserved. 
# Name: SysUtils::CGI.pm
# Location: Woburn, MA
# Date modified: Tue Jan  4 14:34:21 EST 2000
# Version: 0.09 
# Description: See perldoc below

package SysUtils::CGI;

use strict;
no strict qw/subs/;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $AUTOLOAD);

require Exporter;

@ISA = qw(Exporter AutoLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
	
);
$VERSION = '0.09';


# Preloaded methods go here.

sub new { 
    my $class=shift;
    my $self={};
    my $temp;

    bless($self, $class);

    if($ENV{'REQUEST_METHOD'} eq 'POST') {
	    $self->MyRequestMethod('post');
        read( STDIN, $temp, $ENV{'CONTENT_LENGTH'} );

    } elsif($ENV{'REQUEST_METHOD'} eq 'GET') {
	    $self->MyRequestMethod('get');
        $temp = $ENV{'QUERY_STRING'}; 

    } else {
	$self->MyCGIRequestMethod('offline');
	    print "Off-Line mode.  Enter name value pairs a line at a time.\n";
        my @name_pairs=(<>);   chomp(@name_pairs);
	    $temp=join('&',@name_pairs);
    }
    $self->MyQueryString($temp);

    my @pairs = split(/&/, $temp); 
    foreach my $item(@pairs) { 
        my($key,$content)=split(/=/, $item, 2); 
        $key=~tr/+/ /; 
        $key=~ s/%(..)/pack("c",hex($1))/ge; 
        $content=~tr/+/ /; 
        $content=~ s/%(..)/pack("c",hex($1))/ge; 
        $self->$key($content);
    } 
    return $self;
}

sub MyCGIRequiredFields {
   my $self=shift;
   my @ReqFields=@_;
   my @MissingFields;

   foreach my $f (@ReqFields) {
      push(@MissingFields,$f) unless $self->{_params}{$f};
   }
   return @MissingFields;
}

sub MyCGIFieldNames {
   my $self=shift;
   my @vals=keys %{$self->{_params}};
   return wantarray ? @vals : \@vals;
}

sub MyCGIQueryString {
   my $self=shift;
   return $self->{_query_string}=shift || $self->{_query_string};
}

sub MyCGIRequestMethod {
   my $self=shift;
   return $self->{_request_method}=shift || $self->{_request_method};
}

sub AUTOLOAD {
   my $self=shift;
   ref($self) || die "$self is not an object";
   my $myname;

   ($myname = $AUTOLOAD) =~ s/.*:://;

   $self->{_params}{$myname}=shift || $self->{_params}{$myname};
}


# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is the stub of documentation for your module. You better edit it!

=head1 NAME

SysUtils::CGI - Lightweight alternative to CGI.pm

=head1 SYNOPSIS

  use SysUtils::CGI;
  $cgi=new SysUtils::CGI;

  $cgi->somefield;  # returns the value of the field named "somefield"

  $cgi->MyCGIRequiredFields("someparamname","anothername");
	   # returns all field names NOT passed to MyCGIRequiredFields
  
  $cgi->MyCGIFieldNames(); # returns a list of all field names
  $cgi->MyCGIRequestMethod(); # returns 'get', 'post', or 'offline'
  $cgi->MyCGIQueryString(); # returns the query string

=head1 DESCRIPTION

  Pretty simple here.  Just "use" and "new" it to get a simple object and class instance for CGI input handling.  Use CGI.pm is you need anything fancy.

=head1 BUGS

  This module can't handle duplicate input field names.  This module is largely untested.  You can't have any fields named MyCGIRequiredFields, MyCGIFieldNames, MyCGIRequestMethod, or MyCGIQueryString.  Like I said, if you want anything fancy, use CGI.pm.

=head1 AUTHOR

Garrick Staples, gstaples@interliant.com

=head1 SEE ALSO

perl(1).

=cut
