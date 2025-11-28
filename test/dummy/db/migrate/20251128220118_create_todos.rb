class CreateTodos < ActiveRecord::Migration[7.2]
  def change
    create_table :todos do |t|
      t.string :name
      t.boolean :done

      t.timestamps
    end
  end
end
