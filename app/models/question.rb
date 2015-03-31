class Question < ActiveRecord::Base

  validates :title, :presence => true

  validates :content, :presence => true

  has_many :answers
  belongs_to :user


end
