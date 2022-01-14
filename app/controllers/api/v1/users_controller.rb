class Api::V1::UsersController < ApplicationController
  include Secured
  before_action :authenticate_request!, only: [:update, :destroy]
  before_action :set_jwt_payload, only: [:update, :destroy]
  before_action :set_user, only: [:update, :destroy]

  # GET /api/v1/users
  def index
    @users = User.all

    render json: @users
  end

  # GET /api/v1/users/1
  def show
    @user = User.find_by(user_name: params[:id])

    render json: @user
  end

  # POST /api/v1/users
  def create
    @user = User.new(user_params)
    @user.user_icon.attach(params[:user_icon])
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    @user = User.find_by(user_name: params[:id])
    @user.user_icon.attach(params[:user_icon])

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.where(sub: @sub).find_by(user_name: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:user_name)
    end

    def set_jwt_payload
      @jwt_payload = JWT.decode(request.headers[:Authorization].split(' ')[1], nil, nil)
      @sub = @jwt_payload[0]['sub']
      @nickname = @jwt_payload[0]['nickname']
    end
end
