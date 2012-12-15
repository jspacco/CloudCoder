#! /usr/bin/perl -w

use strict;
use FileHandle;

# Bootstrap CloudCoder on an Ubuntu server

print <<"GREET";
Welcome to the CloudCoder bootstrap script.

By running this script, you will create a basic CloudCoder
installation on a server running Ubuntu Linux.

Make sure to run this script from a user account that has
permission to run the "sudo" command.  If you see the
following prompt:

  sudo password>>

then you will need to type the account password and press
enter.
GREET

my $readyToStart = ask("\nReady to start? (yes/no)");
exit 0 if ((lc $readyToStart) ne 'yes');

print "\nFirst, please enter some configuration information...\n\n";

# Get minimal required configuration information
my $ccUser = ask("What username do you want for your CloudCoder account?");
my $ccPasswd = ask("What password do you want for your CloudCoder account?");
my $ccFirstName = ask("What is your first name?");
my $ccLastName = ask("What is your last name?");
my $ccEmail = ask("What is your email address?");
my $ccWebsite = ask("What is the URL of your personal website?");
my $ccMysqlRootPasswd = ask("What password do you want for the MySQL root user?");
my $ccMysqlCCPasswrd = ask("What password do you want for the MySQL cloudcoder user?");
my $ccHostname = ask("What is the hostname of this server?");

# Install required packages





sub ask {
	my ($question, $defval) = @_;

	print "$question\n";
	if (defined $defval) {
		print "[default: $defval] ";
	}
	print "==> ";

	my $value = <STDIN>;
	chomp $value;

	if ((defined $defval) && $value =~ /^\s*$/) {
		$value = $defval;
	}

	return $value;
}