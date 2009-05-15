use strict;
use warnings;
use inc::Module::Install;

name 'Method-Cumulative';
all_from 'lib/Method/Cumulative.pm';

requires 'Sub::Attribute';
requires 'MRO::Compat' if $] < 5.010;

build_requires 'ExtUtils::ParseXS';

test_requires 'Test::More'      => 0.62;
test_requires 'Test::LeakTrace' => 0.08;
test_requires 'parent';

tests 't/*.t';
author_tests 'xt';

no_index directory => 'example';

WriteMakefile(
	OBJECT => '$(O_FILES)',

	clean  => {FILES => q(
		Method-Cumulative-* *.stackdump
		*.gcda *.gcno *.gcov
		nytprof *.out
		cover_db
	)},
);
