java -cp saga-cli/target/classes:saga-core/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main \
     -b ~/research/scriptaculous \
     -i 'test/unit/*test.html' \
     -i 'test/functional/*test.html' \
     -o /var/www/reports -s PER_TEST -n 'test/.*js$' $*
