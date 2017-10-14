class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.title :string

      t.timestamps
    end
  end
end
