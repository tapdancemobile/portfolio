class StaticPagesController < ApplicationController
  
def home
  end

  def portfolio
  	@projects = Project.all
  end

  
end
