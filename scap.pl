#!/usr/bin/perl
use strict;
use warnings;
use YAML::Syck;
use List::MoreUtils qw"uniq";
use Scriptalicious;
use v5.10;

my $junk = new Stuff("Junk");
my ($one, @etc) = map { $_->link($junk); $_ }
    map { new Text($_) }
    "../Music/Fahey/Death Chants, Breakdowns and Military Waltzes/Fahey, John - 08 - The Downfall Of The Adelphi Rolling Grist Mill.flac";

my $wants = new Stuff("Wants");
our $at_maximum_entropy = 0;
our @links;

{ package Stuff;
# base class for all things in this metaverse
# link  links stuff together
# links returns all links
# {{{
use List::MoreUtils 'uniq';
sub new {
    shift if $_[0] eq "Stuff";
    my $package = __PACKAGE__;

    if ($_[0]) {
        $package = shift;
        eval "package $package; use base 'Stuff';";
        die $@ if $@;
    }
    bless {@_}, $package;
}
sub link {
    $at_maximum_entropy = 0;
    push @links, {0=>shift, 1=>shift,
                val=>\@_, id=>scalar(@links)}; # self, other, ...
}
sub linked {
    my $self = shift;
    my $spec = shift;

    if ($spec && $spec =~ /^(\w+)(->(\w+))+$/) {
        my @specs = split "->", $spec;
        my @rs = $self;
        for my $spec (@specs) {
            @rs = uniq map {
                $_->linked($spec)
            } @rs;
        }
        return @rs;
    }

    map { $_->{1} } $self->links($spec);
}
sub links {
    my $self = shift;
    my $spec = shift;
    return grep {
        ref $spec   ? $_->{1} eq $spec      # an object
        : $spec     ? ref $_->{1} eq $spec  # package name
        : 1
    } map {
        # ensure that $self is one, make it the first one
        $_->{0} eq $self 
            ? $_
        : $_->{1} eq $self
            ? { 1 => $_->{0}, 0 => $_->{1}, val => $_->{val}, id => $_->{id} }
        : ()
    } @links # all the links in the whole metaverse
}

}
# }}}
{ package Text;
# uhm...
use base 'Stuff';
sub new { shift; bless { text => shift }, __PACKAGE__; }
sub text {
    shift->{text}
}
}
{ package Pattern;
# new(names => @names) # primitive pattern matching
# are linked to $matches
# {{{
use base 'Stuff';
sub new {
    shift;
    my $self = bless {@_}, __PACKAGE__; # names => @names
    die if $self->{names} && grep { $_ eq "string" } @{$self->{names}};
    $self;
}
sub match {
    my $self = shift;
    my $it = shift;

    # TODO some logicator from cpan?
    if ($self->{object} && !$self->{names}) {
        my $res = ref $it eq $self->{object};
        say "match ".($res?"PASS":"FAIL").": string";
        $res
    }
    elsif ($self->{names}) {
        my %res;
        my %objects = map {$_->{1}->{name} => $_->{val}->[0]} $it->links($self->{object});
        for my $name (@{$self->{names}}) {
            $res{$name} = (exists $objects{$name} && $objects{$name} == 1);
        }
        my $res = (0 == grep { $res{$_} == 0 } keys %res);
        say "match ".($res?"PASS":"FAIL").": ". join "\t", %res;
        $res;
    } else { die }
}
} # $}}}
{ package Action;
# new
# {{{
use base 'Stuff';
sub new {
    shift;
    my $self = Stuff::new(@_);
    if ($self->{want}) {
        $wants->link($self, $self->{want});
    }
    return $self
}
}
# }}}

our $intuitor = new Stuff("Intuitor");
sub do_intuition {
    my $self = shift;
    my $it = shift;

    return if $self->links($it); # already

    say " looking: $self->{cer} $self->{name}...";
    my $cog = $self->{cog};
    my $t = $it->text;
    my @val = 
        ref $cog eq "Regexp" ? $t =~ $cog :
        ref $cog eq "CODE" ? $cog->($t) :
        die;
    say @val ? "   @val" : "NOPE";
    @val = [@val] if @val > 1;
    @val = (1) if @val == 0;
    
    say "intuited $self->{name}";
    $self->link($it, @val);
}
$intuitor->link(
new Action(
"Intuit",
want => new Pattern(object => "Text"),
does => sub {
    my $self = shift;
    my $it = shift;

    unless ($self->linked("Intuition")) {
# here we generate some intuitions and their matches 
# {{{
my @giv = split "\n", <<"";
string:
    /\// maybe filename
filename:
    /^\.\./  probly relative
    /^(?!/)/ maybe relative
    /^\//    probly absolute
    { -e shift } is reachable
relative or absolute
reachable filename:
    { -f shift } is file
    { -d shift } is dir
file or dir
file:
    { -r shift } is readable
    { (stat(shift))[7] } is size

sub shift_until { # TODO util functions
    my ($shift, $until) = @_;
    my @ret;
    until (!@$shift || $until->()) {
        push @ret, shift @$shift;
    }
    return @ret;
}

while (defined($_ = shift @giv)) {
    if (/^([\w ]+):/) {

        my $in_match = $1 eq "string" ?
            new Pattern(
                object => "Text"
            ) :
            new Pattern(
                object => "Intuition",
                names => [split /\s+/, $1]
            );

        my @ints = shift_until(\@giv, sub { $giv[0] =~ /^\S/ });

        for (@ints) {
            s/^\s+//;
            my $cog =
                s/^\/(.+)\/ // ? qr"$1" :
                s/^\{(.+)\} // ? eval "sub { $1 }" :
                die $_;
            my ($cer, $to) = /^\s*(\w+)\s+(\w+)$/;
            $cer && $to || die;
            my $int = new Stuff("Intuition",
#   name => "word", the word describing a positive intuition
#   cer => is|probly|maybe|slight, security of knowledge
#           greater arrangements made out of uncertainties should be upgraded
#   cog => regex or code->($_) to test
                name => $to,
                cer => $cer,
                cog => $cog,
                does => \&do_intuition,
            );
            $int->link($in_match);
            $int->link($self);
        }

    }
    elsif (/^([\w ]+)$/) {
        my @mutex = split / or / || die;
        # things that cannot be all true
        # should work like Intuitions except it projects LIES unto the
        # stuff that's wrong
    }
    else { die $_ }
}
# }}}
    }
    else {
        my @patterns = $self->linked("Intuition->Pattern");
        my @matching = grep { $_->match($it) } @patterns;
        for (@matching) {
            for ($_->linked("Intuition")) {
                $_->{does}->($_, $it);
            }
        }
    }
},
));

