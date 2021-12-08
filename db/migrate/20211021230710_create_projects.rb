class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :descriptionMore
      t.text :infoLink

      t.timestamps
    end
  end
end
