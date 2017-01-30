class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if enough_tickets && right_height
      starting_point
    elsif enough_tickets && !right_height
      "Sorry. #{height}"
    elsif !enough_tickets && right_height
      "Sorry. #{tickets}"
    else
      "Sorry. #{tickets} #{height}"

    end
  end


  def enough_tickets
    if attraction.tickets <= self.user.tickets
      return tickets

    end

  end

  def right_height
    if  attraction.min_height <= self.user.height
      return height

    end

  end


  def tickets
    "You do not have enough tickets to ride the #{attraction.name}."
    
  end
  def height
    "You are not tall enough to ride the #{attraction.name}."
  end

  def starting_point
    updated_tickets = self.user.tickets.to_i - attraction.tickets.to_i
    updated_nausea = self.user.nausea.to_i + attraction.nausea_rating.to_i
    updated_happiness = self.user.happiness.to_i + attraction.happiness_rating.to_i

    self.user.update(
      tickets:updated_tickets,
      nausea:updated_nausea,
      happiness: updated_happiness
    )

    "Thanks for riding the #{attraction.name}!"
  end
end
