require 'test_helper'

class IncomeCategoriesControllerTest < ActionController::TestCase
  setup do
    @income_category = income_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:income_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create income_category" do
    assert_difference('IncomeCategory.count') do
      post :create, income_category: { name: @income_category.name }
    end

    assert_redirected_to income_category_path(assigns(:income_category))
  end

  test "should show income_category" do
    get :show, id: @income_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @income_category
    assert_response :success
  end

  test "should update income_category" do
    patch :update, id: @income_category, income_category: { name: @income_category.name }
    assert_redirected_to income_category_path(assigns(:income_category))
  end

  test "should destroy income_category" do
    assert_difference('IncomeCategory.count', -1) do
      delete :destroy, id: @income_category
    end

    assert_redirected_to income_categories_path
  end
end
