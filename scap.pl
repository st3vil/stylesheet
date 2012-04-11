#!/usr/bin/perl
use strict;
use warnings;
use YAML::Syck;
use List::MoreUtils qw"uniq";
use Scriptalicious;
use v5.10;

my $junk = new Stuff("Junk"); #{{{
my ($one, @etc) = map { $_->link($junk); $_ }
    map { new Text($_) }
    "../Music/Fahey/Death Chants, Breakdowns and Military Waltzes/Fahey, John - 08 - The Downfall Of The Adelphi Rolling Grist Mill.flac",
    "../Music/Fahey/Death Chants, Breakdowns and Military Waltzes/Fahey, John - 08 - The Downfall Of The Adelphi Rolling Grist Meal.flac",
    "../Music/Fahey/Death Chants, Breakdowns and Military Waltzes/Fahey, John - 04 - Some Summer Day.flac",
    "/home/steve/Music/Fahey/Death Chants, Breakdowns and Military Waltzes/Fahey, John - 04 - Some Summer Day.flac";

my $wants = new Stuff("Wants");
my $code = new Stuff("Code");
our @links; our $ln = 0;
our $G = new Stuff("Nothing");
our $root = $G;
our @entropy_fields = ($root);
sub entropy_increases {
    die "too many entropy fields" if @entropy_fields > 10;
    $_->{at_maximum_entropy} = 0 for @entropy_fields;
}

=pod
everywhere can see $G, the current point on the graph
$G->spawn("Node", etc => etc) to add a Stuffy thing
we shall call the maxing of entropy evaportation
ready takes input into the graph in the form of a datastructure
it spawns a 'proc', kind of a composable lexicality
$code relations coagulate intellect
code and data blur into a graph

so given a datastructure, we spawn instruction objects
pattern matching replaces part or all of these with code objects
once things settle down,
the codes are executed,
instruction objects hang around getting used like args,
any transmog()rification to the graph sends back to evaporate, etc

so imagine input entropy flowing into a system, the output measured
and failing a test. once would have to trace execution forwards
(or back depending on human intuition) until the insanity was found.

the graph should be able to present the human with the human-readable
parts first, allow them to bisect down to where the problem is.
also useful would be difficult-to-effect test functions like
capturing all state through the system with slight differences and
laying it out all nicely, using that data to quickly unit test.

execution order should be introduced by making the execution
itself a graph happening to do with a sequence of codes that can
be messed with. this kind of flow of things will get nice
representation eventually

=cut 
#}}}

my $test = 0;
my @modules = (
"Intuitor",
#"Scap2Blog",
);
sub do_stuff {
    start_timer();
    if ($test == 1) {
    my $td = LoadFile('search_testdata.yml');
    #use Test::More 'no_plan';
    my $round = 1;
    for my $t (@$td) {
        my ($args, $ret, $links) = @{ Load($t) };
        @links = @$links;
        $DB::single = $round++ == 54;
        my $aret = [ search(@$args) ];
        my @args = map { !defined $_ ? "undef" : $_ } @$args;
        is_deeply($aret, $ret, "@args correct!")
            || do {
                $DB::single = 1;
                say Dump([$aret, $ret])
            };
    }
    say " okay:". show_delta();
    return;
    }
    else {
    my $clicks = 0;
    until ($root->{at_maximum_entropy} || $clicks++ > 21) {
        $root->{at_maximum_entropy} = 1;
        $clicks++ && say "\nclick!\n";
        process({Linked => $wants});
        last
    }
    say "$clicks clicks in ". show_delta();
    }
}

my $dumpstruction = new Stuff("DS"); #{{{
use JSON::XS;
$dumpstruction->spawn(
[ "If", be => sub { "If expr=".($_[0]->{EXPR}||"") } ],
[ "In", be => sub { "In ".join" ",tup($_[0]->{it}) } ],
);
$code->spawn(
[ "Click", be => sub { process({Linked => $wants}) } ],
[ "Linked", be => sub { 
    transmog($G => $G->In->{it}->[0]->linked) } ],
[ "Flow", be => sub { $G->{be}->($G) } ],
); #}}}

# Instruction = (Linked => $wants)
# string matches In's "Linked"
# $wants becomes a new Instruction = ($wants)
# entropy maxed, Linked executes:
# pulls in its Instruction, returns linked $wants (the Flows)
# replaces itself with them via transmog()
# Flows get coded and executed
# the process of string matching In's "Linked" must be a graph,
# so that too many or too few matches can be graphable,
# this kind of thing would help in debugger graphs.
# chances are that codes will want to work together
# but for now, throw a wobbly

