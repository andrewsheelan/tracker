class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true
      t.string :message

      t.timestamps
    end
  end
end
