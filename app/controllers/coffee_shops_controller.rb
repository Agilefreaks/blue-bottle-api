class CoffeeShopsController < ApplicationController  
  def index
    respond_to do |format|
      format.csv do
        send_file("data/coffee_shops.csv")
      end
    end
  end
end
