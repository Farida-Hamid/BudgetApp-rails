class PaymentsController < ApplicationController
  def index
    @payments = current_user.payments.order("created_at DESC")
    # @group = Group.find(params[:group_id])
    @sum = @payments.sum(:amount)
  end

  def new
    @groups = current_user.groups.map { |group| [group.name, group.id] }
    # @group = Group.find(params[:group_id])
    @payment = Payment.new
    respond_to do |format|
      format.html { render :new, locals: { payment: @payment } }
    end
  end

  def create
    # payment = Payment.new(params.require(:payment).permit(:name, :amount, :group))
    @payment = current_user.payments.new(payment_params)
    # payment = Payment.create(payment_params)
    # payment.author_id = current_user.id

    # params[:groups].each do |k, _v|
    #   @group = Group.find(k)
    #   @payment.groups << Group.find(k)
    # end
    @payment.groups.push(Group.find(id: :group_id))#Group.find(id: current_user.groups[params[:id]])

    respond_to do |format|
      format.html do
        if @payment.save
          flash[:success] = "Transaction saved successfully"
          redirect_to group_payment_path
        else
          flash.now[:error] = "Error: Group could not be saved. Try again."
          render :new, locals: { payment: @payment }
        end
      end
    end
  end

  private
  def payment_params
    params.require(:payment).permit(:name, :amount).merge(user: current_user)
  end
end
