class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[ create update ]
  before_action :set_line_item, only: %i[ show edit update destroy ]

  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    ticket = Ticket.find(params[:ticket_id])
    @line_item = @cart.line_items.find_by(ticket: ticket)
    if @line_item
      @line_item.quantity += 1
      @line_item.total_price = @line_item.quantity * ticket.price
      @line_item.save
    else
      @line_item = @cart.line_items.build(
        ticket: ticket, 
        quantity: 1, 
        total_price: ticket.price
      )
    end
    
    if @line_item.save
      redirect_to event_path(ticket.event), notice: 'Ticket was successfully added to your cart.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    @line_item = @cart.line_items.find(params[:id])
    @line_item.quantity -= 1
    @line_item.total_price = @line_item.quantity * @line_item.ticket.price
    if @line_item.quantity == 0
      destroy
    elsif @line_item.save
      redirect_to carts_path, notice: 'Item removed from cart.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    if @line_item.destroy!
      redirect_to carts_path, notice: 'Item removed from cart.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.expect(line_item: [ :ticket_id, :order_id, :quantity, :total_price, :cart_id ])
    end
end
