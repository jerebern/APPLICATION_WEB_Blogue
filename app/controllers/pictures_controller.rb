class PicturesController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @picture = @article.pictures.create(picture_params)
        redirect_to article_path(@article)
    end
    
    private
        def picture_params
          params.require(:picture).permit(:name)
        end
end
