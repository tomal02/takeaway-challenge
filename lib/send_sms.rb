require 'twilio-ruby'

class Message
  time = Time.new

  account_sid = 'AC7cfaa98f297b03019b9a2d164a8f9296'
  auth_token = '221a75ef4120ab083940cd189495795d'
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+447883306480' # Your Twilio number
  to = '+447949796911' # Your mobile phone number

  client.messages.create(
  from: from,
  to: to,
  body: "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}"
  )
end