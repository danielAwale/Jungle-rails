require 'rails_helper'

describe Product, type: :model do
  describe 'Validations' do
    it "not valid without a name" do
      @category = Category.new
      @category.id = 1
      @category.name = 'jest'

      @product = Product.new
      @product.name = nil
      @product.price = 1
      @product.quantity = 1
      @product.category_id = @category

      @category.products = [@product]

      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new
      @category.id = 1
      @category.name = 'jest'

      @product = Product.new
      @product.name = 'jest'
      @product.quantity = 1
      @product.price = nil
      @product.category_id = @category

      @category.products = [@product]

      expect(@product).to_not be_valid
    end

    it "not valid without a quantity" do
      @category = Category.new
      @category.id = 1
      @category.name = 'jest'

      @product = Product.new
      @product.name = 'jest'
      @product.price = 1
      @product.quantity = nil
      @product.category_id = @category

      @category.products = [@product]

      expect(@product).to_not be_valid
    end

    it "not valid without a category" do
      @category = Category.new
      @category.id = 1
      @category.name = 'jest'

      @product = Product.new
      @product.name = 'jest'
      @product.price = 1
      @product.quantity = 1
      @product.category_id = nil

      @category = [@product]

      expect(@product).to_not be_valid
    end

    it "valid with name, price, quantity, and category" do
      @category = Category.new
      @category.id = 1
      @category.name = 'jest'

      @product = Product.new
      @product.name = 'jest'
      @product.price = 1
      @product.quantity = 1
      @product.category_id = @category

      @category.products = [@product]

      expect(@product).to be_valid
    end

  end
end