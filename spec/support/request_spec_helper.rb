module RequestSpecHelper
  def json
    JSON.parse(response.body, symbolize_names: true)
  end

  def user1
    json[:data][0][:attributes]
  end
end
