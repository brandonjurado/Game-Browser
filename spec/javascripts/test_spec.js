// Run tests using -> rake teaspoon
//= require jquery
fixture.preload("home/index.html.erb");
describe("Testing", function() {
  beforeEach(function() {
    this.fixtures = fixture.load("home/index.html.erb", true); // append these fixtures which were already cached
  });

  it("datatable is populated on page load", function() {
    //expect(document.getElementById("game-table").tagName).to.be.equal("TABLE");
  });

  it("should make a real AJAX request", function () {
    var callback = jasmine.createSpy();
    BindTable();
    waitsFor(function() {
        return callback.callCount > 0;
    });
    runs(function() {
        expect(callback).toHaveBeenCalled();
    });
  });
});
