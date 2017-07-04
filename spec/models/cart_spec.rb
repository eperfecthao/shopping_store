require 'rails_helper'

RSpec.describe Cart, type: :model do

  describe "购物车基本功能" do
    it "可以把商品丢到购物车里，然后购物车里就有东西了" do
      cart = Cart.new   #新增一辆购物车
      cart.add_item 1 #随便丢一个东西到购物车里
      expect(cart.empty?).to be false #它应该不是空的
    end
  end


  it "如果加了相同种类的商品到购物车里，购买项目(CartItem)并不会增加，但商品的数量会改变" do
    cart = Cart.new #新增一台购物车
    3.times { cart.add_item(1)} #加了3次的1
    5.times { cart.add_item(2)} #加了5次的2
    2.times { cart.add_item(3)} #加了2次的3

    expect(cart.items.length).to be 3 #总共会有3个item
    expect(cart.items.first.quantity).to be 3 #第一个items的数量应该会是3
    expect(cart.items.second.quantity).to be 5 #第二个items的数量应该会是5
  end

  it "商品可以放到购物车里，也可以再拿出来" do
    cart = Cart.new
    p1 = Product.create(title:"iphone")
    p2 = Product.create(title:"ipod")

    4.times { cart.add_item(p1.id)}
    2.times { cart.add_item(p2.id)}

    expect(cart.items.first.product_id).to be p1.id #第一个item的商品ID应该等于p1的ID
    expect(cart.items.second.product_id).to be p2.id #第二个item的商品ID应该等于p2的ID
    expect(cart.items.first.product).to be_a Product #第一个item拿出来的东西应该是一件商品
  end

  it "可以计算整台购物车的总消费金额" do
    cart = Cart.new
    p1 = Product.create(title: "iphone", price: 7400)
    p2 = Product.create(title: "ipod", price: 3400)

    3.times {
      cart.add_item(p1.id)
      cart.add_item(p2.id)
    }

    expect(cart.total_price).to be 32400
  end



  it "特别活动可能可搭配优惠活动(例如新年全场九折，或是满金额免运费)" do

  end

  describe "购物车进阶功能" do
    it "可以将购物车内容转换为Hash，存到Session里面" do

    end

    it "可以把Session的内容(Hash格式)，还原成购物车内容" do

    end
  end
end
