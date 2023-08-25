class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :job_title
      t.text :job_description
      t.string :location
      t.decimal :salary

      t.timestamps
    end
  end
end
