#!/usr/bin/perl
use LWP::UserAgent;
use HTTP::Request;
use LWP::Simple;

$sis="$^O";if ($sis eq linux){ $cmd="clear";} else { $cmd="cls"; }
system("$cmd");

if (!$ARGV[0]) {

$sis="$^O";if ($sis eq linux){ $cmd="clear";} else { $cmd="cls"; }
system("$cmd");

my @bannerzinho = (0,100..200);
my $variavelbanner = $bannerzinho[int rand @bannerzinho];

if ($variavelbanner % 2 == 0) {

&bannerUm();
exit;

}
else {
&bannerDois();
exit;
}
}

&bannerDois();

print q {
[+] Scaneando site...

};

open( SITE, "< $ARGV[0]" ) or die( "Nao foi possível abrir o arquivo: $!" );

our @array = <SITE>;

$numero = $#array;

for ($i = 0; $i <= $numero; $i++) {

$Dominio = "$array[$i]";

if($Dominio !~ /http:\/\//) { $Dominio = "http://$Dominio"; }


$cmd = "'";

$site = "$Dominio$cmd";

my $req=HTTP::Request->new(GET=>$site);
my $ua=LWP::UserAgent->new();
$ua->timeout(15);
my $resposta=$ua->request($req);

if($resposta->content =~ /You have an error in your SQL syntax/ ||
$resposta->content =~ /MySQL server version/ ||
$resposta->content =~ /Syntax error converting the nvarchar value/ ||
$resposta->content =~ /Unclosed/ ||
$resposta->content =~ /SQL Server error/ ||
$resposta->content =~ /JET/) {

print "\n \t $Dominio \n";

open (NOTEPAD, ">> SqlInjection.txt");
print NOTEPAD "$site\n";
close(NOTEPAD);

}
}

print q {

[+] FIM !
};


sub bannerUm {

print q {

oooooo   oooooo     oooo                     .o88o. oooo                       
 `888.    `888.     .8'                      888 `" `888                       
  `888.   .8888.   .8'    .oooo.   oooo d8b o888oo   888   .ooooo.  oo.ooooo.  
   `888  .8'`888. .8'    `P  )88b  `888""8P  888     888  d88' `88b  888' `88b 
    `888.8'  `888.8'      .oP"888   888      888     888  888   888  888   888 
     `888'    `888'      d8(  888   888      888     888  888   888  888   888 
      `8'      `8'       `Y888""8o d888b    o888o   o888o `Y8bod8P'  888bod8P' 
                                                                     888       
                                                                    o888o      
                                                                               
 .oooooo..o                                                                
d8P'    `Y8                                                                
Y88bo.       .ooooo.   .oooo.   ooo. .oo.   ooo. .oo.    .ooooo.  oooo d8b 
 `"Y8888o.  d88' `"Y8 `P  )88b  `888P"Y88b  `888P"Y88b  d88' `88b `888""8P 
     `"Y88b 888        .oP"888   888   888   888   888  888ooo888  888     
oo     .d8P 888   .o8 d8(  888   888   888   888   888  888    .o  888     
8""88888P'  `Y8bod8P' `Y888""8o o888o o888o o888o o888o `Y8bod8P' d888b    
                                                                           



[*] Como usar: perl scanner.pl sqlin.txt

[+] Scanner: Acesso Root []'s

};


}

sub bannerDois {

print q {
oooooo   oooooo     oooo                     .o88o. oooo                       
 `888.    `888.     .8'                      888 `" `888                       
  `888.   .8888.   .8'    .oooo.   oooo d8b o888oo   888   .ooooo.  oo.ooooo.  
   `888  .8'`888. .8'    `P  )88b  `888""8P  888     888  d88' `88b  888' `88b 
    `888.8'  `888.8'      .oP"888   888      888     888  888   888  888   888 
     `888'    `888'      d8(  888   888      888     888  888   888  888   888 
      `8'      `8'       `Y888""8o d888b    o888o   o888o `Y8bod8P'  888bod8P' 
                                                                     888       
                                                                    o888o      
                                                                               
 .oooooo..o                                                                
d8P'    `Y8                                                                
Y88bo.       .ooooo.   .oooo.   ooo. .oo.   ooo. .oo.    .ooooo.  oooo d8b 
 `"Y8888o.  d88' `"Y8 `P  )88b  `888P"Y88b  `888P"Y88b  d88' `88b `888""8P 
     `"Y88b 888        .oP"888   888   888   888   888  888ooo888  888     
oo     .d8P 888   .o8 d8(  888   888   888   888   888  888    .o  888     
8""88888P'  `Y8bod8P' `Y888""8o o888o o888o o888o o888o `Y8bod8P' d888b    
                                                                           



[*] Como usar: perl scanner.pl sqlin.txt

[+] Scanner: Acesso Root []'s
};

} 