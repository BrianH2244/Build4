require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  def setup
    @task = tasks(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Task.count' do
      post :create, task: { importantTasks: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Task.count' do
      delete :destroy, id: @task
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong task" do
    log_in_as(users(:michael))
    task = tasks(:ants)
    assert_no_difference 'Task.count' do
      delete :destroy, id: task
    end
    assert_redirected_to root_url
  end

end