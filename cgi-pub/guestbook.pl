#!/usr/bin/perl

# Copyright 1999, 2000 Interliant, Inc. 
# All Rights Reserved. 
# Name: Ben Kersey
# Location: Woburn, MA
# Date modified: 1/21/2000
# Version: 0.02 
# Description: Web based guestbook.

#use Benchmark;
#use SendmailEx;
#use SysUtils qw/ Zdocroot/;
use lib "\\\\frigga\\home\\users\\web\\b3\\ph.d30028837\\cgi-pub";
use SysUtils::CGI;

$debug = 0;

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
# month needs to have 1 added due to the array starting from zero
# updated by Scott Lacy & Dave  Park 
# if ( $mon == 0 ) { #this line needs to be removed
# this line  needs to be added    
$mon += 1; 
#  } #this line needs to be added
$ year = 1900 + $year;

if ($ENV{OS} eq "Windows_NT") {
	$OS = "win";
    #$SysUtils::DOCROOT = "d:/http";
    ($dom = $ENV{SERVER_NAME}) =~ s/^www\.//;
    #($ROOT = Zdocroot($dom)) =~ s|\\|/|g;
    $DATADIR = getDataDir();
    $DATA = "data\\guestbook.dat";
    $PAGE = $ENV{SCRIPT_NAME};
} else {
    
    $DATADIR = "$ENV{DOCUMENT_ROOT}/data/";
    $DATA = "$DATADIR/guestbook.dat";
    $PAGE = $ENV{DOCUMENT_URI};
    $ROOT = $ENV{DOCUMENT_ROOT};
}

#if ( -f "$ROOT/data/guestbook.conf" ) {
#    require "$ROOT/data/guestbook.conf";
#}
#if ( -f "/config/formmailRule.cfg" ) {
#    require "/config/formmailRule.cfg";
#} else {
#    $MAX = 5;
#}
unless (-d "$ROOT/data" ){
	mkdir ("$ROOT/data", 0755);
}
$fields = new SysUtils::CGI;
if ($OS = "win") {
    print "\n\n";
@missing=$fields->MyCGIRequiredFields("name", "email", "message");
@missing && do {
    foreach $reqfield( @missing ) {
	    print "<font color=red><b>Error: $reqfield is a required field!</b></font><br>";
    }
    exit;  
} 
};


$fields->message(join ('<br>', split (/\r?\n/, $fields->message)));

if ($HTML == 0) {
    ($name = $fields->name) =~ s/%%/_/g; 
    $name =~s/</&lt\;/g;
    ($company = $fields->company) =~ s/%%/_/g;
    $company =~s/</&lt\;/g;
    ($email = $fields->email) =~ s/%%/_/g;
    $email =~s/</&lt\;/g;
    ($message = $fields->message) =~ s/%%/_/g;
    $message =~s/</&lt\;/g;
} else {
    $name = $fields->name;
    $company = $fields->company;
    $email = $fields->email;
    $message = $fields->message;
}
   
#print ("\n$DATADIR.lock\n");  
open(LOCKFILE, ">.lock") or die "Can't open lock file.";
flock (LOCKFILE, 2);
open(DATAFILE, ">>$DATA") or die "Can't open Data file $DATA\n $!";
print DATAFILE "$mon/$mday/$year%%$hour:$min:$sec%%",$name,"%%",$company,"%%",$email,"%%",$message,"\n";
close(DATAFILE);
close(LOCKFILE);

print "Content-type: text/html\n\n";
print "<HTML>";
print "<BODY>";
print "Thank you!  Your entry has been submitted.";
print "</BODY>";
print "</HTML>";

#NotifyMe();

# Debug
# Description:  Print the environment variables for debugging.

#if ($debug eq 1) {
#    $t0= new Benchmark;
#    $t1 = new Benchmark;
#    $td = timediff($t1, $t0);
#    print "<font color=blue><br>";
#    print "DOCROOT = $ROOT<br>";
#    print "DOMAIN = $ENV{HTTP_HOST}<br>";
#    print "LOG = $LOG<br>";
#    print "The code took: ", timestr($td);
#    print "</font>";
#}

#sub NotifyMe {
#    if ($NOTIFY == 1) {
#        my $name = $fields->name;
#        my $subject = "A new entry has been added";
#        my $message = "$name has added a new entry into your guestbook.";
#        $RETURN = SendMail($EMAIL, $fields->email, $subject, $message, $smtpserver, $MAX);
#        SpamFilter();
#    }
#}

#sub SpamFilter {
#
#    if (1 == $RETURN) {
#        print "<font color=red><b>Error: The referring domain is not on this server.</b></font><br>";
#        print LOGFILE "ERROR: THE REFERRING DOMAIN IS NOT ON THIS SERVER. Date=$mon/$mday/$year,Time=$hour:$min:$sec,To=",$fields->to,"From=",$fields->from,"Subject=",$fields->subject,"\n";
#        exit;
#    }
#    
#    if (2 == $RETURN) {
#        print "<font color=red><b>Error: More than $MAX recipients were detected.</b></font><br>";
#        print LOGFILE "ERROR: MORE THAN $MAX RECIPIENTS WERE DETECTED. Date=$mon/$mday/$year,Time=$hour:$min:$sec,To=",$fields->to,"From=",$fields->from,"Subject=",$fields->subject,"\n";
#        exit;
#    }
#}


sub getDataDir{

#my $datadir = $ENV{PATH_TRANSLATED};
#my @array = split(/\\/, $datadir);
#my $num=0;
#my $lastnumber = 0;
#foreach (@array){
#	if ($_ eq "cgi-pub"){
#		$lastnumber= $num;
#	}
#	$num++;
#}
my $string = "\\\\frigga\\home\\users\\web\\b877\\ph.d3005055850\\data\\";
#for(my $i=0; $i<$lastnumber ; $i++){
#	$string .= $array[$i] . "/" ;
#}
#$string .="data";
return $string;

}
