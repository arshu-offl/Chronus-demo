class AddRecoveredColumnToCovidcases < ActiveRecord::Migration[6.1]
  def change
    add_column :covid_cases, :No_of_recovered, :string
  end
end
