class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :system_name
      t.string :uuid
      t.string :domain

      t.timestamps
    end
  end
end
