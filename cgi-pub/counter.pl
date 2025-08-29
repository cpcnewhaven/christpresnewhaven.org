#!/usr/bin/perl

# Copyright 1999, 2000 Interliant, Inc. 
# All Rights Reserved. 
# Name: Ben Kersey
# Location: Woburn, MA
# Date modified: 1/21/2000
# Version: 0.02 
# Description: Webpage counter.
#use SysUtils qw/ Zdocroot/;
#use Benchmark;

$debug = 0;

if ($ENV{OS} eq "Windows_NT") {
 
    #$SysUtils::DOCROOT = "d:/http";
    ($dom = $ENV{SERVER_NAME}) =~ s/^www\.//;
    #($ROOT = Zdocroot($dom)) =~ s|\\|/|g;
    $DATADIR = getDataDir();
    $DATA = "$DATADIR/counter.dat";
    $PAGE = $ENV{SCRIPT_NAME};
    print "Content-type: text/html\n\n";   
} else {
    
    $DATADIR = "$ENV{DOCUMENT_ROOT}/data/";
    $DATA = "$DATADIR/counter.dat";
    $PAGE = $ENV{DOCUMENT_URI};
    $ROOT = $ENV{DOCUMENT_ROOT};
    print "Content-type: text/html\n\n";
}
MakeDirs();

@numbers = split (//, NextNumber());

foreach $num (@numbers) {
    $USERDIR = "/home/bizland/images/dhcounter/$num.gif";
    $IMAGES = "http://www.purehost.com/images/dhcounter/$num.gif";
    $URL = "http://www.purehost.com/images/dhcounter/$num.gif";
    if (-f $USERDIR) {
        $IMAGES = $URL;
    }
    print "<img src=$IMAGES>";
}

# Name: NextNumber
# Var out: $DATA{$PAGE}
# Description: Increment the number in the data file for a specific page.
# If the page doesn't exist in the data file, create it.

sub NextNumber {
    open(LOCKFILE, ">$DATADIR.lock") || MakeDirs();
    flock (LOCKFILE, 2);
    open(DATFILE, $DATA) || MakeDirs();
    while ($line = <DATFILE>) {
        ($uri,$count) = split (",", $line);
        chomp($count);
        $DATA{$uri} = $count;
   }
    close DATFILE;
    $DATA{$PAGE}++;
    open(DATFILE, ">$DATA");
    foreach (keys(%DATA)) {
        print DATFILE "$_,$DATA{$_}\n";
    }
    close DATFILE;
    close LOCKFILE;
    return $DATA{$PAGE};
}

# Name: MakeDirs
# Description: Make the directories for the data file.

sub MakeDirs {
    mkdir ("$ROOT/data", 0755);
    mkdir ("$ROOT/images/counter", 0755);
}

# Debug
# Description:  Print the environment variables for debugging.


if ($debug eq 1) {
    $t0= new Benchmark;
    $t1 = new Benchmark;
    $td = timediff($t1, $t0);
    print "<font color=blue><br>";
    print "DOCROOT = $ROOT<br>";
    print "DOMAIN = $ENV{HTTP_HOST}<br>";
    print "URI = $PAGE<br>";
    print "The code took: ", timestr($td);
    print "</font>";
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
