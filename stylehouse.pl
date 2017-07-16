#!/usr/bin/perl
use strict;
use warnings;
no warnings qw(uninitialized redefine);


use FindBin qw($Bin);

use lib "$Bin/othlia";

use lib "$Bin/slib";

use G;

my ($A,$C,$G,$T);

my $Beach = sub {
my ($s,$f,@Me) = @_;
my @l = ref $s ? @$s : split "\n", ($s || ''.`cat $f`);
my $tot = @l;
my $N = [];
local $A->{V} = 0;
my @in;
my $l;
my $lastC;
my $peel = sub { my ($s) = @_;
    return {map { split':',$_ } split ',', $s}
};
eval{
while (@l) {
    $l = shift @l;
    my ($in) = $1 if $l =~ s/^(\s+)//;
    my $d = length($in) / 2;
    my ($t,$y,$c,$sc,$s) = split "\t", $l;

    $A->{V} && $G->{h}->($A,$C,$G,$T,'say','sayyl',"$in $l");

    $t = djson $t if $t =~ /^\W/;

    $y = 1 if !length$y;
    $y = 0+('0.'.$y);

    if ($s =~ /^\W/) {
        # fifth thing would be $c->{s}
        $s = djson $s;
    }
    if ($c =~ /^"/) {
        $s = djson $c;
        $c = {};
    }
    elsif ($c =~ /^\W/) {
        $c = djson $c
    }
    elsif ($c) {
        $c = $peel->($c);
    }
    else { $c = {} }
    $c->{s} = $s if $s;

    if ($sc =~ /^\W/) {
        $sc = djson $sc
    }
    elsif ($sc) {
        $sc = $peel->($sc)
    }
    else { $sc = {} }

    my $C = {t=>$t,y=>{cv=>$y},c=>$c,sc=>$sc};

    # add blockquoted c/sc
    while ($l[0] =~ /^$in  (\w[\S ]+):( (\||.+))?$/) {
        my ($k,$v) = ($1,$3);
        my $string;
        if ($v eq '|') {
            $string++;
            undef $v;
        }
        shift @l;
        my ($nk,$gk) = split ' ', $k, 2;
        $A->{V} && $G->{h}->($A,$C,$G,$T,'say','sayyl',"$in $C->{t} $C->{y}->{cv} - $nk $gk ($string) $v");
        unless ($v) {
            $A->{V} && $G->{h}->($A,$C,$G,$T,'say','saybl',$in."Beaming in");
            my @s;
            while ($l[0] =~ /^$in    (.*)$/) {
                push @s, $1;
                shift @l;
            }
            $v = join "\n", @s;
            $A->{V} && $G->{h}->($A,$C,$G,$T,'say','sayyl',"Loaded til $l[0]\n with $nk $gk - ".slim(30,$v));
        }
        unless ($string) {
            $v = Load $v
        }
        else {
            $v .= "\n" unless $v =~ /\n$/s;
        }

        $C->{"$nk"}->{"$gk"} = $v;
    }

    $A->{V} && $G->{h}->($A,$C,$G,$T,'say','saygr',"Popped $in".ki$C);
    $in[$d] = $C;
    if ($d) {
        my $p = $in[$d-1];
        push @{$p->{sc}->{z}||=[]}, $C;
    }
    else {
        push @$N, $C;
    }
}
};
$@ && die "On line ".($tot - @l).": $l\n\n$@";
$N
};

