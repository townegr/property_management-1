class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.create(owner_params)
    if @owner.save
      redirect_to new_owner_path, notice: "Owner is successfully saved"
    else
      render 'new'
    end
  end

  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company_name)
  end

end
