class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :name
      t.string :value, :default => ""
      t.string :type
      t.string :display_text

      t.timestamps
    end
  end
end
