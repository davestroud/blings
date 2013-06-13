class Stock < ActiveRecord::Base
  attr_accessible :name, :ticker

  has_many :users, :through => :portfolios
  has_and_belongs_to_many :portfolios

  validates :ticker, presence: true, length: {in: 1..10}
end
