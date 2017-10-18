class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy, :error]
  after_action :verify_authorized, except: [:new]

  def index
    @articles = current_user.articles
    authorize Article
  end

  def show
    authorize @article
  end

  def new
    @article = current_user.articles.build
  end

  def edit
    authorize @article
  end

  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @article

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        #format.json { render :show, status: :ok, location: @article }
        format.json {
          render json: {
              code: '200',
              data: [@article]
          }
        }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @article

    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def user_not_authorized
      # render :file => 'public/404.html', :status => :not_found, :layout => false
      render :file => 'public/404.html', :status => :not_found
    end

    def set_article
      @article = current_user.articles.find_by(id: params[:id]) || Article.new
    end

    def article_params
      params.require(:article).permit(:title)
    end
end
