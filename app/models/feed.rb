class Feed < ApplicationRecord

  def self.initialize(user)
    current_user = User.find(user)
    friends = current_user.friends
    json = Hash.new
    arr = []


    10.times do |z|
      friend = friends.sample
      num = rand(4)
      num2 = rand(4)

        if num == 0
          user = ShallowUserSerializer.new(friend).attributes
          channels = friend.channels.sample(num2).map{ |x| ShallowChannelSerializer.new(x)}
          item = {
            type: "channels",
            user: user,
            content: channels
          }
          arr << item
        elsif num == 1
          user = ShallowUserSerializer.new(friend).attributes
          blocks = friend.blocks.sample(num2).map{ |x| ShallowBlockSerializer.new(x)}
          item = {
            type: "blocks",
            user: user,
            content: blocks
          }
          arr << item


        elsif num == 2
          user = ShallowUserSerializer.new(friend).attributes
          feed_friends = friend.friends.sample(num2).map{ |x| ShallowUserSerializer.new(x)}
          item = {
            type: "friends",
            user: user,
            content: feed_friends
          }
          arr << item


        elsif num == 3
          user = ShallowUserSerializer.new(friend).attributes
          channels = friend.followed_channels.sample(num2).map{ |x| ShallowChannelSerializer.new(x.channel)}

          item = {
            type: "followed_channels",
            user: user,
            content: channels
          }
          arr << item

        end
    end
    json[:feed] = arr
    return json
  end


end
