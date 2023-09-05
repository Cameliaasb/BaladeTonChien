class Dog < ApplicationRecord
  belongs_to       :user
  has_many         :tindogs # , dependent: :destroy
  has_one_attached :photo
end
