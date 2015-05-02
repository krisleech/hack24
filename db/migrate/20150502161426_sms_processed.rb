class SmsProcessed < ActiveRecord::Migration
  def change
    add_column :sms, :processed, :boolean, default: false
  end
end
