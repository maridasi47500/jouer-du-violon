class PostsController < ApplicationController
  before_action :set_post, only: %i[ new_with_cards1 new_with_cards addmemo edit update destroy addfile ]
  before_action :set_my_post, only: %i[ show ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end
  def addfile
    @a=@post.myfiles.new
  end
  def addmemo
    @a=@post.memos.new
    10.times do
      @a.stuffs.new
    end
  end
  def new_with_cards1
    @nuances = Nuance.all
  end
  def new_with_cards
    @post = Post.new
    @post.cards.build
      @nuances = @post.nuances
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to getpost_url(title:@post.title.parameterize), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        create_cards_for_post(@post)

        format.html { redirect_to getpost_url(title:@post.title.parameterize), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
      @nuances = @post.nuances
    end
    def set_my_post
      @post = Post.findmypost(params[:title])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :image, :content, :user_id, :cat_id,:memos_attributes=>{},:myfiles_attributes=>{})
    end
  def create_cards_for_post(post)
    measure = params[:measure]
    nuance_ids = params[:nuance_ids]
    post.cards.destroy_all  # Clear existing cards
    nuance_ids.each do |nuance_id|
      Card.create(post_id: post.id, nuance_id: nuance_id, measure: measure)
    end
  end


end
