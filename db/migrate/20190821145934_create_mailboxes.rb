class CreateMailboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :mailboxes do |t|
      t.string :email
      t.string :lastname
      t.string :firstname
      t.string :businessphone

      t.timestamps
    end
  end
end
