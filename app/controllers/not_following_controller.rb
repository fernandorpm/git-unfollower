class NotFollowingController < ApplicationController

  before_action :set_users

  include Functions::GetGithub
  helper_method Functions::GetGithub.instance_methods

  def not_following
    @userlist
  end

  protected

  def set_users
    @user = params[:user]
    @userlist = Functions::GetGithub.get_not_following_list(@user)
  end

end