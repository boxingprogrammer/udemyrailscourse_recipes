require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "John", email: "john@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chefname should not be too long" do
    @chef.chefname = "T" * 41
    assert_not @chef.valid?
  end
  
  test "chefname should not be too short" do
    @chef.chefname = "T" * 2
    assert_not @chef.valid?
    
  end

  test "email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "email length should not be too long" do
    @chef.email = "T" * 100 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email address should be unique" do
    @chef.email = "john@example.com"
    @chef.save
    chef_dup = @chef.dup
    chef_dup.email = @chef.email.upcase
    assert_not chef_dup.valid?
  end
  
  test "email address must be valid - check valid" do
    valid_address = %w[user@eee.com R_TDD-DS@eee.hello.org first.last@example.com cr@io.io laura+jo@io.com poo@io.io.io]
   
    valid_address.each do |va|
      @chef.email = va
      assert @chef.valid?, "#{va.inspect} should be valid"
    end
  end
    
  
  test "email address must be valid - check INVALID" do
  invalid_address = %w[user.eee.com @eee.hello.org first\\last@example.com cr@io!io laura+jo@io.i_am_com]
   
    invalid_address.each do |iva|
      @chef.email = iva
      assert_not @chef.valid?, "#{iva.inspect} should be INVALID"
    end
    
  end
  

  
end