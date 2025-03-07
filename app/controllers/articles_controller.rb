class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: ENV['USER'], password: ENV['PASSWORD'], except: [:index, :show]

  def index
    @articles = Article.all 
  end

  def show
    @article = Article.find(params[:id])

    if @article.is_public? || (@article.is_private? && current_user)
      @article
    else
      redirect_to root_path
    end
  end

  def new
    @article = Article.new
  end

  def create
    if current_user
      @article = current_user.articles.new(article_params)

      if @article.save
        redirect_to @article
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
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
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :image)
  end

end
