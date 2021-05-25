class BaseController < ApplicationController
  def home
  end
  
  def filter    
    params[:filter] = {:location => params[:location], :date_from => params[:date_from], :date_to => params[:date_to]}
    render 'home'
  end
end
