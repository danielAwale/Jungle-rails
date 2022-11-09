class Admin::DashboardController < ApplicationController
  def show
    @count_of_product = Product.all.count
    @count_of_evergreens = Product.where(category_id: 1).count
    @count_of_shrubs = Product.where(category_id:2).count
    @count_of_trees = Product.where(category_id:3).count
    @category = Category.all
    @product = Product.all
  end
end
