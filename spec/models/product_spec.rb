require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should be created and saved successfully" do
      @category = Category.find_or_create_by! name: 'Apparel'
      @product = @category.products.create({
        name:  'Men\'s Classy shirt',
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      })
      expect(@product.id).to be_present
  end
  it "should not be saved due to no name" do
    @category = Category.find_or_create_by! name: 'Apparel'
    @product = @category.products.new({
      name:  nil,
      description: Faker::Hipster.paragraph(4),
      quantity: 10,
      price: 64.99
    })
    @product.save
    expect(@product.id).to be_nil
end
it "should not be saved due to no quantity" do
  @category = Category.find_or_create_by! name: 'Apparel'
  @product = @category.products.create({
    name:  'Men\'s Classy shirt',
    description: Faker::Hipster.paragraph(4),
    quantity: nil,
    price: 64.99
  })
  expect(@product.id).to be_nil
end
it "should not be saved due to no price" do
  @category = Category.find_or_create_by! name: 'Apparel'
  @product = @category.products.create({
    name:  'Men\'s Classy shirt',
    description: Faker::Hipster.paragraph(4),
    quantity: 10,
    price: nil
  })
  expect(@product.id).to be_nil
end
it "should not be saved due to no category" do
@product = Product.create({
  category: nil,
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  quantity: 10,
  price: 64.99
})
expect(@product.id).to be_nil
end
end
end
