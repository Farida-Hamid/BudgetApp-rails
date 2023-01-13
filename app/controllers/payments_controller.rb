class PaymentsController < ApplicationController
  def index
    @payments = current_user.groups.find(params[:group_id]).payments.order("created_at DESC")
    @sum = @payments.sum(:amount)
  end

  def new
    @groups = current_user.groups.all
    @payment = Payment.new
    respond_to do |format|
      format.html { render :new, locals: { payment: @payment } }
    end
  end

  def create
    @payment = current_user.payments.new(payment_params)

    params[:groups].each do |index|
      @payment.groups << Group.find(index)
    end

    respond_to do |format|
      format.html do
        if @payment.save
          flash[:success] = "Transaction saved successfully"
          redirect_to user_group_payments_path
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
