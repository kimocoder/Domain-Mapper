# *************************************************************************************** #
# ---------------------------------- EULA NOTICE ---------------------------------------- #
#                     Agreement between "Haroon Awan" and "You"(user).                    #
# ---------------------------------- EULA NOTICE ---------------------------------------- #
#  1. By using this piece of software your bound to these point.                          #
#  2. This an End User License Agreement (EULA) is a legal between a software application #
#     author "Haroon Awan" and (YOU) user of this software.                               #
#  3. This software application grants users rights to use for any purpose or modify and  #
#     redistribute creative works.                                                        #
#  4. This software comes in "is-as" warranty, author "Haroon Awan" take no responsbility #
#     what you do with by/this software as your free to use this software.                #
#  5. Any other purpose(s) that it suites as long as it is not related to any kind of     #
#     crime or using it in un-authorized environment.                                     #
#  6. You can use this software to protect and secure your data information in any        #
#     environment.                                                                        #
#  7. It can also be used in state of being protection against the unauthorized use of    #
#     information.                                                                        #
#  8. It can be used to take measures achieve protection.                                 #
# *************************************************************************************** #

#!/usr/bin/perl 

use HTML::TokeParser;
use Mojo;
use Mojo::DOM;
use HTML::TokeParser;
use HTTP::Request;
use LWP::Simple;
use LWP::UserAgent;
use IO::Socket::INET;
use Term::ANSIColor;
use IO::Select;
use HTTP::Response;
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);
use URI::URL;
use feature ':5.10';
use LWP::UserAgent;
no warnings 'uninitialized';
use Term::ANSIColor;
use Data::Validate::Domain qw(is_domain);

system "clear";
print color('bold red');
print "\n\n					   	 	    Project\n";
print "\n 						          : ShaheenX :\n\n\n";
print color('bold yellow');
print "[ + ] Programmer: 	Haroon Awan\n";
print "[ + ] License: 		EULA\n";
print "[ + ] Version: 		1.0\n";
print "[ + ] Contact: 		mrharoonawan\@gmail\.com \n";
print "[ + ] Environment: 	Shell & Perl for Debian/Kali\n";
print "[ + ] Github: 		Https://www.github.com/haroonawanofficial\n";
print "[ + ] Design Scheme: 	Extract all sub domains records automatically and find all aliases and cname records for possible takeover\n";
print "[ + ] Usage: 		Read README.MD before using\n\n\n";
print color('reset');
print color("bold white"),"[ + ]  1 - Bing Search Engine\n";
print color("bold white"),"[ + ]  2 - Google Search Engine\n";
print color("bold white"),"[ + ]  3 - Baidu Search Engine\n";
print color("bold white"),"[ + ]  4 - Robtex Search Engine\n"; 
print color("bold white"),"[ + ]  5 - Scan Combo Engine : censys / dnsdumpser / virustotal / threatcrowd / netcraft\n";
print color("bold white"),"[ + ]  6 - Yahoo Search Engine\n";
print color("bold white"),"[ + ]  7 - ASK Search Engine\n";
print color("bold white"),"[ + ] Enter desired search engine option: ";
print color("green");
print color 'reset';
chomp($name=<STDIN>);

if ($name=~ "1")
{
if ($^O =~ /MSWin32/) {system("cls"); system("color A");
}else {}

# USER AGENT ALGORITHM ######
$ag = LWP::UserAgent->new();
$ag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ag->timeout(10);
#$ag->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36");
#Extra user-agent in case, google block any kind of request

# DORK AND QUERY ALGORITHM ######
print color("bold Green"),"  \n\n        [ + ] Enter domain name only: ";
chomp($dork=<STDIN>);
print color("yellow"), "\n";


# PAGE SCRAPE ALROGITHM ######
for (my $i=1; $i<=200; $i+=10) {
$url = "https://www.bing.com/search?q=site%3A$dork.com+-www%3A$dork.com&filt=all&first=$i&FORM=PERE";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;

# ERROR HANDLGING ALGORITHM ######
if ($rrs =~ m/Enter captcha/i) {
print "[!] Error: Bing is blocking our requests, change your IP and clear cache [!]\n\n";
exit;
}
else {}

$p = HTML::TokeParser->new(\$rrs);
  while ($p->get_tag("cite")) {
      my @link = $p->get_trimmed_text("/cite");
      foreach(@link) { print "$_\n"; }
      open(OUT, ">>bingsubdomain.txt"); print OUT "@link\n"; close(OUT);
  }
 } 
print "[+] Finished enumerating Bing\n";
$cleaner = system("./bingcleaner.sh");
exit;
}


