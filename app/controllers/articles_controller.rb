class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "etd", password: "shawi", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new(picture: Picture.new)
  end

  def create
    @article = Article.new(article_params)
    @article.picture.image = params[:article][:picture_attributes][:image]
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params

      params.require(:article).permit(:article, :title, :body, :status, picture_attributes: [ :id, :name, :image ])
    end
end
