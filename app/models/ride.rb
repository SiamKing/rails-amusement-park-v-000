class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    say = self.sorry
    if self.not_enough_tickets
      say += " " + self.not_enough_tickets
    end
    if self.not_tall_enough
      say +=  " " + self.not_tall_enough
    end
    sub_tickets
    nausea
    happiness
    say
  end

  def not_enough_tickets
    "You do not have enough tickets the #{attraction.name}." if user.tickets < attraction.tickets
  end

  def not_tall_enough
    "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
  end

  def sorry
    "Sorry." if self.not_enough_tickets || self.not_tall_enough
  end

  def sub_tickets
    if user.tickets >= attraction.tickets
      user.tickets -= attraction.tickets
      user.save
    end
  end

  def nausea
    if user.nausea >= attraction.nausea_rating
      user.nausea += attraction.nausea_rating
      user.save
    end
  end

  def happiness
    user.happiness += attraction.happiness_rating
    user.save
  end

end
