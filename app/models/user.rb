class User < ActiveRecord::Base
  # attr_accessor :admin
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  # after_initialize :default_admin
  #validates :name, :password, :password_confirmation, :happiness, :nausea, :height, :tickets, presence: true
  #validates :admin, presence: true

  def mood
     self.nausea > self.happiness ? "sad" : "happy"
  end

  #private

  # def default_admin
  #   self.admin ||= false
  # end
end
