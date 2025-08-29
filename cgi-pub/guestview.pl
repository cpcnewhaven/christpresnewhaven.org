#!/usr/bin/perl
# Copyright 1999, 2000 Interliant, Inc. 
# All Rights Reserved. 
# Name: Ben Kersey
# Location: Woburn, MA
# Date modified: 1/21/2000
# Version: 0.04 
# Description: View guestbook entries.
# 


#use SysUtils qw/ Zdocroot/;
use lib "\\\\frigga\\home\\users\\web\\b3\\ph.d30028837\\cgi-pub";
use SysUtils::CGI;

if ($ENV{OS} eq "Windows_NT") {
	$OS = "win";
    #$SysUtils::DOCROOT = "d:/http";
    ($dom = $ENV{SERVER_NAME}) =~ s/^www\.//;
    #($ROOT = Zdocroot($dom)) =~ s|\\|/|g;
    $DATA = "data\\guestbook.dat";
    $PAGE = $ENV{SCRIPT_NAME};
    print "Content-type: text/html\n\n";   
} else {
    
    $DATA = "$DATADIR/guestbook.dat";
    $PAGE = $ENV{DOCUMENT_URI};
    $ROOT = $ENV{DOCUMENT_ROOT};
    print "Content-type: text/html\n\n";
}

$fields = new SysUtils::CGI;

if (!$fields->end) {
    $num=0;
} else {
    $num = $fields->end;
}

if (! -f $DATA) {
    print "<b>There are currently no guestbook entries.</b>";
    exit;
}

open(DATFILE, $DATA) or die "Can't open $DATA!\n";
while ($line = <DATFILE>) {
    push @entries, $line;
}
close(DATAFILE);

@entries + 0;
scalar(@entries);

$end = scalar(@entries);

@new = reverse @entries;
PrintEntries();

sub PrintEntries {

    if ($fields->bbutton) {
        $num = $fields->begin - 10;
        $current = $num + 10;
    } else {
        $current = $num + 10;
    }

    if ($current > $end) {
        $current = $end;
    }
    
    $start = $num;

    print "<b>Viewing:  $num - $current</b><br>\n";
    print "<b>Total Entries: $end</b><br><br>\n";

    while ($num < $current) {
        $stuff = $new[$num];
        ($date,$time,$name,$company,$email,$message) = split ("%%", $stuff);
        print "Name: $name<br>
	       Company: $company<br>
	       Email: <a href=mailto:$email>$email</a><br>
	       $date $time<br><br>
	       <table><tr><td>$message</table><br>
               <hr>\n";
        $num++;
    }
  
    if ($os eq "win") {
            print "<form action=guestview.shtml method=POST>
               <input type=hidden name=begin value=$start>
               <input type=hidden name=end value=$current>";
        } else {
            print "<form action=guestview.shtml method=GET>
               <input type=hidden name=begin value=$start>
               <input type=hidden name=end value=$current>";
    }
 
    if ($num > 10 && $current eq $end) {
        print "<input type=submit name=bbutton value=\"Back\"></form>";
    } elsif ($current < $end) {
        if ($current > 10) {
            print "<input type=submit name=bbutton value=\"Back\">
               <input type=submit name=nbutton value=\"Next Page\"></form>";
        } else {
            print "<input type=submit name=nbutton value=\"Next Page\"></form>";
        }
    }
}


sub getDataDir{

my $datadir = $ENV{PATH_TRANSLATED};
my @array = split(/\\/, $datadir);
my $num=0;
my $lastnumber = 0;
foreach (@array){
	if ($_ eq "cgi-pub"){
		$lastnumber= $num;
	}
	$num++;
}
my $string;
for(my $i=0; $i<$lastnumber ; $i++){
	$string .= $array[$i] . "/" ;
}
$string .="data";
return $string;

}
