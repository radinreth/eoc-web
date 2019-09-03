class CreateSops < ActiveRecord::Migration[5.1]
  def change
    create_table :sops do |t|
      t.string   :name
      t.string   :file
      t.text     :tags
      t.integer  :category_id

      t.timestamps
    end
  end
end
