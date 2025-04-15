# Write your solution here!
require "rqrcode"

puts "What type of QR code would you like to create?"
puts "1. Open a website"
puts "2. Connect to Wi-Fi"
puts "3. Send a text message"
puts "4. Exit"
puts

print "Enter your choice (1-4): "
option = gets.chomp
puts

if option == "4"
  puts "Okay, exiting. See you next time!"
  exit
end

# Decide what to encode based on the user's input
case option
when "1"
  print "Enter the URL: "
  content = gets.chomp
when "2"
  print "Wi-Fi network name (SSID): "
  ssid = gets.chomp
  print "Password: "
  password = gets.chomp
  content = "WIFI:T:WPA;S:#{ssid};P:#{password};;"
when "3"
  print "Recipient phone number: "
  phone = gets.chomp
  print "Message content: "
  message = gets.chomp
  content = "SMSTO:#{phone}:#{message}"
else
  puts "Invalid option. Please restart and choose 1, 2, 3, or 4."
  exit
end

puts
print "How should we name the PNG file (without extension)? "
filename = gets.chomp

# Generate QR code PNG
qr = RQRCode::QRCode.new(content)
png = qr.as_png(size: 500)

# Save to file
IO.binwrite("#{filename}.png", png.to_s)

puts
puts "Your QR code has been saved as #{filename}.png"
