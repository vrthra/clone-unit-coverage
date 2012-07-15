echo "Not done"
java -cp saga-cli/target/classes:saga-core/target/classes:../saga-cli-1.0.10/saga-cli-1.0.10-jar-with-dependencies.jar com.github.timurstrekalov.saga.cli.Main -b ~/research/mootools/more -i 'Tests/Specs/index.html' -o /var/www/reports -s PER_TEST -n 'Tests/.*/.*\.js' $*
echo "Not done"
