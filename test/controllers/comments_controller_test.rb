require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "Can create comment" do
      post "/api/articles/1/comments",
        params: {comment: {commenter: "INSERT TEST", body: "INSERT TEST INJSON ", status: "public"}}
      comment = Comment.new(response.parsed_body)
      assert_equal(Comment.last, comment)
      assert_response :success
  end

  test "Can't create comment without a body" do
    post "/api/articles/1/comments",
      params: {comment: {commenter: "INSERT TEST", body: "", status: "public"}}
      assert_response :unprocessable_entity
  end
  test "Can't create comment without a body with 10 char" do
    post "/api/articles/1/comments",
      params: {comment: {commenter: "INSERT TEST", body: "123456789", status: "public"}}
      assert_equal({"body"=>["is too short (minimum is 10 characters)"]},response.parsed_body)
      assert_response :unprocessable_entity
  end

  test "Can't create comment without a valid status" do
    post "/api/articles/1/comments",
      params: {comment: {commenter: "INSERT TEST", body: "HELLLOOOO JSOOOOON", status: "INVALID"}}
      assert_equal({"status"=>["is not included in the list"]},response.parsed_body)
      assert_response :unprocessable_entity
      
  end

  test "Can't create comment whitout commenter" do
     post "/api/articles/1/comments",
       params: {comment: {commenter: "", body: "INSERT TEST INJSON ", status: "public"}}
       assert_equal({"commenter"=>["can't be blank"]} ,response.parsed_body)
       assert_response :unprocessable_entity
  end 

  test "Can Delete a existing comment " do 
    assert_difference 'Comment.count', -1 do
      delete "/api/articles/0/comments/0"
    end
  end

  test "Can't Delete a no existing comment " do 
    assert_raises(ActiveRecord::RecordNotFound) do
      delete "/api/articles/0/comments/6666"
    end
  end
  test "Can get one comment from one artcile " do
      get "/api/articles/0/comments/0"
      assert_response :success
  end
  test "can get all comment from one articles" do
      get "/api/articles/0/comments/"
      assert_response :success
  end
  test "can't can no existing comment " do
    assert_raises(ActiveRecord::RecordNotFound) do
      get "/api/articles/0/comments/666"
    end
  end

end
