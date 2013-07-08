class CreateTransactionActivities < ActiveRecord::Migration
  def change
    create_table :transaction_activities do |t|

      t.timestamps
    end
  end
end
