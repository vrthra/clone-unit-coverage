#java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar \
#com.github.timurstrekalov.saga.cli.Main \
#-b ~/research/jquery/ \
#-i 'test/index.html' \
#-o /var/www/reports -s PER_TEST -n '.*test.*js$' $*

classpath=$sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar

java -cp $classpath com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/core-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/callback-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/deferred-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/support-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/data-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/queue-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/attributes-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/event-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/selector-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/utilities-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/slector2-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/traversing-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/css-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/ajax-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/effects-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/offset-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/exports-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/deprecated-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
java -cp $sagacli/target/classes:$sagacore/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/jquery/ -i 'test/dimensions-test.html' -o /var/www/reports -s PER_TEST -n '.*test.*js$' $*
