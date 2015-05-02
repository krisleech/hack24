class Sms < ActiveRecord::Base
  def self.push(attributes)
    account.send_message(to: attributes[:to],
                         body: attributes[:message],
                         direction: 'out')

    create(number: attributes[:to],
           message: attributes[:message],
           direction: 'out')
  end

  def self.account
    @account ||= Esendex::Account.new
  end
end
