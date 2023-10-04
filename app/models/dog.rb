class Dog < ApplicationRecord
  belongs_to       :user
  has_many         :tindogs, foreign_key: "sender_id" # , dependent: :destroy
  has_one_attached :photo

  validates :name, :breed, :age, :sexe, :size, :energy, :photo, presence: true

  SIZE = ["Grand", "Moyen", "Petit"]
  validates_inclusion_of :size, in: Dog::SIZE

  SEX = ["Mâle", "Femelle"]
  validates_inclusion_of :sexe, in: Dog::SEX

  ENERGY = [1, 2, 3]
  validates_inclusion_of :energy, in: Dog::ENERGY

end
