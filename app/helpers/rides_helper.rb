module RidesHelper

  def check_height(ride)
    current_user.height >= ride.attraction.min_height
  end

  def check_tickets(ride)
    current_user.tickets >= ride.attraction.tickets
  end

  # subtracts the attraction tickets from the users tickets
  def sub_tickets(ride)
    current_user.tickets -= ride.attraction.tickets

  end

  def happiness_level(ride)
    current_user.happiness += ride.attraction.happiness_rating
  end

  def nausea_level(ride)
    current_user.nausea += ride.attraction.nausea_rating
  end

  def go_on_ride(ride)
    flash[:danger] = ''
    flash[:danger] = "Sorry. You are not tall enough to ride the #{ride.attraction.name}. " if !check_height(ride)
    flash[:danger] += "You do not have enough tickets to ride the #{ride.attraction.name}." if !check_tickets(ride)
    if check_height(ride) && check_tickets(ride)
      sub_tickets(ride)
      happiness_level(ride)
      nausea_level(ride)
      flash.discard(:danger)
      flash[:success] = "Thanks for riding the #{ride.attraction.name}!"
    end
    current_user.save
  end

end
