class Group < ApplicationRecord
  has_many :messages
  has_many :users, through: :groups_users
  has_many :groups_users
  accepts_nested_attributes_for :groups_users
  validates :name, presence: true

    def show_message
      if last_message = messages.last
         last_message.body
      else
         "まだメッセージはありません"
      end
    end
end
