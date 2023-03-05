class MypageController < ApplicationController
  ActiveRecord::Base.connection.execute("SELECT setval('articles_id_seq', coalesce((SELECT MAX(id)+1 FROM articles), 1), false)")
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    user = current_user
    @articles = user.articles
  end

  def show
    user = current_user
    @articles = user.articles

  end

  def new
  end

  def edit
  end


  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: "#{t('activerecord.models.article')}を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article,notice: "#{t('activerecord.models.article')}を編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。"
  end



  private
    def article_params
      params.require(:article).permit(:title,:content)
    end

    def set_article
      @article = current_user.articles.find(params[:id])
    end
  end
