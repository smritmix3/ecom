require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

end
