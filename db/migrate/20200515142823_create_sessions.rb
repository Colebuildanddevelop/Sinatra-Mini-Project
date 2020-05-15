class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :fighter_id
      t.integer :gym_id
      t.string :date
    end
  end
end
