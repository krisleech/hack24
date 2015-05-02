class SmsDirection < ActiveRecord::Migration
  def change
    add_column :sms, :direction, :string
  end
end
