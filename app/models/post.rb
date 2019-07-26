class Post < ActiveRecord::Base
  validates_presence_of :date, :rationale
  belongs_to :user
  has_many :comments
end
