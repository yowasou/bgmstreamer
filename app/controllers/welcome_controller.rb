require_relative 'langtest'

class WelcomeController < ApplicationController
  def index
  end
  def update
    id = params[:id]

      send_data(GetMP3File(id,1).body,
              :type => 'audio/mpeg', 
              :filename => id + "download.mp3")
  end
end
