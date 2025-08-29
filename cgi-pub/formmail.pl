#!/usr/bin/perl
# Copyright 1999, 2000 Interliant, Inc. 
# All Rights Reserved. 
# Name: Ben Kersey
# Location: Woburn, MA
# Date modified: 1/21/2000
# Version: 0.02 
# Description: Script to allow users to send email from a web based form.

use Benchmark;
use SendmailEx;
use SysUtils  qw/ Zdocroot/;
use SysUtils::CGI;

# Define the SMTP server
$smtpserver = "127.0.0.1";
############################################

$debug = 0;

#($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);

if ($^O eq "MSWin32") {
    $OS = "win";
    $SysUtils::DOCROOT = "d:/http";
    ($ROOT = Zdocroot($ENV{SERVER_NAME})) =~ s|\\|/|g;
#    $LOGDIR = "$ROOT/data";
#    $LOG = "$LOGDIR/formmail.log";
    $HEADER = "Content-type: text/html\n\n";
} else {
    $OS = "unix";
#    $LOGDIR = "$ENV{DOCUMENT_ROOT}/data";
#    $LOG = "$LOGDIR/formmail.log";
    $ROOT = $ENV{DOCUMENT_ROOT};
    $HEADER = "Content-type: text/html\n\n";
}

if ( -f "/config/formmailRule.cfg" ) {
    require "/config/formmailRule.cfg";
} else {
    $MAX = 5;
}


mkdir ("$ROOT/data", 0755);

#$log_obj=new SysUtils::Logger;
#$log_obj->log_file($LOG);

$fields = new SysUtils::CGI;
if ($os eq "win") {
    print "\n\n";
}

@missing=$fields->MyCGIRequiredFields("to", "from", "message");
@missing && do {
    print $HEADER;
    foreach $reqfield( @missing ) {
	    print "<font color=red><b>Error: $reqfield is a required field!</b></font><br>";
#	    $log_obj->logger("ERROR: $reqfield IS A REQUIRED FIELD!");
    }
    exit;   
};

$name = $fields->name;
$to = $fields->to;
$from = $fields->from;
$subject = $fields->subject;
$message = $fields->message;
$message = "E-mail From: $name\n\n\n" . $message;

$RETURN = SendMail($to, $from, $subject, $message, $smtpserver, $MAX);
SpamFilter();






#$log_obj->logger("To=$to From=$from Subject=$subject Message=$message");



# Debug
# Description:  Print the environment variables for debugging.

if ($debug eq 1) {
    $t0= new Benchmark;
    $t1 = new Benchmark;
    $td = timediff($t1, $t0);
    print "<font color=blue><br>";
    print "DOCROOT = $ROOT<br>";
    print "DOMAIN = $ENV{HTTP_HOST}<br>";
    print "LOG = $LOG<br>";
    print "The code took: ", timestr($td);
    print "</font>";
}

sub SpamFilter {

    if (1 == $RETURN) {
        print $HEADER;
        print "<font color=red><b>Error: The referring domain is not on this server.</b></font><br>";
#        $log_obj->logger("ERROR: THE REFERRING DOMAIN IS NOT ON THIS SERVER");
        exit;
    }
    
    if (2 == $RETURN) {
        print $HEADER;
        print "<font color=red><b>Error: More than $MAX recipients were detected.</b></font><br>";
#        $log_obj->logger("ERROR: MORE THAN $MAX RECIPIENTS WERE DETECTED");
        exit;
    }
}

print $HEADER;
print "<HTML>";
print "<BODY>";
print "<b>Thank you!  Your e-mail has been sent to $to.</b>";
print "</BODY>";
print "</HTML>";

