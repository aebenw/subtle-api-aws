module Api
module V1

class RelationshipsController < ApplicationController
  def create
    byebug
    Relationship.create(relationship_params)
    user = User.find(relationship_params[:followed_id])

    # SEND BACK USER INFO FOR FRIEND TO BE ADDED TO CURRENTUSER ARRAY
    render json: user
  end

  def destroy
    user_one = User.find(relationship_params[:follower_id])
    user_two = User.find(relationship_params[:followed_id])
    act = user_one.active_relationships.find {|x| x.followed_id == user_two.id}
    pas = user_one.passive_relationships.find {|x| x.follower_id == user_two.id}

    if act
      act.destroy
    elsif pas
      pas.destroy
    end
    render json: {message: "all good"}
  end

  private
  def relationship_params
    params.require(:relationship).permit(:follower_id, :followed_id)
  end

end


end
end
