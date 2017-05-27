class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |table| # name of `table` can be anything -- RUBY "BLOCK"

      table.text :title # add columns in table
      table.text :description

      table.timestamps null: false
    end
  end
end
