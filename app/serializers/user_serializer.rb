class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :exp_level, :ski_pass, :address, :ski_or_board, :emergency_name, :emergency_number
end
