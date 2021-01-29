class Api::CommentsController < ApiController
before_action :set_comment, only: [:show] 
  def create
    @article = Article.find(params[:article_id])
    puts(:params)
    @comment = @article.comments.create(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def index 
    @article = Article.find(params[:article_id])
    render json: @article.comments.to_json()
  end
  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    render json: @comment, status: :ok
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body,:status)
    end
end
