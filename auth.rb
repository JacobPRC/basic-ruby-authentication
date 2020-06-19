$users = [
    {username: "jacob", password: "12345"},
    {username: "alanna", password: "22345"},
    {username: "nick", password: "32345"},
    {username: "emina", password: "42345"},
]
$logged_in = false

def auth_users(username, password, list_of_users)
    list_of_users.each do |user_record| 
        if user_record[:username] == username && user_record[:password] == password
            return $logged_in = true
        end
    end
    return "Incorrect credentials"
end

def login_attempt
    $attempts = 0
    while $attempts < 3 
       
        print 'Password: '
        password = gets.chomp
        authention = auth_users($username, password, $users)
        puts "Invalid credientials" if $logged_in == false
        break if $logged_in == true
        puts "Press n to quit or any other key to continue" if $attempts < 3
        input = gets.chomp
        break if input ==  'n'
        $attempts += 1
    end
end

puts "Welcome to the authenticator!"
25.times{print '-'}
puts
puts "This program will check if the password a user enters matches one for the selected user."
puts "Don't fuck up"
print 'Enter your username: '
$username = gets.chomp

login_attempt

puts "Congradulations #{$username}, you have successfully logged in" if $logged_in == true
puts "You fucked up and exceeded the number of attempts. Goodbye" if $attempts == 3 && $logged_in == false