require 'aws-sdk-dynamodb'

class ReadTables
  def self.get_info

    region = 'ap-northeast-1'
    credentials = Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"])

    dynamodb_client = Aws::DynamoDB::Client.new(
      region: region,
      credentials: credentials,
    )

    result = dynamodb_client.scan(table_name: "Refrigerator")

    time = Time.now

    infoList = []
    result.items.each do |item|
      info = {}
      info["Item"] = item["Item"]
      info["Type"] = item["Type"]
      info["timestamp"] = item["timestamp"]
      info["Expiration_date"] = item["Expiration_date"]
      info["Days_left"] = (Time.parse(item["Expiration_date"]) - time).div(24*60*60) + 1
      if info["Days_left"] > 0 then
        info["dead"] = false
      else
        info["dead"] = true  
      end  
      infoList.append(info)
    end
    infoList = infoList.sort{|x, y| x["Days_left"].to_i <=> y["Days_left"].to_i }
    infoList
  rescue StandardError => e
    puts "Error getting items for table '#{table_name}': #{e.message}"
    'Error'
  end

end
