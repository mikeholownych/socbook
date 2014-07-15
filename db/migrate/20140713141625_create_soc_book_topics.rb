class CreateSocBookTopics < ActiveRecord::Migration
  def change
    create_table :soc_book_topics do |t|
      t.references :soc_book, index: true
      t.references :topic, index: true

      t.timestamps
    end
  end
end
