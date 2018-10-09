require_relative '../setup'

puts "Exercise 1"
puts "----------"

# Your code goes below here ...


class Store < ActiveRecord::Base
  has_many :employees
  validates! :name, length: { minimum: 3 }
  validates! :annual_revenue, numericality: { greater_than_or_equal_to: 0 }
  validate :men_or_women

  def men_or_women
    if !(mens_apparel || womens_apparel)
      errors.add('either mens_apparel or womens_apparel must be true')
    end
  end
end

Store.create(
  name: 'Burnaby',
  annual_revenue: 300000,
  mens_apparel: true,
  womens_apparel: true
)
Store.create(
  name: 'Richmond',
  annual_revenue: 1260000,
  mens_apparel: false,
  womens_apparel: true
)
Store.create(
  name: 'Gastown',
  annual_revenue: 190000,
  mens_apparel: true,
  womens_apparel: false
)

puts Store.count
