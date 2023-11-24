# frozen_string_literal: true

class AddColumnSlugToSpecialty < ActiveRecord::Migration[5.2]
  def change
    add_column :specialties, :slug, :string
  end
end
