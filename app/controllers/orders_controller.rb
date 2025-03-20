class OrdersController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: %i[ new create ]
    before_action :ensure_cart_isnt_empty, only: %i[ new ]
    before_action :set_order, only: %i[ show edit update destroy ]

    def new
        @order = Order.new
        @order.total_price = @cart.total_price
    end

    def show
    end

    def index
        @orders = Order.all
    end

    def create
        @order = Order.new

        @order.total_price = @cart.total_price
        user = User.find(1) # temp user for now
        @order.user = user
        @order.payment_type = params[:order][:payment_type]

        if @order.save
            @order.add_line_items_from_cart(@cart)
            Cart.destroy(session[:cart_id])
            session[:cart_id] = nil
            redirect_to orders_path, notice: "Thank you for your order"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    # Code to edit an existing order form
    end

    def update
    # Code to update an existing order
    end

    def destroy
    # Code to delete an order
    end

    private
        def ensure_cart_isnt_empty
            if @cart.line_items.empty?
                redirect_to carts_path, notice: "Your cart is empty"
            end
        end

        def set_order
            @order = Order.find(params.expect(:id))
        end

        def order_params
            params.require(:order).permit(:payment_type)
        end
end
