class Like < ActiveRecord::Base

  belongs_to :traveller
  belongs_to :to_do

  validates :to_do ,uniqueness: { scope: :traveller, message: "Hey you can't like it THAT much!"}


end