start_timer();
my $clicks = 0;
until ($at_maximum_entropy) {
    $at_maximum_entropy = 1;
    $clicks++;
    for ($wants->links) {
        my $action = $_->{1};
        my $pattern = $action->{want};
        my @wanted_junk = grep { $pattern->match($_) } $junk->linked();
        for my $wj (@wanted_junk) {
            $action->{does}->($action, $wj);
        }
    }
}
say "$clicks clicks in ". show_delta();


#my $everything = new Stuff;
#$everything->link($junk);
#$everything->link($intuitor);
displo($junk);

# DISPLAY

for my $it ($junk->linked) {
    for my $e ($it->links("Intuition")) {
        say $e->[1]->{name} ."\t\t". $e->[2];
    }
}

sub summarise {
    my $thing = shift;
    my $text = "$thing";
    my ($id) = $thing =~ /\((.+)\)/ or moan "summarise not a ref!?";
    my ($color) = $id =~ /(...)$/;
    given (ref $thing) {
        when ("Text") {
            $text = "$thing: ".$thing->text;
        }
        when ("Intuition") {
            $text = "$thing: $thing->{cer} $thing->{name} $thing->{cog}"
        }
        when ("Intuit") {
            $text = "$thing: wants: ".summarise($thing->{want});
        }
        when ("Pattern") {
            $text = "$thing: object=$thing->{object} ".
                ($thing->{names} ? join("+",@{$thing->{names}}):"");
        }
    }
    return $text;
    return sprintf '<li id="%s" style="background-color: #%s">%s</li>', $id, $color, $text, $id;
}

sub link2text {
    my $l = shift;
    "$l->{1}" =~ /^(\w+)/;
    my $val = join " ", "_", tup($l->{val}), $1;
    return $val
};
sub links_by_id {
    map { 
        $_->{id} => {
            %$_,
            text => link2text($_),
        }
    } @_;
};
sub links_by_other_type {
    my %links = @_;
    my %by_other;
    for my $l (values %links) {
        my $type = ref $l->{1};
        push @{$by_other{$type}||=[]}, $l;
    }
    %by_other;
};

my %seen_oids;
my $n= 0;
sub assplain {
    my ($thing, $previous_lid) = @_;
    my %links = links_by_id($thing->links);
    my %by_other = links_by_other_type(%links);

    my $figure_link = sub {
        my $l = shift;

        if (!defined $l->{1}) {
            warn "undef link: $l->{id}";
            return "UNDEFINED!"
        }
        if ($n++ > 100) {
            return "DEEP RECURSION!"
        }

        my $o = $l->{1};
        my $oid = "$o";

        my $prev = exists $seen_oids{$oid};
        my $ob = $seen_oids{$oid} ||= { summarise($o) => [] };
        my ($linkstash) = values %$ob;

        unless ($prev) { # || $o =~ /Intuition/) {
            my $connective = assplain($l->{1}, $l->{id});
            push @$linkstash, @$connective;
        }

        return $ob;
    };

    my $tree = [];
    unless ($previous_lid) {
        $previous_lid = -1;
        push @$tree, summarise($thing);
    }
    for my $k (sort keys %by_other) {
        for my $l (@{$by_other{$k}}) {
            push @$tree, { $l->{text}, $figure_link->($l) };
        }
    }

    return $tree;
}

sub tup {
    my $tuple = shift;
    ref $tuple eq "ARRAY" ? @$tuple : $tuple;
}

sub displo {
    for (@_) {
        %seen_oids = ();
        my $g = assplain($_);
        my @lines = grep { /\w/ } split "\n", Dump($g);
        say "\n". join "\n", @lines;
    }
}


sub treez {
    my $self = shift;
    my $text = "";
    $self->render(text => $text);
}
exit;

use Mojolicious::Lite;
use JSON::XS;
get '/' => 'index';
get '/ajax' => \&treez;
use Mojo::Server::Daemon;

my $daemon = Mojo::Server::Daemon->new;
$daemon->listen(['http://*:3000']);
$daemon->run;

__DATA__

@@ index.html.ep
<!doctype html><html>
    <head><title>scap!</title>
    <script type="text/javascript" src="jquery-1.7.1.js"></script></head>
    <script type="text/javascript" src="scope.js"></script></head>
    <body style="background: black"><ul></ul></body>
</html>
