# Unit Test Frameworks for JS

[wiki](http://en.wikipedia.org/wiki/List_of_unit_testing_frameworks#JavaScript)

- JSUnit [JQuery](http://docs.jquery.com/QUnit)

````Javascript
test("a basic test example", function() {
  ok( true, "this test is fine" );
  var value = "hello";
  equal( value, "hello", "We expect value to be hello" );
});
````
Uses browser to execute and show results.

- FireUnit [FireBug](http://ejohn.org/blog/fireunit/)

Needs Firefox

- QUnit
- Mocha
- [YUI Test](http://developer.yahoo.com/yui/yuitest/)
- JSSpec
- JSpec

- [Jasmine](http://pivotal.github.com/jasmine/)
````Javascript
describe("A suite", function() {
  it("contains spec with an expectation", function() {
    expect(true).toBe(true);
  });
});
````
- [Screw.Unit](http://github.com/nkallen/screw-unit)
- Smoke [blueridge](http://github.com/relevance/blue-ridge)
- [JsUnit](http://www.jsunit.net/)
- [RhinoUnit](http://rhinounit.googlecode.com/)
- jsTest
- [CrossCheck](http://sourceforge.net/projects/crosscheck/)
  Simulation based.
- [JSMock](http://jsmock.sourceforge.net/)
- [JSNUnit](http://www.valleyhighlands.com/testingframeworks/)
- [Javascript Assertion Unit](http://sourceforge.net/projects/jsassertunit)
- jsTestDriver [Google](http://code.google.com/p/js-test-driver/)
- [script.aculo.us](http://madrobby.github.com/scriptaculous/unit-testing/)
````Javascript
new Test.Unit.Runner({
   testCountVowels: function () {
     this.assertEqual(2, countVowels("Hello"));
     this.assertEqual(0, countVowels("Krk"));
   }
});
````
- [BusterJS](http://busterjs.org/docs/overview/)

## Caveats

- Dont know how to unit test UI stuff.
- Things that use a browser to run and show tests are harder to use.
- Unit of unittesting is functions. It is not entirely clear how to extract them because
  it seems that functions are also used as modules.
- We need to figure out what portion of a library is actually concerned with testing.
  So as to make a matrix of which functions have a good coverage over a given function.

# Coverage toosl JS


Contains review of state of art.

