class Api::V1::PostsController < ApplicationController
  include Secured
  before_action :authenticate_request!, only: [:create, :update, :destroy]
  before_action :set_jwt_payload, only: [:create, :update, :destroy]
  before_action :set_post, only: [:update, :destroy]

  # GET /api/v1/posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /api/v1/posts/1
  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  # POST /api/v1/posts
  def create
    @post = Post.new(post_params)
    @post.sub = @sub
    @post.user_name = @nickname

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.where(sub: @sub).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.permit(:title, :user_id, :content)
    end

    def set_jwt_payload
      @jwt_payload = JWT.decode(request.headers[:Authorization].split(' ')[1], nil, nil)
      @sub = @jwt_payload[0]['sub']
      @nickname = @jwt_payload[0]['nickname']
    end
end
