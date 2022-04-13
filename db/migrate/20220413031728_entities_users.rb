class EntitiesUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :entities_users, id: false do |t|
      t.belongs_to :entity
      t.belongs_to :user
    end
  end
end
