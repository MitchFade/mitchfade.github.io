require 'oauth2'

class WelcomeController < ApplicationController
  def index
    @controller_message =  10
    @controller_message2 =  20  

    options = {}
    #def method for oauth 
    # these should be changed / omitted from example code
    
    @client = Onehub.new('mitchfade11@gmail.com', 'weenie123')
    # => OAuth2::Response"


    @workspaces = @client.list_workspaces


    #def method for uploading 

    #rescue OAuth2::Error => ex
    #  puts "Exception! #{ex}"


    pathname = File.join(Rails.root, 'public/file.csv')
   

    # local file name ./logo_onehub_ws.png will be stored in folder FOLDER_ID as 'foo1.png'
    upload = Faraday::UploadIO.new(File.new(pathname, 'rb'), 'application/octet-stream', 'foo1.png')

    payload = {
      :file =>  {
        :name => File.basename(pathname),
        :'form-data' => upload
      }
    }
   


    File.open(pathname, 'w') { |file| file.write(@lat_value) }   # overwrites data before its uploaded 

end

end




