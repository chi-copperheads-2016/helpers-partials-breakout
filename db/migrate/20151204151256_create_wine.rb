class CreateWine < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :description
      t.references :user
    end
  end
end
