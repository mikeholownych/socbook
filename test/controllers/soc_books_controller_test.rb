require 'test_helper'

class SocBooksControllerTest < ActionController::TestCase
  setup do
    @soc_book = soc_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soc_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soc_book" do
    assert_difference('SocBook.count') do
      post :create, soc_book: {  }
    end

    assert_redirected_to soc_book_path(assigns(:soc_book))
  end

  test "should show soc_book" do
    get :show, id: @soc_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soc_book
    assert_response :success
  end

  test "should update soc_book" do
    patch :update, id: @soc_book, soc_book: {  }
    assert_redirected_to soc_book_path(assigns(:soc_book))
  end

  test "should destroy soc_book" do
    assert_difference('SocBook.count', -1) do
      delete :destroy, id: @soc_book
    end

    assert_redirected_to soc_books_path
  end
end
