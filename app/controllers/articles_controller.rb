class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy, :error]
  after_action :verify_authorized, except: [:new, :create]

  def index
    @articles = current_user.articles
    authorize Article

    respond_to do |format|
      format.html { render :index }
      format.json
      format.js
    end
  end

  def show
    authorize @article

    respond_to do |format|
      format.json
      format.js
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.json
      format.js
    end
  end

  def edit
    authorize @article

    respond_to do |format|
      format.js
    end
  end

  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.json { render :show, status: :created, location: @article }
        format.js
      else
        format.json { render json: @article.errors, status: :unprocessable_entity }
        format.js { render 'noupdate.js.erb' }
      end
    end
  end

  def update
    authorize @article

    respond_to do |format|
      if @article.update(article_params)
        format.json { render :show, status: :ok, location: @article }
        format.js
      else
        format.json { render json: @article.errors, status: :unprocessable_entity }
        format.js { render 'noupdate.js.erb' }
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
      respond_to do |format|
        format.html {
          render :file => 'public/404.html', :status => :not_found
        }
        format.js { render '404.js.erb' }
      end
    end

    def set_article
      @article = current_user.articles.find_by(id: params[:id]) || Article.new
    end

    def article_params
      params.require(:article).permit(:title)
    end
end
