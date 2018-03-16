class PostsController < ApplicationController
  before_action :load_deleted, only: :restore

  load_and_authorize_resource

  before_action :ensure_top_level, only: :show

  # GET /posts
  # GET /posts.json
  def index
    @posts = @posts.top_level
               .includes(:creator)
               .paginate(page: params.fetch(:page, 1), per_page: 25)

    @posts = @posts.with_deleted if can? :see_deleted, @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    # Lookup the thread separate from the post so that we always have access to
    # both
    @thread = Post.thread_for(params[:id])
                .includes(:creator)
                .paginate(page: params.fetch(:page, 1), per_page: 25)

    @thread = @thread.with_deleted if can? :see_deleted, @thread
  end

  # GET /posts/new
  def new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    respond_to do |format|
      if @post.save
        format.html do
          redirect_path = if @post.top_level?
                            @post
                          else
                            post_path(@post.parent_id, page: (Post.where(parent_id: @post.parent_id).count / 25.0).ceil)
                          end

          redirect_to redirect_path, notice: 'Post was successfully created.'
        end
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params.except(:parent_id))
        # Figuring out the appropriate page is probably too difficult to deal
        # with.  Ideally, this will be handled with JavaScript and won't matter.
        format.html { redirect_to post_path(@post.parent_id || @post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @post.top_level? ? posts_path : post_path(@post.parent_id), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PUT /posts/1/restore
  def restore
    @post.restore(recursive: true)
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Post was successfully restored.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :parent_id)
  end

  def ensure_top_level
    redirect_to post_path(@post.parent_id) unless @post.top_level?
  end

  def load_deleted
    @post = Post.with_deleted.find(params[:id])
  end
end
