require 'rails_helper'

describe ItemPurchase, type: :model do
  describe '商品の購入' do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end

    context '商品購入がうまくいくとき' do
      it "全て正しい入力をすれば購入できる" do
        expect(@item_purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "tokenが空では登録できないこと" do
        @item_purchase.token = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では購入できない" do
        @item_purchase.postal_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it "都道府県が空では購入できない" do
        @item_purchase.prefecture_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市町村区が空では購入できない" do
        @item_purchase.municipality = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空では購入できない" do
        @item_purchase.address = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では購入できない" do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it "郵便番号にハイフンがないと購入できない" do
        @item_purchase.postal_code = '1234567'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "電話番号が11桁以上では購入できない" do
        @item_purchase.phone_number = '090123445678'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
