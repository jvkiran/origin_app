class CreateTrackers < ActiveRecord::Migration[7.1]
  def change
    create_table :trackers do |t|
      t.string :name
      t.string :mobile
      t.text :message
      t.string :page_title
      t.string :host_url
      t.string :browser
      t.string :device

      t.timestamps
    end
  end
end
