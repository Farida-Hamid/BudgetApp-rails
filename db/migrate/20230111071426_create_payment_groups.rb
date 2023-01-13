class CreatePaymentGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_payments, id: false do |t|
      t.belongs_to :payment
      t.belongs_to :group
      
      t.timestamps
    end
  end
end
