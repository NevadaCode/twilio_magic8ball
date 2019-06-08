#Accept a magic 8 ball question 
puts "What would you like to ask the Magic 8 Ball?"
question = gets.chomp

#Magic 8 Ball list of possible answers
possible_answers = ["It is certain", 
    "It is decidedly so", 
    "Without a doubt",  
    "Most likely", 
    "Outlook good", 
    "Yes", 
    "Signs point to yes",
    "Ask again later", 
    "Better not tell you now", 
    "Cannot predict now", 
    "Concentrate and ask again", 
    "Don't count on it", 
    "My reply is no",  
    "My sources say no",  
    "Outlook not so good", 
    "Very doubtful"
]

#Get a random answer from the list of possible_answers
magic8ball_answer = possible_answers[rand(0..15)]

######twilio-ruby REST API######

#Require gems
require 'rubygems'
require 'twilio-ruby'

#Connect to the Twilio API using the account SID and auth token
account_sid = "AC7d12701e9b51281d60c15c1969bc5d03"
auth_token = "c312e5f3ebe6fe31ba278a6becc75eed"

@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.api.account.messages.create(
    :from => "+441329800115",
    :to => "+44 7710 683908",
    :body => "You asked: #{question} The Magic 8 Ball shakes and says: #{magic8ball_answer}"
)

puts message.to