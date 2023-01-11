class CreatePaymentGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_groups id: false do |t|
      # t.references :payment, null: false, foreign_key: true
      # t.references :group, null: false, foreign_key: true
      t.belongs_to :payment
      t.belongs_to :group
      
      t.timestamps
    end
  end
end
