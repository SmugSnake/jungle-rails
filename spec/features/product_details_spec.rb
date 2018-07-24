require 'rails_helper'

RSpec.feature "Visitor clicks on a product", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    # 1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    # end
  end

  scenario "They see all products" do
    # ACT

    visit root_path
    find_link('Details').trigger(:click)

    # VERIFY
 
    expect(current_path).to eql '/products/1'
    save_screenshot
    puts page.html
    save_screenshot
    end
end
