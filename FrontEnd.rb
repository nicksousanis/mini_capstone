require "http"
require "tty-table"
require "tty-prompt"

#DESTROY
# puts "Enter in the id of the product you would like to destroy."
# product_id = gets.chomp.to_i
# response = HTTP.delete("http://localhost:3000/api/products/#{product_id}")
# puts "Product #{product_id} successfully deleted!"
#UPDATE
puts "Enter in the id of the product you would like to update followed by what you would like to change."
product_id = gets.chomp.to_i
puts "Enter in what you would like to change now. 'Name', 'Price', or 'Description'. Then enter in your change."
input = gets.chomp
if input == "Name"
  name = gets.chomp
elsif input == "Price"
  price = gets.chomp.to_i
elsif input == "Description"
  description = gets.chomp
else
  puts "That is not a valid command"
end
response = HTTP.patch("http://localhost:3000/api/products/#{product_id}", :params => { input_name: name, input_price: price, input_description: description })
data = response.parse
pp data

#CREATE
# puts "Enter the new product you would like to add to the list. Make sure to include name, price, image_url, and description."
# name = gets.chomp
# price = gets.chomp.to_i
# image_url = gets.chomp
# description = gets.chomp

# response = HTTP.post("http://localhost:3000/api/products", :params => { name: name, price: price, image_url: image_url, description: description })

# data = response.parse
# pp data

#SHOW
# puts "Please enter 'all' if you would like to see all products or 'individual' if you would like to see a specific one:"
# while true
#   input = gets.chomp
#   if input == "all"
#     response = HTTP.get("http://localhost:3000/api/products")
#     data = response.parse
#     pp data
#     break
#   elsif input == "individual"
#     puts "Please enter the product id:"
#     product_id = gets.chomp
#     response = HTTP.get("http://localhost:3000/api/products/#{product_id}")
#     data = response.parse
#     pp data
#     break
#   else
#     puts "That is not a valid response, please enter 'all' or 'individual'"
#   end
# end

#TABLES
# table = TTY::Table.new ["name", "price", "image_url" "description"], ["test", "test", "test", "test"]
# table.render(:basic)
# table = TTY::Table.new ["header1", "header2"], [["a1", "a2"], ["b1", "b2"]]
# puts table.render(:ascii)

# p table
# data.map do |x|
# end
# p test
# # test = data[0]["name"]
# table = TTY::Table.new ["name", "price", "image_url", "description"], [0, ["test2", "test2", "test2", "test2"]]
# puts table.render(:ascii)
