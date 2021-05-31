class BaseController < ApplicationController
  def home

    @Unique_Locations = CovidCase.distinct.pluck(:Location)
  end
  
  def filter    
    @Unique_Locations = CovidCase.distinct.pluck(:Location)
    params[:filter] = {:location => params[:location], :date_from => params[:date_from], :date_to => params[:date_to]}
    # params[:location] = CovidCase.find(params[:location]).Location
    render 'home'
  end
end
