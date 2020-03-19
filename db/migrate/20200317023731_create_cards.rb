class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :question, null: false
      t.string :answer, null: false
      t.datetime :display_at
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
