require "test_helper"
class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "Bobby", email: "bobby@booboo.org")  #if we use new, then there will not be an id in the databae
    @recipe = @chef.recipes.build(name: "Chicken Parmesan", summary: "This is the best chicken parmaesan recipe ever", description: "Heat oil, add onions, cook on high for 4 hours until toasty burnt")
  end
  
  test "Recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "Name should be present" do
    @recipe.name = ""
    assert_not  @recipe.valid?
  end
  
  test "Name should not be too long" do
    @recipe.name = "T" * 101
    assert_not @recipe.valid?
  end
  
  test "Name should not be too short" do
        @recipe.name = "T" * 4
        assert_not @recipe.valid?
  end
  
  test "summary must be present" do
     @recipe.summary = ""
     assert_not @recipe.valid?
  end
  
  test "summary length should not be too long" do
    @recipe.summary = "T" * 151
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too short" do
        @recipe.summary = "T" * 9
        assert_not @recipe.valid?
  end
  
  test "description must be present" do
         @recipe.description = ""
     assert_not @recipe.valid?
  end
  
    test "description length should not be too long" do
          @recipe.description = "T" * 501
    assert_not @recipe.valid?
  end
  
  test "description length should not be too short" do
            @recipe.description = "T" * 19
        assert_not @recipe.valid?
  end
  
  test "chef id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
end