if ($name=~ "2")
{
if ($^O =~ /MSWin32/) {system("cls"); system("color A");
}else {}

# USER AGENT ALGORITHM ######
$ag = LWP::UserAgent->new();
$ag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ag->timeout(10);

# DORK AND QUERY ALGORITHM ######
print color("bold Green"),"  \n\n        [ + ] Enter domain name only: ";
chomp($dork=<STDIN>);
print color("yellow"), "\n";


# PAGE SCRAPE ALROGITHM ######
for (my $i=1; $i<=2000; $i+=10) {
$url = "https://google.com/search?q=site%3A$dork.com+-www%3A$dork.com&btnG=Search&hl=en-US&biw=&bih=&gbv=1&start=$i&filter=0";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;

# ERROR HANDLGING ALGORITHM ######
if ($rrs =~ m/Our systems have detected unusual traffic/i) {
print "[!] Error: Google is blocking our requests, change your IP and clear cache [!]\n\n";
exit;
}
else {}

$p = HTML::TokeParser->new(\$rrs);
  while ($p->get_tag("cite")) {
      my @link = $p->get_trimmed_text("/cite");
      foreach(@link) { print "$_\n"; }
      open(OUT, ">>googlesubdomain.txt"); print OUT "@link\n"; close(OUT);
  }
 } 
print "[+] Finished enumerating Google\n";
$cleaner = system("./googlecleaner.sh");
exit;
}

if ($name=~ "3")
{
if ($^O =~ /MSWin32/) {system("cls"); system("color A");
}else {}

# USER AGENT ALGORITHM ######
$ag = LWP::UserAgent->new();
$ag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ag->timeout(10);
#$ag->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36");
#Extra user-agent in case, google block any kind of request

# DORK AND QUERY ALGORITHM ######
print color("bold Green"),"  \n\n        [ + ] Enter domain name only: ";
chomp($dork=<STDIN>);
print color("yellow"), "\n";

# PAGE SCRAPE ALROGITHM ######
for (my $i=1; $i<=2000; $i+=10) {
$url = "http://www.baidu.com/s?pn=$i&wd=site%3A$dork.com+-www%3A$dork.com&oq=site%3A$dork.com+-www%3A$dork.com";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;

# ERROR HANDLGING ALGORITHM ######
if ($rrs =~ m/404/i) {
print "[!] Something went wrong [!]\n\n";
exit;
}
else {}

$p = HTML::TokeParser->new(\$rrs);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link) { print "$_\n"; }
      open(OUT, ">>baidusubdomain.txt"); print OUT "@link\n"; close(OUT);
  }
 } 
print "[+] Finished enumerating Baidu\n";
$cleaner = system("./baiducleaner.sh");
exit;
}


if ($name=~ "4")
{
if ($^O =~ /MSWin32/) {system("cls"); system("color A");
}else {}

# USER AGENT ALGORITHM ######
$ag = LWP::UserAgent->new();
$ag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ag->timeout(10);

# DORK AND QUERY ALGORITHM ######
print color("bold Green"),"  \n\n        [ + ] Enter domain name only: ";
chomp($dork=<STDIN>);
print color("yellow"), "\n";


# PAGE SCRAPE ALROGITHM ######
$url = "https://www.robtex.com/dns-lookup/$dork.com";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;

# ERROR HANDLGING ALGORITHM ######
if ($rrs =~ m/404/i) {
print "[!] Something went wrong [!]\n\n";
exit;
}
else {}

$p = HTML::TokeParser->new(\$rrs);
  while ($p->get_tag("cite")) {
      my @link = $p->get_trimmed_text("/cite");
      foreach(@link) { print "$_\n"; }
      open(OUT, ">>robtexsubdomain.txt"); print OUT "@link\n"; close(OUT);
}
print "[+] Finished enumerating Robtex\n";
$cleaner = system("./robtexcleaner.sh");
exit;
}

