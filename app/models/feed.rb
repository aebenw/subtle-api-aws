class Feed < ApplicationRecord

  def self.initialize(user)
    current_user = User.find(user)
    friends = current_user.friends
    content = Hash.new

    10.times do |x|
      friend = friends.sample
      num = rand(4)
      num2 = rand(2)

        if num == 0
          content["channels"] = friend.channels[0..num2]
        elsif num == 1
          content["blocks"] = friend.blocks[0..num2]
        elsif num == 2
          content["friends"] = friend.friends[0..num2]
        elsif num == 3
           content["followed_channels"] = friend.followed_channels[0..num2]
        elsif num == 4
           content["comment"] = friend.comments[0..num2]
        end
    end
    return content
  end


end
