class Api::V1::ChactersController < ApplicationController
    require 'digest'
    require 'rest-client'

    $url = 'https://gateway.marvel.com/'
    # @md5 = Digest::MD5.new
    $md5 = Digest::MD5.hexdigest("1" + Rails.application.credentials.marvel[:private] + Rails.application.credentials.marvel[:public] ) 
    def get_characters
        # binding.pry
        @character_url = "v1/public/characters?ts=1&apikey=#{Rails.application.credentials.marvel[:public]}&hash=#{$md5}"
        response = RestClient.get($url << @character_url, { :content_type => :json, "Api-Key" => Rails.application.credentials.marvel[:public] })
        render json: response        
    end
end