my $Believe = sub {
my ($N,@Me) = @_;
# take $N, produces $A->{i}/$A->{ii}
my $hup = sub { my ($s) = @_;
    my $C = {%$s};
    $C->{"$_"} = {%{$C->{"$_"} }} for
        grep {ref $C->{"$_"} eq 'HASH'} keys %$C;
    $C
};
# t v = C what are with sz D
my $tv = {};
for my $P (@$N) { # Punter 9
    for my $C (@{$P->{sc}->{z}||[]}) { # Water 0.001
        $C->{c}->{W} || next;

        $C = $hup->($C);
        $C->{y} = {cv=>$C->{y}->{cv}};
        my $z = delete $C->{sc}->{z};

        if (my $c = $tv->{"$C->{t}"}->{"$C->{y}->{cv}"} ) {
            # merge sc from the rest?
            $c->{sc}->{contrib} .= ",$P->{t}";
            $C = $c;
        }
        else {
            $C->{sc}->{contrib} = $P->{t};
            $tv->{"$C->{t}"}->{"$C->{y}->{cv}"} = $C;
        }
        $C->{sc}->{z} ||= [];
        for my $D (@$z) { # Doing 1
            if (my $over = $C->{y}->{tv}->{"$D->{t}"} && $C->{y}->{tv}->{"$D->{t}"}->{"$D->{y}->{cv}"} ) {
                @{$C->{sc}->{z}} = grep { $_ ne $over } @{$C->{sc}->{z}};
                delete $C->{y}->{tw}->{"$D->{t}"} if $C->{y}->{tw}->{"$D->{t}"} eq $over;
            }
            $C->{y}->{tv}->{"$D->{t}"}->{"$D->{y}->{cv}"} = $D;
            $C->{y}->{tw}->{"$D->{t}"} ||= $D;
            push @{$C->{sc}->{z}}, $D;
        }
    }
}

# tw of 
my $ii = {};
while (my ($t,$cvv) = each %{$tv }) {
while (my ($cv,$C) = each %{$cvv }) {
    $ii->{"$t"} && die "$t comes again at $cv";
    if ($C->{sc}->{contrib} =~ /,/) {
        # wants to sort in to z above?
        @{$C->{sc}->{z}} = sort {$a->{y}->{cv} <=> $b->{y}->{cv} || $a->{t} cmp $b->{t}} @{$C->{sc}->{z}}
    }
    my $la;
    for my $D (@{$C->{sc}->{z}}) {
        $D = $hup->($D);
        $D->{sc}->{coded} || sayre "Not coded: ".ki$D;
        delete $D->{sc}->{coded};
        $D->{c}->{code} = eval $D->{c}->{s};

        die "Throcompile $D->{sc}->{of} $D->{y}->{cv}: $D->{t}:"
        .ind('  ',$@)."\n\n $D->{c}->{s}\n" if $@;
        die "Not code: $D->{t} $D->{y}->{cv}: $@\n".ki $D if ref $D->{c}->{code} ne 'CODE' && !$D->{sc}->{subpeel};

        if (!$la) {
            $C->{y}->{in} = $D;
        }
        else {
            $la->{y}->{next} = $D;
            $C->{y}->{prev} = $la;
        }
        $la = $D;
    }
    $ii->{"$t"} = $C;
}}

my $i = {};
my $n = $ii->{i};
while ($n) {
    if ($n->{c}->{code}) {
        $i->{"$n->{t}"} = $n->{c}->{code};
        $ii->{i}->{y}->{tw}->{$n->{t}} = $n;
    }
    $n = $n->{y}->{in} || $n->{y}->{next};
}

{i=>$i,ii=>$ii}
};

my @f = ('bay/via/Atool/1','bay/via/Sequencing/1','bay/via/Placement/1','bay/via/Intel/1','bay/via/ForJ/1','bay/via/Tangle/1','bay/via/Stuff/1','bay/via/Stylehousing/1','bay/via/Art/1','bay/via/Storage/1','bay/via/Elvising/1','bay/via/Tripical/1');

$A->{V} && $G->{h}->($A,$C,$G,$T,'say','saygr','Some more');
my $N = [map{ @{ $Beach->('',$_) } }@f];
my $A = $Believe->($N);
$G->{c}->{mas} = sub {
    my ($A,$C,$G,$T,$s) = @_;
    1 && saygr "Es: $s";
};
$A->{t} = 'toplevel';
$G->{h} = $A->{i}->{h} || die "No h";
$G->{w} = $A->{i}->{w} || die "No w";
$G->{i}->{t} = $A->{i}->{t} || die "No t";
$G->{h}->($A,$C,$G,$T,"Gee"); # gives $G->{way}, going
$G->{c}->{bay} = 'bay';
1 && sayre "Ontop";

my @ha =  $G->{h}->($A,$C,$G,$T,"Aup");
$A = $G->{h}->($A,$C,$G,$T,"A",'twanga');
push @ha,  $G->{h}->($A,$C,$G,$T,"Aup");

my $mo = $G->{h}->($A,$C,$G,$T,"t",'mo');
my $ar = {};
$G->{w}->($A,$C,$G,$T,"Beginning",$ar);

1 && sayyl wdump 3, [Thes=>$mo]