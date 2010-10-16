require 'test_helper'

class JokesControllerTest < ActionController::TestCase
  setup do
    @joke = jokes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jokes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create joke of length 300" do
    body = '-'*Joke::MAX_LENGTH
    assert_difference('Joke.count') do
      post :create, :joke => @joke.attributes.merge(:body => body)
    end

    assert_redirected_to joke_path(assigns(:joke))
    assert_equal body, Joke.last(:order => 'created_at').body
  end

  test "should not create joke of length 301" do
    body = '-'*Joke::MAX_LENGTH+'-'
    assert_no_difference('Joke.count') do
      post :create, :joke => @joke.attributes.merge(:body => body)
    end
    assert_response :success
  end

  test "should not create joke with no body" do
    body = ''
    assert_no_difference('Joke.count') do
      post :create, :joke => @joke.attributes.merge(:body => body)
    end
    assert_response :success
  end

  test "should show joke" do
    get :show, :id => @joke.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @joke.to_param
    assert_response :success
  end

  test "should update joke" do
    put :update, :id => @joke.to_param, :joke => @joke.attributes
    assert_redirected_to joke_path(assigns(:joke))
  end

  test "should destroy joke" do
    assert_difference('Joke.count', -1) do
      delete :destroy, :id => @joke.to_param
    end

    assert_redirected_to jokes_path
  end
end
