class Api::V1::UsersController < Api::V1::Users::BaseController
  before_action only: %i[show update destroy] do
    @user = set_user
  end

  def index
  end

  def show
    serialize(@user)
  end

  def create
    new_user = User.create!(user_params)
    serialize(new_user, :created)
  end

  def update
    @user.update!(user_params)
    serialize(@user)
  end

  def destroy
    user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :exp_level, :ski_pass, :address, :ski_or_board, :emergency_name, :emergency_number)
  end
end
