class CreateNewsTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :news_topics do |t|
      t.references :news, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
