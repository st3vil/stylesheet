#!/usr/bin/perl
# copyright Steve Craig 2012
use strict;
use warnings;
use YAML::Syck;
use JSON::XS;
use List::MoreUtils qw"uniq";
use Storable 'dclone';
use File::Slurp;
use Scriptalicious;
use Carp 'confess';
use v5.10;
say "we are $0";

=head1 NEW FILE!

need to move the architecture forward without clunkiness and many
hundred estranged lines of code

focus on being able to play with the ui
make some algorithms to play with there
finally an answer to what is a field and how it works

and DONT FORGET TO TAKE GUITAR BREAKS

=head1 ETC

I saw the talk about our terrible tools hindering the chance of anything
good being made. maybe I will get some nicer tools soon.

I need to make the jump to pulling pools of perl together like goops in
an environment where my creations are mostly data and fractures of data
architecture, only occasional hacks on the underlying atomic structure.

taxonomic inspiration: each knowledge thing we can reason to about any
$_ is a field - as in a field of knowledge, opposite end to the unified
field where everything becomes the same, applying fields is increasing
entropy.

the machinery is made of itself asap. we shall call this singularity X.

Post-X must be rules about what can react, creation of new fields.


Next time is about discerning shapes and levels of behaviour and trying
to hallucinate visual representation for them and how that would work.
need to research animated datastructure toolkits... (like they exist)

God damn those lumps of my intellect before they're broken down into
perly contrivances are exactly the thing to cater for. it's all just
flowing datastructures. rhythm is the new thing I will be doing, since
it's so important to Doing The Right Thing.

the problem is I became an artist. now I know that my ideas are
expressions. it is too hard to express them with the material available.
lower the barrier for entry, but more importantly shorten the marathon
of invention, always trying to beat apathy.

I'd love a command & conquer like map of code, instead of being a huge
text file. swampy bits could be shrank up relative to important bits.

=head1 ALGORITHMS

data flows through algorithms

an algorithm is a bunch of machine-thinking-ideas graph
 which can be the unit of testability
 testable means the nature of what's inside can be experimented upon
 to optimise it and the surrounding program

all the algorithms are just graphs, into which complexity can be injected.
like passing a closure but without making code exponentially ugly.

so at a point of the program there could be yay many algorithms working together like so
with some complicated by some need to work together just so
it's a tangle of machines and thinking and ideas layered on top of each other graphically

probably we would find that the pattern of node linkage was always very simple
and could be simulated behind link() etc API with something faster

streaming algorithms that can make shortcuts for big datasets
and resources with timing etc realities

the question is how to express this in graph so it scales...
nodes could store links on themselves if it made sense...
all these slight tweaks in nature "if it makes sense" are obviously coming from
the world of graph self-analysis and optimisation...
firstly we should break the /object code into functions which feed each other..
or the getlinks() code, why not...
the variables' light cone allows the shape of the algorithm around it to change.
inputs and outputs, chains of them

=cut

=head1 NOT FIELDS

We're using different Graph objects to get a field effect... a complete set
of links without neighbour noise

we should be able to say this part of the graph is now a field...
if an algorithm is entropied by the limit of the field, this is shown
    as a bulge or something, somewhere
links to within from outside and vice versa should be seen
field secretiveness (relative to anything?)
so is creating a field over nodes cloning them? with backlinking?
perhaps you create the selection first then say clone
perhaps something can slither out of the way, of course it can...

So there's usually just one graph per App
App would branch away its various data but it's one bunch of links
a perl program in this new world would be more like a daemon serving
the illusion of several Apps and whatever they need, down to the existing tech

but floatilla of algorithms and junk

each node in the subset could be linked to the original in secret way
(if a query asked it could traverse back into the original graph)
once we have subsets carved out we can run them into algorithms easier

there's kind of a turf concept going on... various customs for travellers...

now we're using IDs to find things in closed circuits of links...

=cut

=head1 HMM

so like protein coders that want to survive, the base apparition creates a
luxurious overworld

"if it lives, it lives" is the base statistical point to life, humanity and its
complexity is just increasing luxury erupting on top

I believe I am sewing mental dischord sometimes but I am working it okay

entropy can't be explained, the teacher will go off on tangent after tangent,
while the student gets more and more full of unresolving notionettes.

head1 THIRD

linkery can be on each object or in the fields link store
revelation 1 is links-on-objects.
r1 is to get a graph of the codey rules leading to r2
r1 holds objects to represent itself in an extensible manner

for any function there's a physical medium/machinery for data flow and action
on top of that something says "this is this kind of idea and why"
and the idea itself is applied to the machinery it will effect

machinery (for data flow)
thinking (on the machinery)
ideas (what stuff is for)

so ideas need to cosy up to machinery real nicely, thinking could get complicated adapting things
(had gone on a tangent here) so through their shared ideas (and/or via thinking) different machinery can work together.
there might be an ambient idea realiser (optimisation ideas...) in r2 pattern matching...
like how ideas look for reality to improve on

concurrent graph pattern matching needed...
pattern matching means a chunk of graph exists, for example execution is at this point about this kind of machinery/data/etc...

argumentative language is machinery, which invokes ideas through fractured thinking.

so we needa take data to make machines to make thinking and ideas and more graph computer complexity.

machine says take this data, munge it like so, put it here.

there's a machine around the machine, the execution environ, where data is looked for and dumped out.
in this environ there's arms and eyeballs protruding in on the swarming machines.

hmm like ideas get more beautifully meaningful-per-word, the rig of r2 dangles increasingly greasey code down to perl

trying to see the shape of things where code becomes machine! ah long lost reality.

At Field Hutt Josh says "massive chunks" and my being ignites, salivating... We're dogs with jobs.

on search: the result graph is result nodes containing the matched thing...
IT IS DETERMINED somewhere before execution of the receiving function whether that thing wants the result node or the thing
this situation can be SEEN, because it's all graph all the time.
the resolve could be thinking, machine-generated in test cases.

test cases should be a major part of generating the program as well as proving it.
say "take [a,b,c]s and {etc}". etc code has sanity checks mixed in with function and either. like /(.+) etc/ || die

so what does r2 want to do?
pattern matches to:
    notice where/when/what we are and mess with things accordingly
        each of these messings creates a mess, in theory, but it's better to have messy theory and clean practice since you can't see theory.
        mostly we shall just load up the graph technology itself with little complications. that graph generates code that we hop over to.

so r1 allows the graph tech to be loaded up with complications and then that generates r2 graph tech code.
r2 graph tech supports all the sweet functionality.
r2 graph computer? what decides what gets executed? well for development, tests and web client requests will do...

the r2 graph computer is just another machine that gets executed.
    I wonder if it implements the thinking-idea relative strangeness or that stuff could be r1 complicated
    it could perhaps not be required for some initial r2 functionality?
    perhaps it is a mistake to avoid putting things in r1? what shape is r1 really?
    if there's anything to do it can get done first hand
        the point of separating machine-thinking-idea is to clarify the engineering and also open possibilities of computer understanding
    the graph computer is an ambient dude that waits for the world to get to it?
    aha no yeah its state wants to be seen by things wanting to do things at certain points of computation

anyway we will say we want to run this machine here -> "lastfm submit scrobbler.log"
and it executes its machine pulls in other machines through ideas etc etc.
ah so a machine graph can specify specific other machines too somehow, if it can locate them somehow...
you could also say NO, not that machine, this machine, for it is an alike idea, but adapt the input/output data flow with this machine, etc.


can I turn my typing-letters-in-order skills into a profitable business? no, probably just a bizarre bunch of material (art?)

the interface is for capturing material to compute and impressing the user.

=head1 SO

a lexical scope, adapted into a graph function, is a sorta field
inherited variables are adapted with thinking...

it's feeling more musical for further along this cut.

keeping time with a six minute track on loop.

making testery for graph, represented as ui drawing instructions.
that stuff will eventually be runnable/always run and visible in the ui.
twould be good to have ui in one process and fork for tests.
run another perl process altogether and get output?
get output how? database time? nah.
fuck that, just ui runnable test routines would be the ticket.
then those routines could elabourate into machine clusterations
the tests are the routines right.

- limber up graph happening.
thawed graph bootstraps itself with links from nowhere to all its nodes.
usually there'd be links from at least somewhere philosophical to everything
talking about it relative to various formulas

there's definitely that machine-thinking-ideas pattern awaiting elegant apparition.

=head1 TODO

