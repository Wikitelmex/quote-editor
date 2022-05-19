class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: "Quote created successfully."
    else
      render :new, alert: "Quote could not be created."
    end
  end

  def edit
  end

  def update
    if Quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote updated successfully."
    else
      render :edit, alert: "Quote could not be updated."
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Quote deleted successfully."
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
