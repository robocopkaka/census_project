class PeopleController < ApplicationController
  before_action :find_person, only: %i[update]
  def index
    people = Person.all.to_a
    render json: people
  end

  def create
    person = Person.create!(people_params)
    render json: person
  end

  def update
    @person.update(people_params)
    render json: @person
  end

  def filter_by_city
    people = Person.filter_by_city(params[:city]).to_a
    render json: { count: people.count, people: people }
  end

  def group_by_age_with_degree
    people = Person.group_by_age_with_degree(params[:degree])
    render json: { count: people.count, people: people }
  end

  private

  def people_params
    params[:degrees] = params[:degrees].kind_of?(Array) ? params[:degrees] : JSON.parse(params[:degrees])
    params.permit(
      :name,
      :age,
      :gender,
      :height,
      :city,
      :country,
      :degrees => [],
    )
  end

  def find_person
    @person = Person.find(params[:id])
  end
end
