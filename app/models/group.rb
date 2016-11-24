class Group < ApplicationRecord
  validates :name, presence: { message: "を入力してください" }
end
