class Trip < ApplicationRecord
  has_many :resort_options, dependent: :destroy
end
