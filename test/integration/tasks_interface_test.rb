require 'test_helper'

class TasksInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

#  test "task interface" do
#    log_in_as(@user)
#    get root_path
#    assert_select 'div.pagination'
    # Invalid submission
#    assert_no_difference 'Task.count' do
#      post tasks_path, task: { importantTasks: "" }
#    end
#    assert_select 'div#error_explanation'
    # Valid submission
#    importantTasks = "This task really ties the room together"
#    assert_difference 'Task.count', 1 do
#      post tasks_path, task: { importantTasks: importantTasks }
#    end
#    assert_redirected_to root_url
#    follow_redirect!
#    assert_match importantTasks, response.body
    # Delete a post.
#    assert_select 'a', text: 'delete'
#    first_task = @user.tasks.paginate(page: 1).first
#    assert_difference 'Task.count', -1 do
#      delete task_path(first_task)
#    end
    # Visit a different user.
#    get user_path(users(:archer))
#    assert_select 'a', text: 'delete', count: 0
#  end
end
