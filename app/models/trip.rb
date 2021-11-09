class Trip < ApplicationRecord
  has_many :resort_options, dependent: :destroy
  has_many :riders, dependent: :destroy
end
