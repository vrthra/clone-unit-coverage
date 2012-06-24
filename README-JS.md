## Unit Test Frameworks for JS

[wiki](http://en.wikipedia.org/wiki/List_of_unit_testing_frameworks#JavaScript)

- JSUnit [JQuery](http://jsunit.net/)

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

- [QUnit](http://docs.jquery.com/QUnit)
  JsChillicat
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

## Coverage toosl JS

- [JSCoverage](http://siliconforks.com/jscoverage/)
- [ScriptCover](http://code.google.com/p/script-cover/)
  Chrome Extension
- [JesCov](http://jescov.olabini.com/)
- [coveraje](http://coveraje.github.com/)
- Sonar
- [Saga](http://timurstrekalov.github.com/saga/)
- [JsTestDriverCoverage](http://code.google.com/p/js-test-driver/wiki/CodeCoverage)

## Similarity Analysis

- [moss](http://theory.stanford.edu/~aiken/moss/) (Web Service)
- [CloneDR](http://www.semanticdesigns.com/Products/Clone/) (Not Free - 500$) 
- [Same](http://sourceforge.net/projects/same/) (Line based - for Text - not PL)
- [JCCD](http://jccd.sourceforge.net/) API - may be able to adapt it to javascript.
- [Simian] (http://www.harukizaemon.com/simian/features.html) 
- [CPD] (http://pmd.svn.sourceforge.net/viewvc/pmd/trunk/pmd/src/main/java/net/sourceforge/pmd/lang/ecmascript/) - maybe - only basic support.
- [tctoolkit](http://code.google.com/p/tctoolkit/) - small project (inactive) uses pygments


## Observations

- Things that use a browser to run and show tests are harder to use for our purpose.
  - Unit is functions in JS unlike Java. It is not entirely clear how to extract them because
    it seems that functions are also used as modules.
- We need to figure out what portion of a library is actually concerned with testing.
    So as to make a matrix of which functions have a good coverage over a given function.
- Every one seems to be writing their own unit test frameworks,
    - At least 20 different Unit-test frameworks that get a mention in programming language sites.
    - Library specific unit tests (dojo/YUI/JQuery) that are not reusable elsewhere without
      modification.