need to get whole svg state from test script back to the scope, so it can be seen
should probably rejig the ui a bit now it's more stable to support...
- breadcrumb history
- yadda
- dump depth limiting
- exceptions to said
- those exceptions a kind of view port
- view ports
- view ports by graph pattern like G(webbery)/filesystem
- tests run from ui
- butter hacks managed in butter ui itself
- to deploy a new butter ui the new process requests to the old process to die
- leaving it necessary state to keep on truckin

seeing things happening:
 lets make the get_object:
   make drawing cats: drawings animations removals
   gen, diff, fillin svg
   collecting them things and clearing, statusing...
 should be able to see these things happening in graph...
 see the execution of get_object at all points
 resume in there and interrogate data


the scope is for navigating through dimensions and aspects of program being

code becomes code graph
 - artistic code structure abstractions like shrinking vast uglies
 - diagram/maps of code
 - invent: click link in browser, gvim goes to the line of code

gvim still hacks up text file, changes migrated into code graph
 - needs to be visual if it's tricky or if user wants to
 - this could stretch right down to git
 - the whole user's interaction is an evolving tree of actions

avoid changing line numbers

insert break/dump points, run code as another entity

need to have each sub log somewhere what it does

then we have this huge shape of the program's execution
 - look for patterns

these patterns involve some data nature and some program nature

we can look for places where svg gets linked to anything
one butter creates another butter for increasing experiment
like an intellectual caterpillar slipping into the future

so we need to automatically hack hooks into butter and execute it
the hooks note whats happening back to the past
hopefully the program can be re-executed and happen exactly the same
so we can go up to a point and hit pause
simple

entropy field == light cone for data?
with total functional entropy figured by watching execution of test cases
hmm indeed

queries are middle managers.
if the top boss works infinitely fast as computers do he can deal with everything.

an invention:
render shapes at random, endeavouring genetically using human to point out bits
that look like this or that
build with that a visual vocabulary
use that to generate a noisy field that could be interpreted by four square orientations
into four sequences of a comic
all this kind of formulaicism
if you see the images in different order is your brain effectively prepared differently

looking at the screen vs not.
may be something to experiment with.

summarise and this little thing growing in note() are a case of data massage
from one set into a string various ways, pulling out extra bits of info
or recursing deeper in, always with some limitation
seems like the kind of thing to take care of easily somehow

it's all about massaging data

click click

make a tool for capturing the path from one point in the graph to another

make a tool for drawing links

get_object turns into a dispatcher

make them dispatch tables/graphs for get_object so we can start hacking on it fast

get_object will get the object of stylehouse in to being

life works through its means

structures for structures. perhaps it wuld be more playful and fun and maybe even faster
to build something for sheer graph gaming, then distill a stylehouse from what's possible
to imitate in there. probably just an insightful exercise...

we are all stylehouses. get to the point of freedom of expression where you're just applying styles.
it's not the end, it's just the stylehouse. what then.

we want to find patterns in the notation:
 everything under a certain call becomes a map
 apply the map to another certain call, if things are relatively the same then alright!
that would take a lot of coding but not much user clicking around time

code need tons of intellect put into it or it can be more open to the user's intellect

need a do_stuff() call with prgram graph limb, which calls anything cmplicated loaed there
as a mach

=head1 singularity X

It's made by itself

It's another graph infrastructure, called r2, made by compiling hacks and stuff held in an r1 graph.

Changes to how r2 graph infrastructure works becomes r3, tested from r2 until it's safe to hop up to it.

the $P graph is a table of contents for the program

hacks are expressed as machs attached to the $P graph

the $E graph is execution state/history
 a call stack down to a point
 pointers to dead graph etc.
 a way to pause, fork, change, resume continuously as a sexy debugging process

I suppose within the $E flow will be various entropy-related forces of execution

when compiling r2:
the machs are coded into place as subroutines (via the $E state machine)
there'll be more $P hooked gear for doing whatever complicated stuff comes along
  but it'll be more transient, eg some function needs to tidyup at some point

a case of tidyup is m.hits being cleared from the screen when something else happens
each hit counter is supposedly relative to the sub label, so perhaps that could be
found again and realigned or not found and removed

also the $U graph, stuff the user is doing

but lets not rush into recompiling/hardcoding complications yet
lets make the code for complications faster, caching them into perl data from graph masters
then get on with USING complixity to enhance enhance etc

WORDS
=cut

our $json = JSON::XS->new()->convert_blessed(1);
our $webbery = new Graph('webbery');
our $toolbar = new Graph('tools')->spawn('toolbar');
our $machs = $webbery->spawn("#mach");
our $port = "3000";
our $G;
our $TEST;
use File::Slurp 'append_file';
`cat /dev/null > notation`;

our $P = do { # {{{
# TODO eventually everything beyond the r1 Graph/Node/main stuff will be built up here
# then Graph/link will not refer to r1 Graph/link but r2 Graph/link which is generated
#   by conplications in G(program), which is run on r1
    my $P = new Graph('program');
    for (qw{
        Graph/link/done
        Graph/unlink/deleted_link
        get_object/01
        }) {
        my @path = split '/';
        my $pathmake;
        $pathmake = sub {
            my ($from, @path) = @_;
            my $next = shift @path;
            my $already = ref $from eq "Graph" ? $from->find('#'.$next) : $from->linked('#'.$next);
            $from = $already || $from->spawn("#". $next);
            $pathmake->($from, @path) if @path;
        };
        $pathmake->($P, @path);
    }
    $P
};

my $todo_per_point_cache = {};
sub pointilise {
    my $point = shift;
    my @path = split '/', $point;
    my $next = shift @path;
    my $p = $P->find("#".$next);
    $p or die "no such $next";
    while (@path) {
        $next = shift @path;
        $p = $p->linked("#".$next);
        $p or die "no such $next";
    }
    return $p;
}
sub attach_stuff {
    my ($p, $mach) = @_;
    delete $todo_per_point_cache->{$p};
    my $point = pointilise($p);
    $point->link($mach);
    say "attached $mach->{id} to $p";
}
sub detach_stuff {
    my ($p, $mach) = @_;
    delete $todo_per_point_cache->{$p};
    my $point = pointilise($p);
    unless (ref $mach) {
        $mach = $machs->linked("$mach");
    }
    say "doing detach of $mach->{id} to $p";
    $point->unlink($mach);
}
sub do_stuff {
    my ($p, @a) = @_;
    unless ($P) {
        say "P graph setup phase";
        return
    };

    my $todo_cached = $todo_per_point_cache->{$p};
    my @machs;
    if (defined $todo_cached) {
        @machs = @$todo_cached;
    }
    else {
        my $point = pointilise($p);
        @machs = grep { $_->linked($machs) } $point->linked();
        $todo_per_point_cache->{$p} = [@machs];
    }

    my $plan = {};
    for my $m (@machs) {
#        say " running mach ". $m->id;
#        say "args @a";
        my $r = $m->thing->(@a);
        if (ref $r eq "HASH" && $r->{changeofplan}) {
            $plan = $r; # TODO multiplicity clobbered: geometry testing will make the haphazard okay
        }
    }
    return $plan;
} # }}}


sub note { # {{{
    my $args = \@_;
    my @a;
    my $splash;
    my $sply;
    $sply = sub { # TODO refactor together the SOOMs
        my $t = shift;
        return '~undef~' if !defined $t;
        return "'$t'" if !ref $t;

        given (ref $t) {
            when ("CODE") {
                return "CODE";
            }
            when (/Node|Graph|Travel/) {
                if ($t->{uuid}) {
                    return ref($t)."=$t->{uuid}"
                }
                else {
                    my $hash = $splash->($t) unless $_[0];
                    $hash ||= "%t";
                    return ref($t)." NO UUID: ".$hash
                }
            }
            when ("HASH") {
                return $splash->($t);
            }
            when ("ARRAY") {
                return '['.join(", ", map { $sply->($_) } @$t).']';
            }
            when (/Mojolicious::Controller/) {
                return 'Mojo'
            }
            default {
                die "unknown ref: ".ref $t;
            }
        }
        die" ";
    };
    $splash = sub {
        my $hr = shift;
        return "{ ".join(", ", map { $sply->($_, "noresplash") } %$hr)." }"
    };
    my $i = 0;
    while ((caller($i++))[0]) {}
    for (@$args) {
        push @a, $sply->($_);
    }
    my $ind = join "", (" ")x$i;
    append_file("notation", $ind. shift(@a)."\t". join(", ", @a) ."\n");
} # }}}


