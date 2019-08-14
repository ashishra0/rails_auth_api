class StaticController < ApplicationController
  def home
    render json: {'Name' => 'Ashish' }
  end
end