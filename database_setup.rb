unless ActiveRecord::Base.connection.table_exists?(:albums)
  ActiveRecord::Base.connection.create_table :albums do |t|
    t.text :album_title
  end
end

unless ActiveRecord::Base.connection.table_exists?(:photographers)
  ActiveRecord::Base.connection.create_table :photographers do |t|
    t.text :name
    t.integer :age
  end
end

unless ActiveRecord::Base.connection.table_exists?(:photos)
  ActiveRecord::Base.connection.create_table :photos do |t|
    t.text :title
    t.integer :year
    t.integer :photographer_id
  end
end

unless ActiveRecord::Base.connection.table_exists?(:albums_photos)
  ActiveRecord::Base.connection.create_table :albums_photos do |t|
    t.text :album_id
    t.integer :photo_id
  end
end
