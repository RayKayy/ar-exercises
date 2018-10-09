require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  belongs_to :store
  validates! :first_name, presence: true
  validates! :last_name, presence: true
  validates! :hourly_rate, inclusion: { in: 40..200 }
  validates! :store_id, presence: true
end

@store1.employees.create(
  first_name: 'Raymond',
  last_name: 'Kwan',
  hourly_rate: 100
)
@store2.employees.create(
  first_name: 'Amy',
  last_name: 'Kwan',
  hourly_rate: 80
)
@store2.employees.create(
  first_name: 'Wilson',
  last_name: 'Kwan',
  hourly_rate: 90
)

