# frozen_string_literal: true

class AddColumnSlugToApproaches < ActiveRecord::Migration[5.2]
  def change
    add_column :approaches, :slug, :string
  end
end
