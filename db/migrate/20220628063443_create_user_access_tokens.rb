class CreateUserAccessTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :user_access_tokens do |t|
      t.string :access_token
      t.boolean :status, default: true
      t.references :author

      t.timestamps
    end
  end
end