if ($name=~ "5")
{
if ($^O =~ /MSWin32/) {system("cls"); system("color A");
}
{
	print color("bold Green"),"  \n\n        [ + ] Enter again domain name only: ";
	chomp($domain=<STDIN>);
        print color("bold Green"),"  \n        [ + ] Extracting subdomains ";
	print color("bold Green"),"  \n        [ + ] Writing data in 5_subdomains.txt ";
	print color("bold Green"),"  \n        [ + ] Getting Data Ready \n";


	my $sub = system("python2 sub.py -v -d $domain.com >  5_subdomains.txt");
        $cleaner1 = system("./5_combo.sh");
exit;
}
}


if ($name=~ "6")
{
if ($^O =~ /MSWin32/) {system("cls"); system("color A");
}else {}

# USER AGENT ALGORITHM ######
$ag = LWP::UserAgent->new();
$ag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ag->timeout(10);

# DORK AND QUERY ALGORITHM ######
print color("bold Green"),"  \n\n        [ + ] Enter domain name only: ";
chomp($dork=<STDIN>);
print color("yellow"), "\n";

# PAGE SCRAPE ALROGITHM ######
for (my $i=1; $i<=2000; $i+=11) {
$url = "https://search.yahoo.com/search;_ylt=A0geK.G_YP9ccCkAjDlXNyoA;_ylu=X3oDMTEzajVvczlrBGNvbG8DYmYxBHBvcwMxBHZ0aWQDBHNlYwNwYWdpbmF0aW9u?p=site%3A$dork.com&pz=10&fr=sfp&bct=0&b=$i&pz=10&bct=0&xargs=0";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;


while ($rrs =~ m/<b>\s*(.*?)\s*<\/b>/g) {
   if (is_domain($1)) {
      print $1."\n";
}
      open(OUT, ">>yahoosubdomain.txt"); print OUT "@link\n"; close(OUT);
  }
}
print "[+] Finished enumerating Yahoo\n";
$duplicateremove = system("awk '!seen[$0]++' yahoosubdomain.txt > yahoosubdomains.txt && rm yahoosubdomain.txt && cp yahoosubdomains.txt yahoosubdomain.txt");
$cleaner = system("./yahoochecker.sh");
exit;
}

if ($name=~ "7")
{
if ($^O =~ /MSWin32/) {system("cls"); system("color A");
}else {}

# USER AGENT ALGORITHM ######
$ag = LWP::UserAgent->new();
$ag->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ag->timeout(10);

# DORK AND QUERY ALGORITHM ######
print color("bold Green"),"  \n\n        [ + ] Enter domain name only: ";
chomp($dork=<STDIN>);
print color("yellow"), "\n";

# PAGE SCRAPE ALROGITHM ######
for (my $i=1; $i<=20; $i+=1) {
$url = "http://uk.ask.com/web?q=site%3A$dork.com&qsrc=998&o=0&l=dir&qo=pagination&page=$i";
$resp = $ag->request(HTTP::Request->new(GET => $url));
$rrs = $resp->content;

# ERROR HANDLGING ALGORITHM ######
if ($rrs =~ m/404/i) {
print "[!] Something went wrong [!]\n\n";
exit;
}
#else {}


while ($rrs =~ m/class="PartialSearchResults-item-url">(.*?)<\/p>/g) { # while loop to check all the existing match for the regex
  print $1."\n";
}

   open(OUT, ">>asksubdomain.txt"); print OUT "@link\n"; close(OUT);
   }
print "[+] Finished enumerating Ask\n";
$cleaner = system("./askcleaner.sh");
exit;
}
