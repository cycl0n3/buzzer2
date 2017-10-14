class ArticlePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @article = model
  end

  def index?
    true
  end

  def show?
    @current_user.admin? or @current_user == @article.user
  end

  def edit?
    @current_user.admin? or @current_user == @article.user
  end

  def update?
    @current_user.admin? or @current_user == @article.user
  end

  def destroy?
    @current_user.admin? or @current_user == @article.user
  end
end
