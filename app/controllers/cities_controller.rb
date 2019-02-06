class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @gossips = []
    @city.users.each do |user|
      @gossips << user.gossips
    end
    @gossips.flatten!
  end
end
