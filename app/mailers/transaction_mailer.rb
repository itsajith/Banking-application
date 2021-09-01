class TransactionMailer < ApplicationMailer

    default :from => "ajithkumar@webkorps.com"
    
    def transaction_mail(user, account, transaction)
        @user = user
        @account = account
        @transaction = transaction
        mail(to: user.try(:email), subject: 'Your Transaction details')
    end

    
end
