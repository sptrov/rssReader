class CreateFeedEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :feed_entries do |t|
      t.string :title
      t.datetime :published
      t.text :content
      t.string :url
      t.string :author
      t.text :summary
      t.string :image
      t.integer :feed_id

      t.timestamps
    end
  end
end