our %graphs; # {{{
package Graph;
use YAML::Syck;
use strict;
use warnings;
sub new {
    shift;

    my $self = bless {}, __PACKAGE__;
    $self->{name} = main::uniquify_id(\%main::graphs, shift || "unnamed");
    $self->{links} = [];
    $self->{nodes} = [];
    $main::graphs{$self->{name}} = $self;
    $self->{uuid} = main::make_uuid();
    main::reg_object_uuid($self);
    return $self
}
sub name {
    return $_[0]->{name};
}
sub link {
    my ($self, $I, $II, @val) = @_;
    $I = $self->spawn($I) unless ref $I eq "Node";
    $II = $self->spawn($II) unless ref $II eq "Node";
    my $l = {
        0 => $I, 1 => $II,
        val => [@val],
    };
    push @{$self->{links}}, $l;
    main::do_stuff('Graph/link/done', $self, $l);
}
sub unlink {
    my ($self, @to_unlink) = @_;
    Carp::confess 'nothing to unlink' unless @to_unlink;
    my %to_unlink;
    for (@to_unlink) {
        warn "different graphs.. ".
            main::summarise($_->{0}) ." vs ". main::summarise($_->{1})
            if ($_->{1}->{graph} ne $_->{0}->{graph}
                || $_->{1}->{graph} ne $self->{uuid})
                && !($_->{0}->id =~ /drawings|animations|removals/
                     || $_->{0}->thing && $_->{0}->thing eq "svg")
    }
    $to_unlink{$_->{_id} || "$_"} = undef for @to_unlink;
    my $links = $self->{links};
    for my $i (reverse 0..@$links-1) {
        if (exists $to_unlink{$links->[$i]}) {
            my $name = $links->[$i];
            my $l = splice @$links, $i, 1;
            delete $to_unlink{$name};
            main::do_stuff('Graph/unlink/deleted_link', $self, $l);
            return unless keys %to_unlink;
        }
    }

}
sub denode {
    my ($self, @to_denode) = @_;
    my %to_denode;
    for my $n (@to_denode) {
        $to_denode{$n} = $n;
    }
    my $nodes = $self->{nodes};
    for my $i (reverse 0..@$nodes-1) {
        if ($to_denode{$nodes->[$i]}) {
            my $gone = delete $to_denode{$nodes->[$i]};
            splice @$nodes, $i, 1;
        }
    }
    if (%to_denode) {
        my ($one) = values %to_denode;
        die "failed to delete node: ".Dump[
            map { main::summarise($_) } values %to_denode
        ];
    }
}
sub map_nodes {
    my ($self, $code) = @_;
    my @nodes = @{$self->{nodes}};
    for my $n (@nodes) {
        $code->($n);
    }
}
sub first {
    $_[0]->{nodes}->[0]
}
sub find {
    my ($self, $thing) = @_;
    my @nodes;
    $self->map_nodes(sub {
        if ($thing =~ /^#/ ? main::spec_comp($thing, $_[0])
             : defined $_[0]->{thing} && $_[0]->{thing} eq $thing) {
            push @nodes, $_[0];
        }
    });
    wantarray ? @nodes : shift @nodes;
}
sub find_id {
    my ($self, $id) = @_;
    my $node;
    eval { $self->map_nodes(sub { "$_[0]" =~ $id && do { $node = $_[0]; } }) };
    $@ = "" if $node;
    die $@ if $@;
    return $node;
}
sub spawn {
    my $self = shift;
    my $n = Node->new(
        graph => $self,
        thing => shift,
    );
    push @{$self->{nodes}}, $n; #TODO weaken? garbage collect?
    return $n;
}
sub DESTROY {
    my $self = shift;
    say "DESTROY ".main::summarise($self);
    for my $l (@{$self->{links}}) {
        delete $l->{$_} for keys %$l;
    }
    undef $self->{links};
    undef $self->{nodes};
    delete $main::graphs{$self->{name}};
};
package Node;
use strict;
use warnings;
use List::MoreUtils 'uniq';

sub new { # graph => $graph,
    shift;
    my $self = bless {}, __PACKAGE__;
    my %params = @_;
    $self->{graph} = $params{graph}->{uuid};

    $self->{uuid} = main::make_uuid();
    main::reg_object_uuid($self);

    $self->{thing} = $params{thing};
    if ($self->{thing} && $self->{thing} =~ /^#/) {
        $self->id($self->{thing});
        undef $self->{thing};
    }

    return $self
}
sub TO_JSON {
    my $self = shift;
    return join "  ", "$self:", %$self
}
our $field;
sub spawn {
    my $self = shift;
    my $spawn = $self->graph->spawn(shift);
    $self->link($spawn, @_);
    $spawn->{field} = $field if $field;
    return $spawn;
}
sub in_field {
    my $self = shift;
    my $code = shift;
    $self->{field} = $field = $self->{field} ||= main::make_uuid();
    $code->($self);
    undef $field;
}
sub id {
    my $self = shift;
    if (my $id = shift) {
        $id =~ s/^#//;
        $self->{id} = $id;
    }
    return $self->{id};
}
sub trash {
    my $self = shift;
    my $field = shift;
    die $field if $field;
    if ($self->{field}) {
        my (@links, @nodes);
        main::travel($self, { forward_links => sub {
            my ($G, $ex, $ls) = @_;
            if ($G->{field} && $G->{field} eq $self->{field}) {
                $ex->{via_link}->{0} || return;
                ref $G eq "Node" || die "hur";
                die "field leaving graph at ".main::summarise($G)
                    if $G->{graph} ne $self->{graph};
                push @links, $ex->{via_link};
                push @nodes, $G;
            }
            else {
                push @links, $ex->{via_link};
                @$ls = ();
            }
        } });
        $self->graph->unlink(uniq @links) if @links;
        push @nodes, $self;
        $self->graph->denode(uniq @nodes) if @nodes;
    }
    else {
        for my $n ($self->linked) {
            say main::summarise($self)." going to delete ".main::summarise($n);
            $self->unlink($n);
        }
        $self->graph->denode($self);
    }
}
sub graph {
    my $self = shift;
    until ($main::objects_by_id{$self->{graph}}) {
        say $self->{graph}." not existing";
        say $self ." (".$self->thing.") is looking for another graph to be in...";
        $self->{graph} = shift @{ $self->{other_graphs} || [] } || do {
            say "No other graphs"; return undef;
        };
        say "Found $self->{graph} called ".$main::objects_by_id{$self->{graph}}->{name};
    }
    return $main::objects_by_id{$self->{graph}}
}
sub another_graph {
    my $self = shift;
    my $other_graph = shift;
    my $ogs = $self->{other_graphs} ||= [];
    push @$ogs, $other_graph unless grep { $other_graph eq $_ } @$ogs;
}
sub link {
    $_[0]->graph->link(@_)
}
# TODO require node or link input
sub unlink {
    my ($self, @others) = @_;
    my @links;
    @others = grep { !(ref $_ eq "HASH" && $_->{0} && $_->{1}
                        && do { push @links, $_; 1 }) } @others;
    for my $o (@others) {
        for my $l ($self->links($o)) {
            push @links, $l
        }
    }
    if (@others && !@links) {
        Carp::cluck "not actually linked: ".main::Dump { main::summarise($self) => [ map { main::summarise($_) } @others ] };
        return;
    }
    $self->graph->unlink(@links)
}
sub linked {
    my ($self, $spec) = @_;
    my @linked = uniq map { $_->{1} } $self->links($spec);
    wantarray ? @linked : shift @linked;
}
# so also if ga n1 links to gb n2, n2 should find n1 somehow
sub links {
    my ($self, $spec) = @_;
    if (!$spec) {
        return main::getlinks(from => $self);
    }
    else {
        return main::search(
            start=> $self,
            spec => $spec,
            want => "links",
        );
    }
}
sub thing {
    $_[0]->{thing} || $_[0]->{id} || die "nothing in ". Dump $_[0];
}
package Travel;
use strict;
use warnings;
sub new {
    shift;
    my %p = @_;
    my $self = bless {}, __PACKAGE__;
    if ($p{ignore}) {
        $self->ignore(delete $p{ignore});
    }
    if (%p) {
        $self->{ex} = \%p;
    }
    return $self;
}
sub ignore {
    my $self = shift;
    push @{$self->{ignore}||=[]}, main::tup(shift);
}
sub travel {
    my $self = shift;
    $main::G = shift || $main::G;
    my $ex = $self->{ex} || {};
    if ($self->{ignore}) {
        my @ignores = map {
            /^->\{(.+)\}$/ ? do {
                my $k = $1;
                sub { ref $_[0]->{1} eq "Node"
                    && ref $_[0]->{1}->thing eq "HASH"
                    && $_[0]->{1}->thing->{$k} }
            } : /^nonref$/ ?
                sub {
                    ref $_[0]->{1} eq "Node" || return 0;
                    !ref $_[0]->{1}->thing }
              : /^(\w+)$/ ? do {
                my $w = $1;
                sub {
                    $_[0]->{1}->thing eq $w
                }
            } : /^#(.+)$/ ? do {
                my $id = $1;
                sub {
                    $_[0]->{1}->{id} && $_[0]->{1}->{id} eq $id
                }
            } :
            die "don't know how to ignore a $_"
        } main::tup($self->{ignore});
        my $anything_to_ignore = sub {
            my $l = shift;
            for (@ignores) {
                return 1 if $_->($l)
            }
            return 0
        };
        $ex->{new_links} = sub {
            my ($G, $ex, $l) = @_;
            @$l = grep { !$anything_to_ignore->($_) } @$l
        };
    }
    my %params = @_ == 1 ? (everywhere => $_[0]) : @_;
    while (my ($k, $v) = each %params) {
        if (exists $ex->{$k}) {
            $ex->{$k} = sub {
                $ex->{$k}->(@_);
                $v->(@_);
            };
        }
        else {
            $ex->{$k} = $v
        }
    }
    main::travel($main::G, $ex, main::summarise($main::G));
}
package main;
#}}}

