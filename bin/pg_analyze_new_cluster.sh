#!/bin/sh

echo 'This script will generate minimal optimizer statistics rapidly'
echo 'so your system is usable, and then gather statistics twice more'
echo 'with increasing accuracy.  When it is done, your system will'
echo 'have the default level of optimizer statistics.'
echo

echo 'If you have used ALTER TABLE to modify the statistics target for'
echo 'any tables, you might want to remove them and restore them after'
echo 'running this script because they will delay fast statistics generation.'
echo

echo 'If you would like default statistics as quickly as possible, cancel'
echo 'this script and run:'
echo '    "/usr/local/Cellar/postgresql/9.3.0/bin/vacuumdb" --all --analyze-only'
echo

sleep 2
PGOPTIONS='-c default_statistics_target=1 -c vacuum_cost_delay=0'
export PGOPTIONS
echo 'Generating minimal optimizer statistics (1 target)'
echo '--------------------------------------------------'
"/usr/local/Cellar/postgresql/9.3.0/bin/vacuumdb" --all --analyze-only
echo
echo 'The server is now available with minimal optimizer statistics.'
echo 'Query performance will be optimal once this script completes.'
echo

sleep 2
PGOPTIONS='-c default_statistics_target=10'
echo 'Generating medium optimizer statistics (10 targets)'
echo '---------------------------------------------------'
"/usr/local/Cellar/postgresql/9.3.0/bin/vacuumdb" --all --analyze-only
echo

unset PGOPTIONS
echo 'Generating default (full) optimizer statistics (100 targets?)'
echo '-------------------------------------------------------------'
"/usr/local/Cellar/postgresql/9.3.0/bin/vacuumdb" --all --analyze-only
echo

echo 'Done'
