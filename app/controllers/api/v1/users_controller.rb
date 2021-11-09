class Api::V1::UsersController < Api::V1::Users::BaseController
  before_action only: %i[show update destroy] do
    @user = set_user
  end

  def index
    users = User.all
    serialize(users)
  end

  def show
    options = { include: [:trips, :friendships] }
    serialize(@user, options: options)
  end

  def create
    last_user = User.last
    new_user = User.find_or_create_by!(email: user_params[:email])
    if new_user == last_user
      serialize(new_user)
    else
      new_user.update!(user_params)
      serialize(new_user, status: :created)
    end
  end

  def update
    @user.update!(user_params)
    serialize(@user)
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :exp_level, :ski_pass, :address, :ski_or_board, :emergency_name, :emergency_number)
  end
end
