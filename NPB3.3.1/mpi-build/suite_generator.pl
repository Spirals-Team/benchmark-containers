use strict;
use warnings;

# benchmarks in the suite:
my %benchmarks = (
        "cg" => { "iterator"  => \&powerof2, "classes" => ['S', 'W', 'A', 'B', 'C', 'D', 'E']},
        "dt" => { "iterator"  => \&powerof2, "classes" => ['S', 'W', 'A', 'B']},
        "ep" => { "iterator"  => \&powerof2, "classes" => ['S', 'W', 'A', 'B', 'C', 'D', 'E']},
        "ft" => { "iterator"  => \&powerof2, "classes" => ['S', 'W', 'A', 'B', 'C', 'D', 'E']},
        "is" => { "iterator"  => \&powerof2, "classes" => ['S', 'W', 'A', 'B', 'C', 'D']},
        "lu" => { "iterator"  => \&powerof2, "classes" => ['S', 'W', 'A', 'B', 'C', 'D', 'E']},
        "mg" => { "iterator"  => \&powerof2, "classes" => ['S', 'W', 'A', 'B', 'C', 'D', 'E']},

        "bt" => { "iterator"  => \&square, "classes" => ['S', 'W', 'A', 'B', 'C', 'D', 'E']},
        "sp" => { "iterator"  => \&square, "classes" => ['S', 'W', 'A', 'B', 'C', 'D', 'E']},
);

# NB_PROC cli parameter:
my $max_nb_proc = shift or die "Usage: $0 MAX_NB_PROC\n";

# power of 2 iterator:
sub powerof2 {
    my $index = 0;
    return sub { return 2 ** $index++; };
}

# square iterator:
sub square {
        my $index = 1;
        return sub { return $index++ ** 2; }
}

# generate suite string for all benchmarks (classes + nb proc)
foreach my $bench (keys %benchmarks) {
        foreach my $class (@{$benchmarks{$bench}{classes}}) {
                my $next = $benchmarks{$bench}{iterator}->();
                while ((my $nb_proc = $next->()) <= $max_nb_proc) {
                        printf("$bench\t$class\t$nb_proc\n");
                }
        }
}
