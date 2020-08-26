class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def index
    @articles = Article.paginate(page: params[:page],per_page: 5)
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.find(2)
    if @article.save
      flash[:success] = "This article is successfully created"
      redirect_to article_path(@article)
    else
      render'new'
    end
  end

  def update
    @article = Article.new(article_params)
    if @article.update(article_params)
      flash[:success] = "This article is successfully updated"
      redirect_to article_path(@article)
    else
      render'edit'
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article is successfully deleted"
    redirect_to articles_path
  end


  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article=Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title,:description)

    end
end