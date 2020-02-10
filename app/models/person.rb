class Person
  include Mongoid::Document

  before_create :downcase_degree

  field :name, type: String
  field :age, type: Integer
  field :gender, type: String
  field :degrees, type: Array
  field :height, type: Integer
  field :city, type: String
  field :country, type: String

  def downcase_degree
    self.degrees = degrees.map(&:downcase)
  end

  class << self
    def filter_by_city(city)
      where(city: /#{city}/)
    end

    def group_by_age_with_degree(degree)
      where(:degrees => /#{degree}/).where(:age.in => (20..40).to_a).to_a
    end
  end
end