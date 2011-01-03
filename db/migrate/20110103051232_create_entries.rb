class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|

      t.string  :name

      t.string  :source_name
      t.string  :source_url

      t.string  :submitter
      
      t.string  :image_url
      
      t.boolean :approved, :default => false
      t.string  :approved_by
      
      t.string    :image_file_name
      t.string    :image_content_type
      t.integer   :image_file_size
      t.datetime  :image_uploaded_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
