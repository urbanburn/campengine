class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.string   :name,                     null: false
      t.text     :description,              null: false
      t.text     :size_of_necessary_space
      t.text     :camp_necessities
      t.boolean  :needs_art_grant
      t.integer  :number_of_members
      t.boolean  :seeking_members
      t.text     :noise_level
      t.text     :safety_risks
      t.string   :contact_email,            null: false
      t.string   :contact_name,             null: false
      t.timestamps                          null: false
    end
  end
end
