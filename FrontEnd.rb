require "http"
require "tty-table"

response = HTTP.get("http://localhost:3000/api/all_products_url")
data = response.parse

# table = TTY::Table.new ["name", "price", "image_url" "description"], ["test", "test", "test", "test"]
# table.render(:basic)
# table = TTY::Table.new ["header1", "header2"], [["a1", "a2"], ["b1", "b2"]]
# puts table.render(:ascii)
pp data
# p table
data.map do |x|
end
p test
# test = data[0]["name"]
table = TTY::Table.new ["name", "price", "image_url", "description"], [0, ["test2", "test2", "test2", "test2"]]
puts table.render(:ascii)
