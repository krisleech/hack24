class SmsPhoneNumber < ActiveRecord::Migration
  def change
    rename_column :sms, :from, :number
  end
end
