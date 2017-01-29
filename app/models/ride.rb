class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.tickets < attraction.tickets && self.user.height < attraction.min_height
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."

    elsif self.user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    elsif self.user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      self.user.tickets -= attraction.tickets

      self.user.nausea += attraction.nausea_rating
      self.user.happiness += attraction.happiness_rating
      self.user.save
    end

  end
end
