class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :friends, :not_friends, :description, :file
  has_many :channels, through: :user_channel, serializer: ShallowChannelSerializer



  def file
      begin
        # FOR RUNNING W JUST ACTIVE RECORD
        # short_url = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
        # url = "https://49a21af3.ngrok.io" + short_url


        # FOR RUNNING WITH s3
        url = object.profile.service_url
        return url
      rescue
      return ''
      end
  end

  def relationships
    Relationship.friends(object)
  end

  def friends
    friends = object.followers + object.following
    filter = friends.select{|x| x.id !=  object.id }
    filter.map{|x| ShallowUserSerializer.new(x)}
  end

  def not_friends
    nf = User.all - (object.followers + object.following)
    filter = nf.select{|x| x.id !=  object.id }

    filter.map{|x| ShallowUserSerializer.new(x)}
  end

end
