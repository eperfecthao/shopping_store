require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it "每个CartItem都可以计算它的金额(小计)" do
    p1 = Product.create(title: "iphone", price: 7400)
    p2 = Product.create(title: "ipod",price: 3400)

    cart = Cart.new
    3.times { cart.add_item(p1.id)} #加了三次的p1
    4.times { cart.add_item(p2.id)} #加了四次的p2
    2.times { cart.add_item(p1.id)} #再加两次的p1

    expect(cart.items.first.price).to be 7400 #第一个CartItem的价格应该为7400
    expect(cart.items.second.price).to be 3400 #第二个CartItem的价格应该为3400
  end
end
