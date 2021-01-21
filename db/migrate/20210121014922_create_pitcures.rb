class CreatePitcures < ActiveRecord::Migration[6.0]
  def change
    create_table :pitcures do |t|

      t.timestamps
    end
  end
end
