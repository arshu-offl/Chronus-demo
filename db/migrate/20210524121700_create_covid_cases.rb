class CreateCovidCases < ActiveRecord::Migration[6.1]
  def change
    create_table :covid_cases do |t|
      t.string :Location
      t.date :Date
      t.string :No_of_cases
      t.string :No_of_deaths

      t.timestamps
    end
  end
end
