class ArticlesController < ApplicationController

    # Require user authentication on every action but index and show
    http_basic_authenticate_with name: "newrelic", password: "minigolf", except: 
    [:index, :show]
    
    # Get array of all article objects
    def index
        @articles = Article.all
    end

    # Get article object by querying for the article id
    def show
        @article = Article.find(params[:id])
    end

    # Create a new article object and render the form
    def new
        @article = Article.new
    end

    # Get article object to be updated by querying for the article id and render
    # the edit form
    def edit
        @article = Article.find(params[:id])
    end

    # Take the object created in new and attempt to save it to the database, if 
    # successful redirect to show view, if not render the new form again
    def create
        @article = Article.new(article_params)
 
        if @article.save
            redirect_to @article
        else
            render "new"
        end
    end
    
    # Get article object from edit and attempt to update it in database, if 
    # successful, redirect to show view, if not render the edit form again
    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    # Delete article in database
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
     
      redirect_to articles_path
    end
    
    # Define article_params in order to both require and permit title and text
    private
      def article_params
        params.require(:article).permit(:title, :text)
      end

end
