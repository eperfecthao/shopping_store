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

  end

  it "商品可以放到购物车里，也可以再拿出来" do

  end

  it "每个CartItem都可以计算自己的金额(小计)" do

  end

  it "可以计算整台购物车的总消费金额" do

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
