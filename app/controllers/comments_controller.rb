class CommentsController < ApplicationController

    # Require user authentication in order to delete a comment
    http_basic_authenticate_with name: "newrelic", password: "minigolf", only: :destroy

    # Get article object by querying for the article id, use the create method 
    # in the articles model to create an new comment in the database then 
    # redirect to article show view.
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end
    
    # Get article object by querying for the article id, get comment object by
    # querying for the comment in the article object that matches the comment
    # id. Delete that comment from the database and redirect to the article show view. 
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end 
    
    # Define comment_params in order to both require and permit commenter and 
    # body text
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
