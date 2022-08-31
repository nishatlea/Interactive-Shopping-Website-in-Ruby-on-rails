require './test/test_helper'
class StoreController < ApplicationController
  #skip_before_action :authenticate_admin!, only: [:index, :show]
  #skip_before_action :authorize

  include CurrentCart
  before_action :set_cart
  def index
     @products = Product.order(:title)
  end
end


