#!/usr/bin/perl

use strict;
use warnings;
use IO::Socket::INET;

	my $length = scalar(@ARGV);
	
	if ( $length != 3 && $length != 4 )
	{
		print "\n[Host] [Start] [End] [Timeout]\n";
		exit;
	}
	
	my $host = $ARGV[0];
	my $start = $ARGV[1];
	my $end = $ARGV[2];
	my $timeout = 2;
	
	if ( $ARGV[3] )
	{
		$timeout = $ARGV[3];
	}
	
	print "\nConnessione a ".$host." - Timeout ".$timeout."\n\n";
	my $response;
	my $port;
	
	for ( $port = $start ; $port <= $end ; $port++ )
	{
		$response = IO::Socket::INET->new(
		PeerAddr => $host,
		PeerPort => $port,
		Proto => "tcp",
		Timeout => $timeout
		);
		
		if ( $response )
		{
			print "Porta ".$port." : Aperta\n";
		}
		else
		{
			print "Porta ".$port." : Chiusa\n";
		}
	}