sub process {
    my $d = shift;
    my $here = $G;
# ready() does patterny preparations without executing anything
# takes datastructure and makes it into graph objects by
# turning datastructure into an Instruction
# then whateverses match the Instruction by sheer digital willpower...

    my $proc = $G = $here->spawn("proc");
    local @entropy_fields = (@entropy_fields, $proc);
    ready($d);
    displo($here);
    EVAPORATE: until ($proc->{at_maximum_entropy}) {
        $proc->{at_maximum_entropy} = 1;
        say "EVAPORATING";
        # TODO there will be a pattern matching engine working
        # all the time which can see that we're here and there are
        # Ins and Codes to get together etc, but...
        # for now just compare $code linked things to the first
        # Instruction if matching replace
        for my $c ($code->linked) {
            my $o = ref $c;
            for my $in ($G->linked("In")) {
                if ($in->{it}->[0] eq $o) {
                    my @new_in = @{ $in->{it} };
                    shift @new_in;
                    if (@new_in) {
                        $c->spawn("In", it => \@new_in);
                    }
                    $G->unlink($in);
                    $G->link($c);
                }
            }
        }
    }
    say "READY!";
    $proc->{at_maximum_entropy} = 0;
    EXECUTE: until ($proc->{at_maximum_entropy}) {
        $proc->{at_maximum_entropy} = 1;
        travel($G,
            [ sub { $G->linked($code) },
              sub { $G->{be}->() } ],
        );
        # also this ole thing
        for my $w ($proc->linked("Flow")) {
            for my $it (grep { $w->{want}->match($_) } $junk->linked) {
                $w->{be}->($w, $it)
            }
        }
        unless ($proc->{at_maximum_entropy}) {
            say "RUN - GOING BACK TO EVAPORATE";
            goto EVAPORATE;
        }
        say "RUNNING ROUND";
    }
    say "IS DONE!";
    displo($here);
}

sub transmog {
    my ($going, @coming) = @_;
    my $proc = $going->linked("proc");
    $proc->unlink($going);
    for my $c (@coming) {
        $proc->link($c);
        $c->link($going, "replaces");
    }
}

sub ready {
    my $d = shift;
    if (ref $d eq "ARRAY") {
        $G->spawn("In", it => $d);
        say "Jhurtiiz: ".Dump($G);
        die;
    }
    elsif (ref $d eq "HASH") {
        while (my ($k, $v) = each %$d) {
            $G->spawn("In", it => [$k, $v]);
        }
    }
    else {
        $G->spawn("In", it => [$d]);
    }
}

# the thing that's constantly watching the graph evolve and tracking
# pattern matches needs to be able to take a transient limb at any
# point, as well as being drip fed, so Stuff code can have hooks,
# eg, on link, unlink, you name it.
# hyperreal code. it should know about callstack interrogation for
# the debug toolchain fantasy.

# Flow@-{want-} @-> $junk@->match(${want}) && In(${junk}) be(${Flow}) )
# foreach Flow, foreach junk linked where match $want, be Flow with junk

sub search { # {{{
    my %p;
    $p{spec} = shift if @_ == 1;
    %p = @_ if @_ > 1;

    my @spec = parse_spec($p{spec});
    if ($p{start_from}) {
        unshift @spec, { object => $p{start_from} };
    }

    my $findlinks = sub {
        my ($from, $to) = @_;
        return grep {
            main::spec_comp($to, $_)
        } map {
            main::order_link($from, $_);
        } @links
    };

    my @cols;
    for my $s (@spec) {
        my @rows;
        if (!@cols) {
            my @links = $findlinks->($s->{object} => "*");
            my @objects = uniq map { $_->{0} } @links;
            push @rows, @objects;
        }
        else {
            my $from_links = $cols[-1]->{rows};
            my @froms = @cols == 1 ? @$from_links :
                map { $_->{1} } @$from_links;
            for my $from (@froms) {
                my @links = $findlinks->($from => $s->{object});
                push @rows, @links;
            }
        }
        push @cols, {
            spec => $s,
            rows => \@rows,
        };
    }

    my @ar = @{ $cols[-1]->{rows} };
    return @ar; 
}