sub mach_spawn { # {{{
    my $m = $machs->spawn(shift);
    $m->{thing} = shift;
    if ($_[0] && $_[0] eq "toolbar") {
        $toolbar->link($m);
    }
    return $m
}
attach_stuff("Graph/link/done", mach_spawn("#graph_interlinkage", sub {
    my ($g, $l) = @_;
    if ($l->{0}->graph ne $l->{1}->graph) {
        $l->{1}->another_graph($l->{0}->graph->{uuid});
    }
}));
attach_stuff("Graph/unlink/deleted_link", mach_spawn("#unlink_sanitycheck", sub {
    my ($g, $l) = @_;
    # TODO could check that $l intended at $n->unlink gets $g->unlinked (here)
    # TODO for that we'd need to look up the $E graph until we found the $P Node/unlink call
    # TODO this sub is doing nothing, it's sorta too late to check the sanity of the unlink
    die "unlinked ". Dump($l) if (($l->{1}->thing . $l->{0}->thing) =~ /findable_objects/);
})); # }}}

mach_spawn("#filesystem", sub { # {{{
    my ($self, $mojo, $client) = @_;
    my $fs = new Graph ("filesystem"); 
    my $fs_head = $fs->spawn("/home/steve/Music/The Human Instinct");
    use File::Find;
    find(sub {
        return if $_ eq "." || $_ =~ /\/\.rockbox/;
        my $dir = $fs->find($File::Find::dir);
        $dir || die "no dir... $File::Find::dir";
        $dir->spawn($File::Find::name);
    }, $fs_head->thing);
    $fs->map_nodes(sub {
        my $G = shift;
        ($G->{thing}) = $G->{thing} =~ /\/([^\/]+)$/;
    });
    get_object($mojo, $fs->{uuid});
}); # }}}

