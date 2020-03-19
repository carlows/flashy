class AddPeriodToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :period, :integer
  end
end
