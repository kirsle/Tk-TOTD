#!/usr/bin/perl -w

use lib "./lib";
use Tk;
use Tk::TOTD;

my $main = MainWindow->new (
	-title => 'Totd Test',
);

my $totd = $main->TOTD (
	-title => 'My TOTD Test',
);

$totd->configure (-title => 'Something Else');

$main->protocol('WM_DELETE_WINDOW', sub {
	print "Shutdown\n";
	$totd->destroy();
	exit(0);
});

$main->Button (
	-text => 'Show TOTD',
	-command => sub {
		$totd->Show;
	},
)->pack();

MainLoop;
