class CreateSocBooks < ActiveRecord::Migration
  def change
    create_table :soc_books do |t|
      t.string :url
      t.references :user, index: true

      t.timestamps
    end
  end
end
