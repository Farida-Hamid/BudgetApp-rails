class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    respond_to do |format|
      format.html { render :new, locals: { group: @group } }
    end
  end

  def create
    group = Group.new(params.require(:group).permit(:name, :icon))
    group.author_id = current_user.id
    respond_to do |format|
      format.html do
        if group.save
          redirect_to user_groups_path
        else
          render :new, locals: { group: @group }
        end
      end
    end
  end
end
