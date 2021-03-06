class User < ActiveRecord::Base
  authenticates_with_sorcery!


  has_many :owned_projects, class_name: "Project"
  has_many :pledges
  has_many :projects, through: :pledges
  has_many :rewards, through: :pledges

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :name, :email , presence: true
end
