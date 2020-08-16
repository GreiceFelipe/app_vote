class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :campaign, foreign_key: true
      t.references :option, foreign_key: true
      t.string :voter

      t.timestamps
    end
  end
end
