require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "Article must exist when creation" do 
      comment = Comment.new(commenter: 'test',body:"ASSERT TEST", status:"public" ,article_id:1)
      assert comment.save, "Comment Save When Exist"
    end

    test "Return false if Article doesn't exist" do
    comment = Comment.new(commenter: 'test',body:"ASSERT TEST", status:"public" ,article_id:666)
    assert_not comment.save, "Comment no Save When Article not Exist"
    end

    test "Commment must have a commenter" do
    comment = Comment.new(commenter:"" ,body:"ASSERT TEST", status:"public" ,article_id:0)
    assert_not comment.save , "Commment must have a commenter"
    end

    test "Comment must have a body 10 char" do
    comment = Comment.new(commenter: 'test',body:"123456789", status:"public" ,article_id:0)
    assert_not comment.save, "Comment must have a body 10 char"
    end

    test "Must return false if doesn't have aricle id" do
      comment = Comment.new(commenter: 'test',body:"ASSERT TEST" , status:"public", article_id:-1 )
      assert_not comment.save , "Article not saving when does'nt have article id"
    end

    test "Must return true when deleting comment" do
      assert Comment.destroy(0)
    end
    test "Must return ReccordNotFound on not comment when deleting not existing comment" do
      assert_raises(ActiveRecord::RecordNotFound) do
      Comment.destroy(666)
      end
    end
    test "Must return ReccordNotFound when comment not found" do
      assert_raises(ActiveRecord::RecordNotFound) do
      Comment.destroy(666)
      end
    end



end