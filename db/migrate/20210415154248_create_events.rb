class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.belongs_to :calendar, null: false, foreign_key: true
      t.text :name, null: false
      t.text :color, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false

      t.boolean :completable, default: false
      t.datetime :completed_at

      t.string :type # Required for STI to work on this model.

      t.timestamps
    end
  end
end
