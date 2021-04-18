class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.text :name, null: false
      t.text :slug, null: false

      t.timestamps
    end

    add_index :calendars, :slug, unique: true
  end
end
