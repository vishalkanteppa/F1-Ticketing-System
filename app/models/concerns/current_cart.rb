module CurrentCart
    private
        def set_cart
            @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
            user = User.find(1) # Temp user for now
            @cart = Cart.create(user: user)
            session[:cart_id] = @cart.id
        end
end