class PagesController < ApplicationController

    def home
    end

    def profile
    end

    def donate
        stripe_session
    end

    private

    def stripe_session
        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
                name: "Make a donation to Sydney Dogs and Cats Home",
                currency: 'aud',
                quantity: 1,
                amount: 1000
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                }
            },
            success_url: "#{root_url}pages/donated?userId=#{current_user.id}",
            cancel_url: "#{root_url}"
        )

        @session_id = session.id
    end
    
end
