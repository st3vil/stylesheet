package Down::Tides;
use strict;
use warnings;
no warnings qw(uninitialized redefine);

use G;
our $A = {};

{
    package Ghoz; #
    use Tie::Hash;
    our @ISA = qw(Tie::ExtraHash);
    sub TIEHASH {
        my $class = shift;
        my $sto = bless [{},@_], $class;
        $sto
    }
    sub FETCH {
        my ($s,$k) = @_;
        my ($st,@o) = @$s;
        return $st->{$k} if exists $st->{$k};
        option:
        for my $o (@o) {
            if (my $in = $o->{inp}) {
                my $v = $o->{o};
                for my $i (@$in,$k) {
                    exists $v->{$i} || next option;
                    $v = $v->{$i};
                }
                return $v;
            }
            else {
                die "Hwoto climb a ".G::ki $o;
            }
        }
    }
}
sub T {
my ($A,$C,$G,$T,$s,@Me) = @_;
my $I = $A->{I};
my $e = $G->{h}->($A,$C,$G,$T,"tie",'Wormhole',{base=>$s},@Me);
return $e;
};
{
    package Wormhole;
    use G;
    use Tie::Hash;
    our @ISA = qw(Tie::ExtraHash);
    sub TIEHASH {
        my $class = shift;
        my %o;
        %o = (%o, %{$_}) for @_;
        return bless [{},\%o], $class;
    }
    sub STORE {
        my ($e,$k,$v) = @_;
        my ($s,$o,@o) = @$e;
        die "Storign o: $v" if $k eq 'o';
        if ($o->{nonyam}) {
            $o->{dige}->{$k} = slm 12, dig $v unless ref $v;
        }
        $s->{$k} = $v;
    }
    sub FETCH {
        my ($e,$k,$v) = @_;
        my ($s,$o,@o) = @$e;
        return $o if $k eq 'o';
        $s->{$k} || STORE($e,$k, do {
            my $il = join('/', grep{defined} $o->{dir}, $k);
            my $f = $o->{base}.'/'.$il;
            if (-d $f) {
                my %Di;
                tie %Di, 'Wormhole', $o, {dir=>$il};
                \%Di;
            }
            elsif (-f $f) {
                $o->{nonyam} ?
                scalar read_file($f)
                :
                LoadFile($f);
            }
            else {
                warn "Wormhole sens nothing: $f";
                undef
            }
        });
    }
}
sub tie {
my ($A,$C,$G,$T,@M)=@_;
my ($class,@Me) = @M;
my $I = $A->{I};
my %na;
tie %na, $class, @Me;
return \%na
};
$A->{II} = Load(<<STEVE);
--- 
I: 
  "0.1": 
    T: 
      c: 
        from: Down/Tides
      sc: 
        acgt: s
        args: A,C,G,T,s
        bab: ~
        code: I
        dige: 274ac0734b1d
        eg: Down::Tides
        of: I
      t: T
      "y": 
        cv: '0.1'
    tie: 
      c: 
        from: Down/Tides
      sc: 
        acgt: class
        args: A,C,G,T,class
        bab: ~
        code: I
        dige: 26a6bbbfb025
        eg: Down::Tides
        of: I
      t: tie
      "y": 
        cv: '0.1'

STEVE
