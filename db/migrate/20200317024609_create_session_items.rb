class CreateSessionItems < ActiveRecord::Migration[6.0]
  def change
    create_table :session_items do |t|
      t.references :session, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.string :outcome

      t.timestamps
    end
  end
end
