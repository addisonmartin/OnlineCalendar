class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.belongs_to :calendar, null: false, foreign_key: true
      t.text :name
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
