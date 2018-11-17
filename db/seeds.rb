# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
eben = User.create(name: "Eben", email: "e@e.com", password: "test")
chris = User.create(name: "Chris", email: "c@c.com", password: "test")
joanna = User.create(name: "Joanna", email: "j@j.com", password: "test")
danny = User.create(name: "Danny", email: "d@d.com", password: "test")
danny = User.create(name: "Joy", email: "joy@joy.com", password: "test")


Relationship.create(follower_id: eben.id,  followed_id: chris.id)
Relationship.create(follower_id: eben.id,  followed_id: joanna.id)
Relationship.create(follower_id: joanna.id,  followed_id: danny.id)
Relationship.create(follower_id: chris.id,  followed_id: danny.id)

100.times { |x|
  num = [0,1].sample
  numbers = [1..4].sample
  words = Faker::Hipster.words(numbers)
  words = words.join(" ")
  Channel.create(name: words, private: num)
}

def user_channel
  i = 1
  while i < 100

    channel = Channel.find(i)
    if i < 40
      user_arr = User.all[0..4]
      user = user_arr.sample
      UserChannel.create(user_id: user.id, channel_id: channel.id)
    else
      user = User.all.sample
      UserChannel.create(user_id: user.id, channel_id: channel.id)
    end

  i +=1
  end
end

30.times { |x|
  User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: "test")
}

50.times  { |x|
  # NEED TO ADD IMG/CONTENT
  user = User.all.sample
  images = ["http://www.designcurial.com/Uploads/NewsArticle/6061012/main.jpg", "https://proxy.duckduckgo.com/iu/?u=http%3A%2F%2Fimage.sportsmansguide.com%2Fadimgs%2Fl%2F1%2F165624_ts.jpg&f=1", "http://1.bp.blogspot.com/-XtaaG1IhAp0/UATsGm1WGPI/AAAAAAAAAxo/10AaR2rXsro/s1600/IMG_3120.jpg", "http://images.adsttc.com/media/images/5038/1dd0/28ba/0d59/9b00/0f73/large_jpg/stringio.jpg?1414087929", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic01.nyt.com%2Fimages%2F2013%2F11%2F04%2Farts%2Fjp-barragan-2%2Fjp-barragan-2-master1050.jpg&f=1", "https://duckduckgo.com/?q=barragan&atb=v141-1a_&iar=images&iax=images&ia=images&iai=https%3A%2F%2Fstatic01.nyt.com%2Fimages%2F2013%2F11%2F04%2Farts%2Fjp-barragan-2%2Fjp-barragan-2-master1050.jpg", "http://i1022.photobucket.com/albums/af341/1ina100/OscarTuazon_2.jpg"]
  img = images.sample



  Block.create(user_id: user.id, content: Faker::Hipster.paragraphs(1).join, image: img)
}


def channel_blocks

  i = 1
  while i < 51
  block = Block.find(i)
    if i < 32
      ChannelBlock.create(block_id: block.id, channel_id: i)
      i += 1
    else
      channel = Channel.all.sample
      ChannelBlock.create(block_id: block.id, channel_id: channel.id)
      i += 1
    end
  end
end

100.times { |x|
  user = User.all.sample
  block = Block.all.sample
  Comment.create(user_id: user.id, block_id: block.id, content: Faker::Hipster.sentence(3))
}

100.times{ |x|
  user = User.all.sample
  block = Block.all.sample
  Like.create(user_id: user.id, block_id: block.id)
 }


channel_blocks
user_channel
