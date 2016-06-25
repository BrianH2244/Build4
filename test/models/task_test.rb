require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @task = @user.tasks.build(importantTasks: "Lorem ipsum")
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "user id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end
  
  test "importantTasks should be present" do
    @task.importantTasks = "   "
    assert_not @task.valid?
  end

  test "importantTasks should be at most 300characters" do
    @task.importantTasks = "a" * 301
    assert_not @task.valid?
  end
  
  test "order should be most recent first" do
    assert_equal tasks(:most_recent), Task.first
  end
end
