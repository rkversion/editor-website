class AddCounterCaches < ActiveRecord::Migration[4.2]
  class Changeset < ActiveRecord::Base
  end

  def self.up
    add_column :users, :changesets_count, :integer, :null => false, :default => 0

    Changeset.group(:user_id).pluck(:user_id).each do |user_id|
      User.reset_counters(user_id, :changesets)
    end

  end

  def self.down
    remove_column :users, :changesets_count
  end
end
