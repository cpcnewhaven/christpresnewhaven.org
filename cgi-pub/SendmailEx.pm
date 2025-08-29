# Copyright 1999, 2000 Interliant, Inc. 
# All Rights Reserved. 
# Name: Ben Kersey
# Location: Woburn, MA
# Date modified: 1/4/2000
# Version: 0.01 
# Description: Module to send email.

package SendmailEx;

use strict;
use Exporter;
use vars qw/$VERSION @ISA @EXPORT/;

@ISA=qw/Exporter/;

@EXPORT=qw/&SendMail/;
$VERSION=0.1;

use Net::SMTP;

sub SendMail {
    my ($to, $from, $subject, $message, $server, $max) = @_;
    return undef unless $message;
    
    my $host=(split(m|/|,$ENV{HTTP_REFERER}))[2];
        
    if ($host != $ENV{HTTP_HOST}) {
        return 1;
    }
    
    my @recipients = split (/,/, $to);
    @recipients + 0;
    
    if (scalar(@recipients) > $max) {
        return 2;
    }

    #my $smtp = Net::SMTP->new($server || $ENV{SMTPHOST} || 'mail.sagenetworks.com');
    my $smtp = Net::SMTP->new();
    return undef unless defined($smtp);
    
    foreach my $email (@recipients) {
    
        $smtp->mail($from);
        $smtp->to($email);

        $smtp->data();
        $smtp->datasend("To: $email\n");
        $smtp->datasend("Subject: $subject\n");
        $smtp->datasend("\n");
        $smtp->datasend("$message");
        $smtp->dataend();
    }
    
        $smtp->quit;
        
        return $smtp;
}

1;