mach_spawn("#codes", sub { # {{{ COD
    my ($self, $mojo, $client) = @_;
    my $codes = codes();
    get_object($mojo, $codes->{uuid});
});
sub codes {
    my @code = read_file('butter.pl');
    my @chunks = ([]);

    while ($_ = shift @code) {
        if (0 && /^=head1/) {
            1 until shift(@code) =~ /^=cut/;
            next;
        }
        elsif (/^\S/ && !/^(use|our|#).+/) {
            unless (/^\}/) {
                push @chunks, [$_];
                next;
            }
        }

        push @{ $chunks[-1] }, $_;
    }
    my $codes = new Graph("codes");
    my $i = 0;
    my $p = "main";
    my @fb;
    for (map { join "", @$_ } @chunks) {
        my $code = $_;
        $p = $1 if /^package (\w+);/;
        my %etc;
        $etc{sub} = $1 if /^sub (\w+) {/;
        $etc{sub} = "mach $1" if /^mach_spawn\("#(\w+)", sub {/;

        $codes->spawn({
            code => $code,
            i => $i++,
            p => $p,
            %etc,
        });

        if ($etc{sub} && $etc{sub} !~ /note|DESTROY|summarise/) {
            my $notecode = "main::note('$p\:\:$etc{sub}', \@_);";
            $code =~ s/(sub (\w+ )?\{)/$1 $notecode/
                || die "faile $code";
        }
        push @fb, $code;
    }
    write_file("frankenbutter.pl", join "", @fb);
    return $codes;
}
sub short_codegraph {
    my $codes = shift;
    my $byp = {};
    my $short = Graph->new("shortcodegraph")->spawn("root");
    $codes->map_nodes(sub {
        my $n = shift;
        my $p = $byp->{$n->{thing}->{p}} ||= [];
        push @$p, $n;
    });
    while (my ($k, $v) = each %$byp) {
        my $p = $short->spawn($k);
        my @ns = sort { $a->{thing}->{i} <=> $b->{thing}->{i} } @$v;
        for my $n (@ns) {
            if ($n->{thing}->{sub}) {
                $p->spawn({
                    sub => $k."::".$n->{thing}->{sub},
                    origin => $n->{uuid},
                });
            }
        }
    }
    return $short;
}
# }}}
if ($0 =~ /frankenbutter/) {
    $port = "3001";
    # start webbery on another port
    # fork for test routines
    # reload subroutines as butter hacks them up
}
else {
    my $codes = codes();
    my $short= short_codegraph($codes);
    if (my $pid = fork()) {
        $webbery->spawn($short)->id("#codegraph");
        # start our own webbery, talk to frankenbutter
    }
    else {
        say "  $$ exec'ing frankbutter.pl ...";
        exec "perl frankenbutter.pl";
    }
}

mach_spawn("#tbutt", sub { # {{{
    my ($self, $mojo, $client) = @_;

    start_timer();
    my ($rc, @output) = capture_err("perl", "tbutt.t.t", "harnessed");

    say "test run $rc with ".scalar(@output);
    my $run = $webbery->spawn("#testrun");
    $run->spawn(["return code", $rc]);
    $run->spawn(["time", show_delta()]);

    my $res = "parse error";
    for (reverse @output) {
        if (/# Looks like you failed (\d+) tests of (\d+)/) {
            $res = $2-$1." / $2";
            last;
        }
    }
    my ($ok, $notok, @blabs);
    push @blabs, { '...' => [] };
    for (@output) {
        if (/^ok (\d+)/) {
            $ok++
        }
        elsif (/^not ok (\d+)/) {
            $notok++
        }
# in each forked process the oks will reiterate
        if (my ($d) = /^# (.+)$/) {
            push @blabs, { $d => [] };
            if ($d =~ /BEGIN fork\(\)/) {
# start a branch
            }
            elsif ($d =~ /END fork\(\) \((.+)\)/) {
# finish a branch
            }
        }
        else {
            my $h = $blabs[-1];
            my ($a) = values %$h;
            push @$a, $_
        }
    }
    $run->spawn(["result", $res]);
    $run->spawn(["oks", $ok]);
    $run->spawn(["notoks", $notok]);
    $run->spawn(["diags", [map { keys %$_ } @blabs]]);


    get_object($mojo, $run->{uuid});
}, "toolbar"); # }}}

# {{{ the linkstash
our %objects_by_id;
use UUID;
use Scalar::Util 'weaken';
sub make_uuid {
    UUID::generate(my $uuid);
    UUID::unparse($uuid, my $stringuuid);
    $stringuuid =~ s/^.+-(.+?)$/$1/;
    return $stringuuid;
}
sub reg_object_uuid {
    my $o = shift;
    weaken $o;
    my $stringuuid = $o->{uuid} || die;
    $objects_by_id{$stringuuid} = $o;
}
sub object_by_uuid {
    my $id = shift;
    if (!exists $objects_by_id{$id}) {
        return undef;
    }
    elsif (!defined $objects_by_id{$id}) {
        # weak link  garbage collected
        delete $objects_by_id{$id};
        return undef;
    }
    else {
        return $objects_by_id{$id}
    }
}
sub dump_graph_yml {
    my ($file, $graph) = @_;
    my $first = $graph;
    my $graphs = { $graph->{uuid} => $graph };
    my $yaml;
    my $loop = 1;
    while ($loop) {
        $loop = 0;
        $yaml = Dump([ $first, values %$graphs ]);
        while ($yaml =~ /graph: ([0-9a-f]{12})/g) {
            $graphs->{$1} ||= do {
                $loop = 1;
                object_by_uuid($1);
            };
        }
    }
    write_file($file, $yaml);
    say "wrote $file";
}
sub load_graph_yml { #LOAD
    my $file = shift;
    my $graphs = LoadFile($file);
    for my $graph (@$graphs) {
        $objects_by_id{$graph->{uuid}} = $graph;
    }
    for my $graph (@$graphs) {
        travel($graph, sub {
            my ($G) = shift;
            my $id = $G->{uuid};
            if (ref $G eq "Graph") {
                if (exists $main::graphs{$G->{name}}) {
                    warn "already got a graph named $G->{name}!"
                        unless $TEST;
                }
                $main::graphs{$G->{name}} = $G;
            }
            if (exists $objects_by_id{$id}) {
                die "Dump restore clang:".
                    Dump [$G, $objects_by_id{$id}]
                        if "$G" ne "$objects_by_id{$id}";
            }
            $objects_by_id{$id} = $G;
        });
    }
    return wantarray ? @$graphs : $graphs->[0]
}

sub search { # TODO {{{
    my %p = @_;
    $p{start} || confess "where?";
    if ($p{want} && $p{want} eq "links") {
        return getlinks(from => $p{start}, to => $p{spec});
    }
    elsif ($p{want} && $p{want} =~ /^G\((\S+)\)$/) {
        my $graph_name = $1;
        my $res = new Graph($graph_name);
        my $trav = $p{traveller} || Travel->new(
            ($p{ignore} ? (ignore => $p{ignore}) : ())
        );
        my %tps = ( everywhere => sub {
            my ($G, $ex) = @_;
            if ($ex->{previous}) {
                my $found = $res->find($ex->{previous});
                $found->spawn($G, $ex->{via_link});
            }
            else {
                $res->spawn($G);
            }
        } );
        for (qw'forward_links') {
            $tps{$_} = $p{$_} if defined $p{$_};
        }
        $trav->travel($p{start}, %tps);
        return $res;
    }

}
sub getlinks {
    my %p = @_;

    my @links;
    if ($p{to} && ref $p{to} eq "Node") {
        if (!$p{to}->graph) {
            say "$p{to} is no more?";
        }
        else {
            @links = @{$p{to}->graph->{links}}
        }
    }
    if ($p{from} && ref $p{from} eq "Node") {
        if (!$p{from}->graph) {
            say "$p{from} is no more?";
        }
        else {
            @links = @{$p{from}->graph->{links}}
        }
    }

    @links = map { main::order_link($p{from}, $_) } @links if $p{from};
    @links = grep { main::spec_comp($p{to}, $_) } @links if $p{to};

    return @links;
}

# trvl
sub goof {
    my ($start, $etc) = @_;
    if ($etc =~ /^\+ (#\w+) ?(\{\})?$/) { # + means autovivify
        my ($spec, $default) = ($1, $2);
        my @ed = $start->linked($spec);
        #confess "heaps of $spec from $start: ".Dump[@ed] if @ed > 1;
        my $ed = shift @ed;
        unless ($ed) {
            if ($default) {
                eval '$default = '.$default.';';
                confess "interpolating $default: $@" if $@;
            }
            $ed = $start->spawn($default);
            $ed->id($spec);
        }
        return wantarray ? ($ed, @ed) : $ed;
    }
    else {
        confess "goof $start: $etc is crazy";
    }
} # }}}

sub hook {
    my ($ex, $hook) = (shift, shift);
    return unless exists $ex->{$hook};
    $ex->{$hook}->($G, $ex, @_);
}
sub travel { # TRAVEL
    $G = shift || $G;
    my $ex = shift if ref $_[0] eq "HASH";
    $ex ||= {};
    $ex->{everywhere} = shift if ref $_[0] eq "CODE";
    unless ($ex->{seen_oids}) {
        $ex->{depth} = 0;
        $ex->{seen_oids} = {};
        $ex->{via_link} = undef;
    }
    hook($ex, "everywhere");

    if ($ex->{depth} > 500) {
        die "DEEP RECURSION!";
    }
    
    unless (ref $G eq "Node" && $main::objects_by_id{$G->{graph}}
        || ref $G eq "Graph" && $main::objects_by_id{$G->{uuid}}) {
        confess "graph $G->{graph} has been destroyed!";
    }
    my @links;
    if (ref $G eq "Node") {
        @links = getlinks(from => $G);
    }
    elsif (ref $G eq "Graph") {
        @links = map { { 1 => $_ } } @{$G->{nodes}};
    }
    hook($ex, "all_links", \@links);

    @links = grep { !$ex->{via_link} || $_ ne $ex->{via_link} } @links;
    hook($ex, "forward_links", \@links);

    @links = grep { ! exists $ex->{seen_oids}->{"$_->{1}"} } @links;
    hook($ex, "new_links", \@links);

    $ex->{seen_oids}->{"$G"} ||= { summarise($G) => [] }; #\@links };

    #die if grep { $G ne $_->{0} } @links;
    my $next_depth = $ex->{depth} + 1;
    my $previous = $G;
    for my $l (@links) {
        $G = $l->{1};
        $ex->{seen_oids}->{"$G"} ||= { summarise($G) => [] };
    }
    for my $l (@links) {
        my $ex = { %$ex };
        $ex->{via_link} = $l;
        $ex->{previous} = $previous;
        $ex->{depth} = $next_depth;
        $ex->{stack} = [@{$ex->{stack} || []}, summarise($G)];
        
        #say "TRAVELOONG $l->{0} -> $l->{1}";
        $G = $l->{1};
        travel($l->{1}, $ex, main::summarise($main::G))
    }
}

sub spec_comp {
    my $spec = shift;
    my $node = shift;
    my $l;
    if (ref $node eq "HASH") {
        $l = $node;
        $node = $l->{1};
    }
    my $thing = $node->{thing};

    if ($spec =~ /^#(.+)$/) {
        my $id = $1;
        return 0 unless defined $node->{id};
        if ($id =~ m{^/(.+)/$}) {
            $id = $1;
            return $node->{id} =~ $id;
        }
        else {
            return $node->{id} && $node->{id} eq $id;
        }
    }

    if ($spec =~ /^{(\w+) => (\.\.\.|\{\})\}$/) { # hash with key
        my $key_exists = $1;
        my $keys_value = $2;
        return ref $thing eq "HASH"
            && exists $thing->{$key_exists};
    }

    if ($spec =~ /^G\((.+?)\)$/) { # graph name
        my $name = $1;
        return ref $thing eq "Graph"
            && $thing->{name} =~ /$name/;
    }

    if ($spec =~ /^l\((\w+)\)$/) {
        my $linkval = $1;
        say "$linkval vs $l->{val}->[0]";
        return 1 if $l->{val}->[0] eq $linkval;
        return 0
    }

    return 1 if $spec && $spec eq "*";
    my $not = $spec =~ s/^!//;
    my $r = ref $spec   ? $node eq $spec      # an object
            : $spec     ? do {
                confess "still using non-ref spec: $spec";
                ref $node eq $spec  # package name
            }
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
            1 => $l->{0}, 0 => $l->{1},
            val => $l->{val}, _id => "$l",
        }
    }
    return ()    
}

sub summarise { # SUM # SOOM
    my $thing = shift;
    my $text;
    given (ref $thing) {
        when ("Graph") {
            $text = "Graph ".($thing->{name}||"~noname~")." ".($thing->{uuid}||"~nouuid~")
        }
        when ("Node") {
            my $inner = $thing->thing;
            my $id = $thing->id;
            my $graph = $thing->graph;
            my $graph_name = $graph ? $graph->name : "ORPHAN";
            $text = "N($graph_name) ".($id ? "$id " : "").summarise($inner);
            unless (ref $inner eq "Node") {
                my $addy = $thing->{uuid};
                $text .= " $addy"
            }
        }
        when ("HASH") {
            if ($thing->{code}) {
                $text = '$code'
            }
            else {
                eval {
                $text = encode_json($thing)
                };
                if ($@) {
                    $text = Dump($thing);
                    say "but whatever: $@";
                }
                $text =~ s/^(.{40})(.+)$/"$1...".length($2)/e;
            }
        }
        when ("ARRAY") {
            eval {
            $text = encode_json($thing)
            };
            if ($@) {
                $text = Dump($thing);
                say "but whatever: $@";
            }
            $text =~ s/^(.{40})(.+)$/"$1...".length($2)/e;
        }
        when ("CODE") {
            $text = "code";
        }
    }
    if (!defined $thing) {
        $text = "~undef~";
    }
    $text ||= "$thing";
    return $text;
}


sub tup {
    my $tuple = shift;
    ref $tuple eq "ARRAY" ? @$tuple : $tuple;
}
sub uniquify_id {
    my ($pool, $string) = @_;
    while (exists $pool->{$string}) {
        $string =~ s/(\d*)$/($1||1)+1/e;
    }
    return $string
}

sub displow {
    my $ob = shift;
    my @lines;
    travel($ob, { everywhere => sub {
        my ($G, $ex) = @_;
        push @lines, join '', (" ") x $ex->{depth}, summarise($G);
    } } );
    return join "\n", map { s/ \(.+?\)$//; $_; } @lines;
}


# }}}

mach_spawn("#tout", sub { #{{{
    my ($self, $mojo, $client) = @_;
    $mojo->drawings(Load("tout.yml"));
}, "toolbar");#}}}


mach_spawn("#dsplay", sub { #{{{
    my ($self, $mojo, $client) = @_;
    start_timer();
    my $dump = load_graph_yml("td.yml");
    say "Load graph took: ".show_delta();
    my $begin = $dump->find("#find") || $dump;
    get_object($mojo, $begin->{uuid});
});#}}}

mach_spawn("#reexamine", sub { # {{{
    my ($self, $mojo, $client) = @_;

    my $exam = find_latest_examination($self, $mojo, $client)->thing;
    my $svg = $client->linked("#svg");
    my $reremo = goof($client, "+ #reremo {}");
    my @drawings = map {
        map {
            $_->[0] =~ /^(label|boxen)$/ || die "Nah ". Dump $_;
            $_->[1] +=  $client->linked("#width")->thing / 2 - 100;
            $_->[-1]->{class} .= " re".$_->[-1]->{id};
            #            $_->[0] eq "label" && die "woohoo!";
            $reremo->{ $_->[-1]->{id} }++;
            $_
        } @{ dclone($_)->{elements} }
    } map { $_->{val}->[0] }
    grep { $_->{1}->{graph} eq $exam->{uuid} } $svg->links;

    return $mojo->drawings(@drawings);
}, "toolbar"); # }}}

mach_spawn("#notation", sub { # {{{
    my ($self, $mojo, $client) = @_;

    my $r = new Graph("notation")->spawn("#root");
    my @notation = read_file('notation');
    my $l = 0;
    my $ind_limit = 5;
    my @notes;
    for (@notation) {
        s/^(\s+)/('.') x length($1)/e;
        $l++;
        if (length($1) >= $ind_limit) {
            unless ($notes[-1] =~ /etc/) {
                push @notes, "$l ".((".") x $ind_limit)."etc 0"
            }
            my ($c) = $notes[-1] =~ /etc (\d+)/;
            $c++;
            $notes[-1] =~ s/etc \d+/etc $c/;
            say $notes[-1];
        }
        else {
            push @notes, $l." ".$_;
        }
    }
    for (@notes) {
        $r->spawn($_);
    }
    get_object($mojo, $r->{uuid});
}, "toolbar"); # }}}


mach_spawn("#hits", sub { # {{{
    my ($self, $mojo, $client) = @_;

    my $exam = find_latest_examination($self, $mojo, $client)->thing;
    my $svg = $client->linked("#svg");
    my $reremo = goof($client, "+ #reremo {}");

    my @notation = read_file('notation');
    my $i = 0;
    my $hits = {};
    for (@notation) {
        my ($sub) = /^\s+'(.+?)'/;
        $hits->{$sub}++;
    }

    my @drawings = map {
        map {
            # add the number of hits beside the subroutine
            my $label = $_;
            if ($label->[3] =~ /::/) {
                my $id = $label->[-1]->{id};
                $label->[-1]->{class} .= " re".$id;
                $reremo->{$id}++;

                $label->[1] += 300;

                my $total = $hits->{$label->[3]} || '0';
                $label->[3] = "hit $total times";

                $label
            }
            else {
                ()
            }
        } grep { $_->[0] =~ /label/ }
            @{ dclone($_)->{elements} }
    } map { $_->{val}->[0] }
    grep { $_->{1}->{graph} eq $exam->{uuid} } $svg->links;

    return $mojo->drawings(@drawings);
}, "toolbar"); # }}}


mach_spawn("#dump_trail", sub { # {{{
    my ($self, $mojo, $client) = @_;
    my $trail = $client->linked("#trail")->thing;
    say join "", map { 'restep("'.join('", "', @$_).'");'."\n" } @$trail;
    return $mojo->drawings([status => "dumped trail to console"]);
}, "toolbar"); # }}}



$webbery->spawn("#clients");

# define the TOOLBAR
$toolbar->link($webbery);
if (my $cg = $webbery->find("#codegraph")) {
    $toolbar->link($cg->thing);
}


our $client; # TODO low priority though is sessions
# TODO also is stateless data access functions, so butter can interrogate frankenbutter

use Mojolicious::Lite;
get '/hello' => \&hello;
sub home {
    return $webbery->find("#notation")->{uuid}
}
sub hello {
    my $mojo = shift;

    my $clients = $webbery->find("#clients");

    # trash the old state
    for my $client ($clients->linked()) {
        $clients->unlink($client);
        $client->trash;
    }

    $clients->spawn("the")->in_field(sub {
        $client = shift;
        $client->id("#client");
        $client->spawn([])->id("#trail");
        $client->spawn("#svg");
        $client->spawn({})->id("#translates");
    });

    $mojo->render(json => [object => { id => home() }]);
}
my $findable_y = 20;
get '/width' => sub {
    my $mojo = shift;
    my $width = $mojo->param('width');
    $client->in_field(sub{
        shift->spawn($width)->id("width");
    });
    $mojo->render(json => "Q");
};

sub draw_findable { # TOOLBAR
    # TODO this should be just another thing in webbery...
    my ($self, $mojo, $client) = @_;
    my $findable_y = $findable_y;
    my ($width) = $client->linked("#width")->thing;
    my $x = $width - 35;

    my $svg = $client->linked("#svg");
    my @new;
    for my $ble ($toolbar->linked()) {
        my $sum = summarise($ble);
        my ($name, $id, $color) = nameidcolor($sum);
        $name = "$name $id";
        $sum =~ s/ .{12}$//;
        push @new, grep { $svg->link($ble, $_); 1 }
            ["boxen", $x, do { $findable_y += 40 }, 30, 30,
                { fill => $color, name => $name, id => $id, } ],
            ["label", $x - length($sum)*8.5, $findable_y, $sum,
                { id => $id } ]
    }
    return @new;
}

sub nameidcolor { #{{{
    my $summarised = shift;
    if ($summarised =~
        m{^(?:N\(.+?\) )*(.+) (.+(...))$}) {
        my ($name, $id, $color) = ($1, $2, $3);
        $name = "$name $id";
        return ($name, $id, $color);
    }
    else {
        return ("$summarised", "???", "000");
    }
};#}}}

sub examinate_graph {
    my $graph = shift;

    my $exam = new Graph('graph-exam');
    $exam = $exam->spawn("Graph exam");

    if ($graph->{name} eq "codes") {
    }
    else {
        $graph->map_nodes( sub {
            $exam->spawn(shift);
        } );
    }

    return $exam;
}

attach_stuff("get_object/01", mach_spawn("#track", sub { # {{{
    my ($self, $mojo, $client) = @_;

    my $id = $self->linked("#id")->thing;

    my $trail = $client->linked("#trail")->thing;

    if (home() eq $id && @$trail == 0) {
        push @$trail, [ "home" ];
        return;
    }

    for my $n ($toolbar->linked()) {
        if ($n->{uuid} eq $id) {
            push @$trail, [ "toolbar", summarise($n) ];
            return;
        }
    }

    my $exam = find_latest_examination(undef, undef, $client);
    if ($exam) {
        my $svg = $client->linked("#svg");
        $exam = $exam->thing;
        my %by_y;
        $exam->map_nodes(sub {
            my $n = shift;
            my ($svgl) = $svg->links($n);
            my $y = $svgl->{val}->[0]->{y};
            $by_y{$y} = $n;
        });
        for my $y (sort keys %by_y) {
            my $n = $by_y{$y};
            if ($n->thing eq "Graph") {
                say Dump($n->thing);
            }
            if ($n->thing->{uuid} eq $id) { # summarise($n->thing) =~ $id) {
                push @$trail, [ "exam", $y, summarise($n) ];
                return;
            }
        }
    }

    if (home() eq $id) {
        push @$trail, [ "home" ];
        return;
    }

    push @$trail, [ "?" ]; # eg some mach generates a get_object call
})); # }}}


# TODO another toolbar mach to kick this one off
# TODO then cont is to grab the notation slice indicated by ids
#      make a pattern to reapply where the user wants
#      let the user select specify acceptable irregularities
#      there'll be lots of emergent code patterns with only variables changing
mach_spawn("#clickcapture", sub {
    my ($n, $cont, $self, $mojo, $client) = @_;

    $client->spawn({ n => $n, cont => $cont, ids => [] }, "#clickcap");

    attach_stuff("get_object/01", mach_spawn("#clickcapture_click", sub { # {{{
        my ($self, $mojo, $client) = @_;
        my $id = $self->linked("#id")->thing;
        my $cap = $client->graph->find("#clickcap")->thing;
        my $ids = $cap->{ids};
        push @$ids, $id;
        if (@$ids >= $cap->{n}) {
            detach_stuff("get_object/01", "clickcapture_click"); # TODO detach_myself() in machworld
            $cap->{cont}->($ids, @_);
        }
    }));
});
# }}}

get '/object' => \&get_object;
sub get_object { # OBJ
    my $mojo = shift;

    my $id = shift || $mojo->param('id')
        || die "no id";


    $id =~ s/-(l|b|c)\d*$//; # id is #..., made uniqe
    my $mode = $1 || "b";

    defined $client || return $mojo->sttus("hit F5!");
    my $self = $client->spawn("#get_objection");
    $self->in_field(sub {
        shift->spawn($id)->id('id');
    });

    my $object = object_by_uuid($id)
        || return $mojo->sttus("$id no longer exists!");



    my $r = do_stuff('get_object/01', $self, $mojo, $client);
    if ($r->{changeofplan} && $r->{changeofplan} eq "return") {
        # TODO better than this
        return;
    }



    start_timer();
    my $status = "For ". summarise($object);
    if (ref $object eq "Graph") {
        # can't traverse from a graph so create a list of Nodes and continue with that
        $object = examinate_graph($object);
    }
    elsif (ref $object eq "Node") {
        if ($machs->linked($object)) {
            return $object->thing->($object, $mojo, $client);
        }
    }
    else {
        confess ref $object;
        return $mojo->sttus("don't like to objectify ".ref $object);
    }

    $self->spawn($object)->id('object');

    my $viewed = find_latest_examination($self, $mojo, $client);
    $client->spawn($viewed)->id("#viewed") if $viewed;

    if ($TEST) {
        $TEST->spawn($viewed)->id("viewed");
        if (my $h = $TEST->linked("#viewed_hook")) {
            $h->thing->();
        }
    }

    if ($mode eq "c") {
        $object = $viewed->thing->first->thing; # do it again
        $self->linked("#object")->{thing} = $object;
    }

    ($viewed, my $viewed_node) = ($viewed->thing, $viewed) if $viewed;

    make_traveller($self, $mojo, $client);
    my $exam = search_about_object($self, $mojo, $client);
    if ($TEST) {
        $TEST->spawn($exam)->id("exam");
        if (my $h = $TEST->linked("#exam_hook")) {
            $h->thing->();
        }
    }

    for (qw'drawings animations removals') {
        $self->spawn([])->id($_);
    }

    # TODO
    generate_svg($self, $mojo, $client);
    if ($TEST) {
        if (my $h = $TEST->linked("#svg_hook")) {
            $h->thing->();
        }
    }

    diff_svgs($self, $mojo, $client);

    fill_in_svg($self, $mojo, $client);

    my $clear;
    if (!$viewed && $mode ne "c") { # TODO hmm
        $clear = "viewed";
    }

    unless (@{ $self->linked("#animations")->thing }) {
        $clear = "noanim";
    }

    if ($TEST) {
        use Storable 'dclone';
        $TEST->spawn(dclone {
            id => $id,
            removals => $self->linked("#removals")->thing,
            animations => $self->linked("#animations")->thing,
            drawings => $self->linked("#drawings")->thing,
        })->id("#drawings");
    }

    my @drawings;
    for (qw'removals animations drawings') {
        my $bit = $self->linked("#".$_);
        push @drawings, @{ $bit->thing };
        for my $l ($bit->links) {
            $bit->unlink($l);
        }
        $self->graph->denode($bit);
    }

    unshift @drawings, ["status", $status];
    if ($clear) {
        $drawings[0]->[1] .= "(clear=$clear)";
# TODO the rest of the screen should be structured graph
# theres probably a group thing in svg that can tidily remove etc...
        unshift @drawings, draw_findable(undef, $mojo, $client); 
        unshift @drawings, ["clear", $clear];
        if ($TEST) {
            $TEST->spawn($drawings[0])->id("#clear");
        }
    }
    if (my $reremo = $client->linked("#reremo")) {
        $reremo = $reremo->thing;
        for my $id (keys %$reremo) {
            delete $reremo->{$id};
            unshift @drawings, ['remove' => $id] unless $clear;
        }
    }
    for my $old_viewed ($client->linked("#viewed")) {
        trash_viewed_exam($client, $old_viewed);
    }
    $self->trash();
    say $status ." in ". show_delta();
    $mojo->drawings(@drawings);
};

sub trash_viewed_exam {
# this should be more like a hook on the client->exam link destruction
# al-so placing the exam #viewed should happen upon client->self (get_object) destruction
# then it's all ready for the next round
# get_object should have more clearly defined persistances I guess
# sort out some time when we can see things happening
    my ($client, $viewed) = @_;
    my $exam = $viewed->thing->thing;
    ref $exam eq "Graph" || confess "not graph: ".summarise($exam);
    my $svg = $client->linked("#svg");
    for (uniq map { $_->{1} }
        grep { $_->{1}->{graph} eq $exam->{uuid} } $svg->links()) {
        $svg->unlink($_);
        $_->graph->denode($_);
    }
    $client->unlink($viewed);
    $viewed->graph->denode($viewed);
}

sub find_latest_examination {
    my ($self, $mojo, $client) = @_;

    my @exams = $client->linked("#/^object-examination/");

    @exams = sort {
        my ($a, $b) =
            grep { s/^.+?(\d+)$/$1/ || s/^.+$/1/ }
            map { $_->thing->{name} } $a, $b;
        $a <=> $b
    } @exams;

    my $latest = pop @exams;
    for my $old_viewed ($client->linked("#viewed")) {
        warn "Got an old #viewed exam: ".summarise($old_viewed);
        trash_viewed_exam($client, $old_viewed);
    }
    return $latest;
}

sub make_traveller {
    my ($self, $mojo, $client) = @_;
    if ($self->linked("#traveller")) {
        Carp::cluck "traveller exists already..."
    }
# TODO for traversing for get_object without running into backstage stuff
# fields to outdate?
    my $traveller = Travel->new(
        ignore =>
            ["->{iggy}", "#object-examination", "#ids"],
    );
    $self->spawn($traveller)->id("#traveller");
}

sub search_about_object {
    my ($self, $mojo, $client) = @_;
    my $object = $self->linked("#object")->thing;
    my $traveller  = $self->linked("#traveller")->thing;
    my $exam = search(
        start => $object,
        spec => '**',
        want => "G(object-examination)",
        traveller => $traveller,
        forward_links => sub {
            my ($G, $ex, $links) = @_;
            if (ref $G eq "Node" && $G->id && $G->id eq "svg") {
                @$links = () unless $ex->{depth} < 2;
            }
        },
    );
    for ($self, $client) {
        $_->spawn($exam)->id("#object-examination");
    }
    return $exam;
}

sub generate_svg { # GEN
    my ($self, $mojo, $client) = @_;

    my $ids = goof($client, "+ #ids {}")->thing;
    my $getid = sub {
        my $id = uniquify_id($ids, shift);
        $ids->{$id} = undef; # TODO eh
        return $id;
    };
    my $exam = $self->linked("#object-examination")->thing;
    my $traveller  = $self->linked("#traveller")->thing;
    my $svg = $client->linked("#svg");

    my $y = 0;

    $traveller->travel($exam->first, sub {
        my ($en, $ex) = @_;
        my $n = $en->thing;
        my $thing = $n;

        $thing = ref $thing eq "Node" ? $thing->{thing} : "G=$thing->{name}";

        $svg->link($G, {
            y => $y++,
            x => $ex->{depth},
        });
    });
}

sub diff_svgs {
    my ($self, $mojo, $client) = @_;

    my $drawings = $self->linked("#drawings");
    my $animations = $self->linked("#animations");
    my $removals = $self->linked("#removals");

    my $traveller = $self->linked("#traveller")->thing;
    my $viewed = $client->linked("#viewed");
    $viewed = $viewed->thing if $viewed;
    $viewed = $viewed->thing if $viewed;
    my $exam = $self->linked("#object-examination")->thing;
    my $svg = $client->linked("#svg");

    my %new_uuids;
    $traveller->travel($exam->first, sub {
        my ($new, $ex) = @_;
        $new_uuids{$new->thing->{uuid}}++;

        my @old = $viewed->find($new->thing) if $viewed;
        # for not hittting the same thing twice in the old exam
        my $old_i = $new_uuids{$new->thing->{uuid}} - 1;
        my $oldn = $old[$old_i];

        if ($oldn) {
            $animations->link($new, $oldn);
        }
        else {
            $drawings->link($new);
        }
    });

    if ($viewed) {
        $traveller->travel($viewed->first, sub {
            my ($old, $ex) = @_;
            unless ($new_uuids{$G->thing->{uuid}}
                && $new_uuids{$G->thing->{uuid}}-- > 0) {
                $removals->link($old);
            }
        });
    }
}

sub chlnkg {
    my ($new, $anim, $draw) = @_;
    my @an = $anim->linked($new);
    my @dr = $draw->linked($new);
    unless (@an == 1 || @dr == 1) {
        die Dump{anim=>\@an, draw=>\@dr};
    }
}


sub fill_in_svg {
    my ($self, $mojo, $client) = @_;

    my $drawings = $self->linked("#drawings");
    my $animations = $self->linked("#animations");
    my $removals = $self->linked("#removals");
    my $translates = $client->linked("#translates")->thing;
    my $traveller = $self->linked("#traveller")->thing;
    my $viewed = $client->linked("#viewed");
    $viewed = $viewed->thing if $viewed;
    $viewed = $viewed->thing if $viewed;
    my $exam = $self->linked("#object-examination")->thing;
    my $svg = $client->linked("#svg");

# fill out svg first
# turn divvy up animations

# svg element removal is by class so lets use oaid
# TODO removals' olds should be a field so it don't find its links to $self
    my $viewed_uuid = $viewed ? $viewed->{uuid} : "nothing";
    for my $old (grep { $_->{uuid} eq $viewed_uuid } $removals->linked) {
        my ($oaid) = map { $_->{val}->[0]->{oaid} } $svg->links($old);
        say "old is ".$old." ".summarise($old);
        $oaid || die;
        eval {
            $svg->unlink($old);
        };
        if ($@ && $@ =~ /nothing to unlink/) {
            say "Nothing to unlink svg -> ".Dump($G);
        }
        else {
            die $@ if $@;
        }
        push @{ $removals->thing }, [remove => $oaid];
    }

# oaid    $uuid-$sn             class on the bunch of things for this exam $G
# id        $oaid-[bcl]$sn?     id on the svg element
    my $e_by_tuuids = {};
    my $e_by_y = {};
    $traveller->travel($exam->first, sub {
        my ($new, $ex) = @_;

        chlnkg($new, $animations, $drawings);
        ($new->thing->{graph} || $new->thing->{uuid}) ne $exam->{uuid} || die;

        # gather uuids for possible indexing
        my $tuuid = $new->thing->{uuid};
        my $euuid = $new->{uuid};
        my $by = $e_by_tuuids->{$tuuid} ||= [];
        push @$by, $new;

        # by y position
        my ($y) = map { $_->{val}->[0]->{y} } $svg->links($new);
        $e_by_y->{$y} && die;
        $e_by_y->{$y} = $new;
    });

    for my $y (sort keys %$e_by_y) {
        my $new = $e_by_y->{$y};
        my ($svgv) = map { $_->{val}->[0] } $svg->links($new);
        $svgv || die;

        my $oaid = do {
            my $tuuid = $new->thing->{uuid};
            my @es = $e_by_tuuids->{$tuuid};
            @es > 0 || die;
            
            if (@es > 1) {
                my $i = 0;
                $i++ until $es[$i] eq $new;
                $tuuid .= "-$i";
            }
            $tuuid;
        };

        my $stuff = summarise($new->thing);
        my ($name, $id, $color) = nameidcolor($stuff);
        my (@elements, $height);

        push @elements, [ 'boxen', -20, -2, 18, 18, {
            fill => $color,
            name => $name,
            id => "$oaid-b",
        } ];
        push @elements, [ 'boxen', -4, -2, 4, 18, {
            fill => "000$color",
            stroke=> "000",
            id => "$oaid-c",
        } ];

        if (ref $new->thing eq "Node" &&
            ref $new->thing->thing eq "HASH" && $new->thing->thing->{code}) {
            my $li = 0;
            my $code = $new->thing->thing->{code};
            $code =~ s/\s+\Z//sgm;
            $code =~ s/(?<=\n\n)\n+//sgm;
            for my $line (split /\n/, $code) {
                my ($ind) = $line =~ /^( +)/;
                my $x = (length($ind || "")) * 10;
                my $y = $li * 14;

                unshift @elements, [ 'label', $x, $y, $line, {
                    id => "$oaid-l$li",
                } ];
                $li++;
            }
            $height = ($li+1) * 14;
        }
        else {
            my %etc;
            if ($new->linked > 2) {
                $etc{'font-weight'} = "bold";
            }
            if ($new->thing->graph->name eq "shortcodegraph"
                && ref $new->thing->thing ne "") {
                $stuff = $new->thing->thing->{sub};
            }
            push @elements, [ 'label', 0, 0, $stuff, {
                id => "$oaid-l",
                %etc,
            } ];
        }

        for my $e (@elements) {
            my $a = $e->[-1];
            $a->{class} = "";
            $a->{class} .= "$a->{fill} " if $a->{fill};
            $a->{class} .= $oaid;
        }

        $height ||= 20;
        $svgv->{height} = $height;
        $svgv->{elements} = \@elements;
        $svgv->{oaid} = $oaid;
    }

    my ($posx, $posy) = (30, 40);
    my $new_translates = {};
    my $y_add = 0;
    for my $y (sort keys %$e_by_y) {
        my $new = $e_by_y->{$y};
        my ($svgv) = map { $_->{val}->[0] } $svg->links($new);
        $svgv || die;

        my $y = $y * 20 + $y_add + $posy;
        my $x = $svgv->{x} * 20 + $posx;
        for my $e (@{$svgv->{elements}}) {
            $e->[1] += $x;
            $e->[2] += $y;
        }

        if (my ($anim_l) = $animations->links($new)) {
            my ($old) = $anim_l->{val}->[0];
            $old || die;
            my ($old_svgv) = map { $_->{val}->[0] } $svg->links($old);
            $old_svgv || die;
            
            confess unless @{$old_svgv->{elements}} == @{$svgv->{elements}};

            my $eg = [$old_svgv->{elements}->[0], $svgv->{elements}->[0]];
            my $dx = $eg->[1]->[1] - $eg->[0]->[1]; # new - old x
            my $dy = $eg->[1]->[2] - $eg->[0]->[2]; # new - old y

            say "Oacid diffrances" unless $old_svgv->{oaid} eq $svgv->{oaid};
            my $trid = $old_svgv->{trid} || $svgv->{oaid};
            $svgv->{trid} = $trid;

            my $trans = $translates->{$trid};
            $trans->{x} += $dx;
            $trans->{y} += $dy;
            $new_translates->{$trid} = $trans;

            for my $e (@{ $svgv->{elements} }) {
                my $id = $e->[-1]->{id};
                push @{ $animations->thing },
                    ["animate", $id,
                    {svgTransform => "translate($trans->{x} $trans->{y})"},
                    300]
            }
        }
        elsif ($drawings->linked($new)) {
            push @{ $drawings->thing },
                @{ $svgv->{elements} }
        }
        else {
            die;
        }
        $y_add = $y_add + ($svgv->{height} - 20);
    }
    %$translates = %$new_translates if %$new_translates;
    return;
}

get '/object_info' => sub {
    my $mojo = shift;
    $mojo->sttus("shag off!");
};

get '/' => 'index';

no warnings 'once';
*Mojolicious::Controller::drawings = sub {
    my $mojo = shift;
    say scalar(@_)." drawings";
#    DumpFile("drawings.yml", [@_]);
    $mojo->render(json => [@_]);
};
*Mojolicious::Controller::sttus = sub {
    my $mojo = shift;
    $mojo->drawings(["status", shift]);
};
use warnings;

return 1 if caller;
use Mojo::Server::Daemon;
my $daemon = Mojo::Server::Daemon->new;
$daemon->listen(['http://*:'.$port]);
$daemon->run;
__DATA__

@@ index.html.ep
<!doctype html><html>
    <head><title>scap!</title>
    <script type="text/javascript" src="jquery-1.7.1.js"></script></head>
    <style type="text/css">
    @import "jquery.svg.css";
    </style>
    <script type="text/javascript" src="jquery.svg.js"></script>
    <script type="text/javascript" src="jquery.svganim.js"></script>
    <script type="text/javascript" src="scope.js"></script></head>
    <body style="background: #ab6; font-family: monospace">
    <div id="view" style="background: #ce9"></div>
    </body>
</html>

