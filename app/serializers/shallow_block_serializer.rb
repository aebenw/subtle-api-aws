class ShallowBlockSerializer < ActiveModel::Serializer
  attributes :id, :content, :author, :comments, :image, :file
  # belongs_to :user, serializer: ShallowUserSerializer

  def author
    ShallowUserSerializer.new(object.user)
  end

  def comments
    object.comments.map{|x| ShallowCommentSerializer.new(x) }
  end

  def file

   # Rails.application.routes.url_helpers.
      # Rails.application.routes.url_helpers.url_for(object.file)
      begin
        short_url = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
        url = "https://b210ed40.ngrok.io" + short_url
        return url
      rescue
      return ''
      end
  end

end
