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
      begin
        # FOR RUNNING W JUST ACTIVE RECORD
        # short_url = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
        # url = "https://49a21af3.ngrok.io" + short_url


        # FOR RUNNING WITH s3
        url = object.file.service_url
        return url
      rescue
      return ''
      end
  end

end
