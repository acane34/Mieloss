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

    infoList = []
    result.items.each do |item|
      info = {}
      info["Item"] = item["Item"]
      info["Type"] = item["Type"]
      info["timestamp"] = item["timestamp"]
      info["Expiration_date"] = item["Expiration_date"]
      infoList.append(info)
    end
    infoList
  rescue StandardError => e
    puts "Error getting items for table '#{table_name}': #{e.message}"
    'Error'
  end

end
