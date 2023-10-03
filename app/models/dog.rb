class Dog < ApplicationRecord
  belongs_to       :user
  has_many         :tindogs, foreign_key: "sender_id" # , dependent: :destroy
  has_one_attached :photo

  validates :name, :breed, :age, :sexe, :size, :energy, :photo, presence: true

  SIZE = ["Grand", "Moyen", "Petit"]
  SEX = ["Mâle", "Femelle"]
  ENERGY = [1, 2, 3]
end
