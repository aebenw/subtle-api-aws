class BlockSerializer < ActiveModel::Serializer
  attributes :id, :content, :author, :channels, :image, :file
  has_many :comments


  def file
  #     # Rails.application.routes.url_helpers.
      # Rails.application.routes.url_helpers.url_for(object.file)
      begin
        short_url = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
        url = "https://b210ed40.ngrok.io" + short_url
        return url
      rescue
      return ''
      end
  end

  def author
    ShallowUserSerializer.new(object.user)
  end

  def channels
    object.channels.map{|x| ShallowChannelSerializer.new(x)}
  end

  def comments
    object.comments.map{|x| ShallowCommentSerializer.new(x)}
  end



end