sub parse_spec { #{{{
    my $spec = shift;
    if (!defined $spec) {
        $spec = "*"
    }
    if (ref $spec) {
        return { object => $spec }
    }
    my @spec = split /(?<=->)/, $spec;
    my $chunk = sub { # hmm... rewrite in perl6?
        $_ = shift;
        my $i = {};
        ($i->{arrow} = s/->$//)
            || s/-$//;
        $i->{return} = s/^\((\w+)\)$/$1/;
        /^(!?\w+|\*)$/ || die "$_ noparse object!";
        $i->{object} = $1;
        return $i
    };
    return map { $chunk->($_) } @spec
} #}}}

sub travel {
    $G = shift;
    my $tree = [];
    my $ex = shift if ref $_[0] eq "HASH";
    $ex ||= do {
        push @$tree, summarise($G);
        { seen_oids => {},
          n => 0,
          via_link => -1,
          patterns => shift,
        },
    };

    my $ps = $ex->{patterns};
    if ($ps->[0]->()) {
        $ps->[1]->()
    }

    my %links = links_by_id($G->links);
    my %by_other = links_by_other_type(%links);

    my $figure_link = sub {
        my $l = shift;

        if ($l->{id} eq $ex->{via_link}) {
            return 
        }
        die "undef link: $l->{id}" unless defined $l->{1};
        if ($ex->{n}++ > 50) {
            return "DEEP RECURSION!"
        }

        my $o = $l->{1};
        my $oid = "$o";

        my $prev = exists $ex->{seen_oids}->{$oid};
        my $ob = $ex->{seen_oids}->{$oid} ||= { summarise($o) => [] };
        my ($linkstash) = values %$ob;

        if ($o eq $code) {
            @$linkstash = ("...");
        }
        elsif (!$prev) {
            $ex->{via_link} = $l->{id};
            my $connective = travel($l->{1}, $ex);
            push @$linkstash, @$connective;
        }

        return $ob;
    };

    for my $k (sort keys %by_other) {
        for my $l (@{$by_other{$k}}) {
            my $fig = $figure_link->($l);
            next unless $fig;
            push @$tree, { $l->{text}, $fig };
        }
    }

    return $tree;
}


sub spec_comp {
    my $spec = shift;
    my $thing = shift;
    my $l;
    if (ref $thing eq "HASH") {
        $l = $thing;
        $thing = $l->{1};
    }

    if ($spec =~ /^l\((\w+)\)$/) {
        my $linkval = $1;
        say "$linkval vs $l->{val}->[0]";
        return 1 if $l->{val}->[0] eq $linkval;
        return 0
    }

    return 1 if $spec && $spec eq "*";
    my $not = $spec =~ s/^!//;
    my $r = ref $spec   ? $thing eq $spec      # an object
            : $spec     ? ref $thing eq $spec  # package name
            : 1;
    return !$r if $not;
    $r;
}

sub order_link { # also greps for the spec $us
    my ($us, $l) = @_;
    if (spec_comp($us, $l->{0})) {
        return $l
    }
    elsif (spec_comp($us, $l->{1})) {
        return {
            1 => $_->{0}, 0 => $_->{1},
            val => $_->{val}, id => $_->{id}
        }
    }
    return ()    
}
sub delete_link {
    my $l = shift;
    my $id = $l->{id};
    my $i = 0;
    for ($i..@links-1) {
        if ($links[$i]->{id} eq $id) {
            splice @links, $i, 1;
            return;
        }
        $i++;
    }
    die "no such link (to delete) $l->{id}"
}
# }}}

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
        my $base = $_[0] && ref $_[0] eq "HASH" && $_[0]->{base} && shift(@_)->{base} || "Stuff";
        eval "package $package; use base '$base';";
        die $@ if $@;
    }
    my $self = bless {@_}, $package;
    if (my $ls = delete $self->{link}) {
        $self->link($_) for ::tup($ls)
    }
    return $self;
}
sub spawn {
    my $self = shift;
    if (ref $_[0] eq "ARRAY") {
        $self->spawn(@$_) for @_;
    }
    else {
        my $new = new Stuff(@_);
        $self->link($new);
        return $new
    }
}
sub In { #TODO
    my $self = shift;
    my $in = $self->linked("In") || die;
    return $in
}
sub link {
    main::entropy_increases();
    $_[0] && $_[1] && $_[0] ne $_[1] || die "linkybusiness";
    push @links, {0=>shift, 1=>shift,
                val=>\@_, id=>$main::ln++}; # self, other, ...
    return $_[0]
}
sub unlink {
    main::entropy_increases();
    my $self = shift;
    my $other = shift;
    my @ls = $self->links($other);
    $main::ln++;
    for my $l (@ls) {
        main::delete_link($l);
    }
}
sub linked {
    my $self = shift;
    my $spec = shift;

    my @linked = uniq map { $_->{1} } $self->links($spec);
    wantarray ? @linked : shift @linked
}
sub links {
    my $self = shift;
    my $spec = shift;
    
    return main::search(
        start_from => $self,
        spec => $spec,
    );
}
} {
package Transducer;
use base 'Stuff';
sub new {
    shift; # 'Transducer'
    my $self = Stuff::new(shift, {base=>"Transducer"}, @_);
    $self->{name} ||= ref $self;
    $self
}
sub do {
    my $self = shift;
    # make @_ findable and then be

}
} # }}}
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
        # say "match ".($res?"PASS":"FAIL").": string";
        $res
    }
    elsif ($self->{names}) {
        my %res;
        my %objects = map {$_->{1}->{name} => $_->{val}->[0]} $it->links($self->{object});
        for my $name (@{$self->{names}}) {
            $res{$name} = (defined $objects{$name} && $objects{$name} == 1);
        }
        my $res = (0 == grep { $res{$_} == 0 } keys %res);
        # say "match ".($res?"PASS":"FAIL").": ". join "\t", %res;
        $res;
    } else { die }
}
} # $}}}
{ package Flow;
# new
# {{{
use base 'Stuff';
sub new {
    shift;
    my $self = bless { @_ }, __PACKAGE__;
    if ($self->{want}) {
        $wants->link($self);
    }
    return $self
}
}
# }}}

