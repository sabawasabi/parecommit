class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.references :user,        foreign_key:true
      t.string     :target,      null: false
      t.string     :explanation, null: false
      t.date       :limit,       null: false
      t.string     :status,      null: false
      t.timestamps
    end
  end
end
