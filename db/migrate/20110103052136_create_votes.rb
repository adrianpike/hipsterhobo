class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|

      t.integer  :entry_id
      
      # Higher values are more hipster-y
      t.integer :score
      
      t.string  :voter_ip

      t.timestamps
      
    end
    
    add_index :votes, :entry_id
  end

  def self.down
    drop_table :votes
  end
end
