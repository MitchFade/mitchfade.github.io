class Onehub
  API_KEY    = 'lwf2842dgmb3lutuqxhfrejoci9hfj2'.freeze
  API_SECRET = 's0zd2jdo8x1qik7s8r7r7iyqlfvv2uz'.freeze
  API_HOST   = 'https://ws-api.onehubmaster.com'.freeze

  def initialize(username, password)
    @client = OAuth2::Client.new(API_KEY, API_SECRET, site: API_HOST) do |builder|
      builder.request :multipart
      builder.request :url_encoded
      builder.adapter :net_http  
    end

    @token  = @client.password.get_token(username, password)
  end

  def upload(file, location = '/workspaces/4547/folders/888097/files')
    upload_io = Faraday::UploadIO.new(file.tempfile.path, file.content_type)

    @token.post(location, body: { file: upload_io })
  end

  def list_workspaces
    JSON.parse(@token.get('/workspaces.json').body)
  end

  def list_files(workspace_id) 
    JSON.parse(@token.get("/workspaces/#{workspace_id}/files.json").body)
  end

  def list_contents(workspace_id, id)
    JSON.parse(@token.get("/workspaces/#{workspace_id}/files/#{id}").body)
  end 

  def download_file(workspace_id, id)
    @token.get("/workspaces/#{workspace_id}/files/#{id}/download").body
  end 

end

# client = Onehub.new('mitchfade11@gmail.com, 'password')
# client.upload(file, '/workspace/2/folders/1')
