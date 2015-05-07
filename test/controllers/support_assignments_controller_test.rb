require 'test_helper'

class SupportAssignmentsControllerTest < ActionController::TestCase
  setup do
    @support_assignment = support_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:support_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create support_assignment" do
    assert_difference('SupportAssignment.count') do
      post :create, support_assignment: { date: @support_assignment.date, user_id: @support_assignment.user_id }
    end

    assert_redirected_to support_assignment_path(assigns(:support_assignment))
  end

  test "should show support_assignment" do
    get :show, id: @support_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @support_assignment
    assert_response :success
  end

  test "should update support_assignment" do
    patch :update, id: @support_assignment, support_assignment: { date: @support_assignment.date, user_id: @support_assignment.user_id }
    assert_redirected_to support_assignment_path(assigns(:support_assignment))
  end

  test "should destroy support_assignment" do
    assert_difference('SupportAssignment.count', -1) do
      delete :destroy, id: @support_assignment
    end

    assert_redirected_to support_assignments_path
  end
end
