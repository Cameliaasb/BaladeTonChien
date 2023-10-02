class Dog < ApplicationRecord
  belongs_to       :user
  has_many         :tindogs, foreign_key: "sender_id" # , dependent: :destroy
  has_one_attached :photo

  SIZE = ["Grand", "Moyen", "Petit"]
  SEX = ["Mâle", "Femelle"]
  ENERGY = ["Dynamiques", "Peu dynamiques", "Pas dynamiques"]
end
