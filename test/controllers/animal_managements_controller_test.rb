require "test_helper"

class AnimalManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get animal_managements_new_url
    assert_response :success
  end
end
