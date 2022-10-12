require 'aws-sdk-dynamodb'

class DeleteItems

  def self.item_deleted_from_table?(dynamodb_client, table_item)
    dynamodb_client.delete_item(table_item)
    true
  rescue StandardError => e
    puts "Error deleting item: #{e.message}"
    false
  end

  def self.delete_items(a, b)
    region = 'ap-northeast-1'
    credentials = Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"])

    dynamodb_client = Aws::DynamoDB::Client.new(
      region: region,
      credentials: credentials,
    )

    table_item = {
      table_name: "Refrigerator",
      key:  {
        "Type": a,
        "Item": b
      }
    }
    puts table_item

    if self.item_deleted_from_table?(dynamodb_client, table_item)
      puts 'Item deleted.'
    else
      puts 'Item not deleted.'
    end
  end

end