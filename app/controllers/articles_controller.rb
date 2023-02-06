class ArticlesController < ApplicationController
  ActiveRecord::Base.connection.execute("SELECT setval('articles_id_seq', coalesce((SELECT MAX(id)+1 FROM articles), 1), false)")
  before_action :set_article, only:[:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end


  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    @article.update!(article_params)

    render :show
  end

  def destroy
    @article.destroy!
    redirect_to articles_url, notice: "article was successfully destroyed."

    # render :show
  end



  private
    def article_params
      params.require(:article).permit(:title,:content)
    end

    def set_article
      @article = Article.find(params[:id])
    end

end