for (@modules) {
    say "loading $_...";
    require "$_.pl";
}

do_stuff();

# DISPLAY
exit;
displo($wants);
exit;


exit;

sub sum {
    my $thing = shift;
    my $text = "$thing";
    if (ref $thing eq "Flow") {
        $text =~ s/HASH\(0x/$thing->{name}(/;
    }
    return $text
}
sub summarise {
    my $thing = shift;
    my $text;
    my ($id) = $thing =~ /\((.+)\)/ or moan "summarise not a ref!?";
    my ($color) = $id =~ /(...)$/;
    if (my ($inst) = $dumpstruction->linked(ref $thing)) {
        $text = $inst->{be}->($thing);
    }
    else {
    given (ref $thing) {
        when ("Text") {
            $text = "$thing: ".$thing->text;
        }
        when ("Intuition") {
            if (my $val = shift) {
                $text = join "\t", "Intuition",
                    join(" ",
                        map { $_ eq "" ? '""' : $_ }
                        map { !defined($_) ? " " : $_ }
                        tup($val)
                    ),
                    "$thing->{cer} $thing->{name}",
                    ref $thing->{cog} eq "Regexp" ? "$thing->{cog}" : (),
            }
            else {
                $text = "$thing: $thing->{cer} $thing->{name} $thing->{cog}"
            }
        }
        when ("Intuit") {
            $text = "$thing: wants: ".summarise($thing->{want});
        }
        when ("Pattern") {
            $text = "$thing: object=$thing->{object} ".
                ($thing->{names} ? join("+",@{$thing->{names}}):"");
        }
        when ("BunchOfCode") {
            $text = "BunchOfCode $thing->{called}";
        }
        when ("In") {
            $text = "Instruction ".tup($thing->{it});
        }
    }
    }
    $text ||= "$thing";
    return $text;
    return sprintf '<li id="%s" style="background-color: #%s">%s</li>', $id, $color, $text, $id;
}

sub link2text {
    my $l = shift;
    "$l->{1}" =~ /^(\w+)/;
    my $name = $1;
    # TODO should display like link val query syntax, to be formulated
    my $val = join " ", map { $_ ||= "undef"; $_ } tup($l->{val}), $name;
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

        if ($l->{id} eq $previous_lid) {
            return 
        }
        if (!defined $l->{1}) {
            warn "undef link: $l->{id}";
            return "UNDEFINED!"
        }
        if ($n++ > 50) {
            return "DEEP RECURSION!"
        }

        my $o = $l->{1};
        my $oid = "$o";

        my $prev = exists $seen_oids{$oid};
        my $ob = $seen_oids{$oid} ||= { summarise($o) => [] };
        my ($linkstash) = values %$ob;

        if ($o eq $code) {
            @$linkstash = ("...");
        }
        elsif (!$prev) {
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
            my $fig = $figure_link->($l);
            next unless $fig;
            push @$tree, { $l->{text}, $fig };
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
        $n = 0;
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
