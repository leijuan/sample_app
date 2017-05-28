class AddRemrmberDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :remrember_digest, :string
  end
end
