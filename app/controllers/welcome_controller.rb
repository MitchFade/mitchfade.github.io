require 'oauth2'

class WelcomeController < ApplicationController
  API_HOST = 'ws.onehubmaster.com'

  def index
    @controller_message =  10
    @controller_message2 =  20  

    options = {}
    #def method for oauth 
    # these should be changed / omitted from example code
    
    @client = Onehub.new('mitchfade11@gmail.com', 'weenie123')
    # => OAuth2::Response"
    @workspaces = @client.list_workspaces


    
$i = 0
$num = 5

while $i < $num  do
   @looped_message = "Inside the loop i = #$i" 
   $i +=1
end


    

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
   


    File.open(pathname, 'w') { |file| file.write("stuff") }   # overwrites data before its uploaded 

    #GET https://ws-api.onehub.com/workspaces/[4547]

    #GET https://ws-api.onehub.com/workspaces/[4547]/files/[id]

    #reads locally hosted file 
     #f = File.open("file.csv", "r")
    #f.each_line do |line|
    #  puts line
    #end
    #f.close

end



   # @message2 = "<h1>stuff</h1>"

    #end
end