require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品出品がうまくいくとき' do
      it "全て正しい入力をすれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "画像が空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明が空では出品できない" do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it "カテゴリー情報が空では出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリー情報が１の場合は出品できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報が空では出品できない" do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "商品の状態についての情報が１の場合は出品できない" do
        @item.state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it "配送料の負担についての情報が空では出品できない" do
        @item.burden_of_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden of delivery can't be blank")
      end
      it "配送料の負担についての情報が１の場合は出品できない" do
        @item.burden_of_delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden of delivery must be other than 1")
      end
      it "発送元の地域についての情報が空では出品できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送元の地域についての情報が1の場合は出品できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "発送までの日数についての情報が空では出品できない" do
        @item.shipment_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date can't be blank")
      end
      it "発送までの日数についての情報が１の場合は出品できない" do
        @item.shipment_date_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date must be other than 1")
      end
      it "価格についての情報が空では出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が¥300~¥9999999でないと出品できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格は半角数字でないと出品できない" do
        @item.price = "５０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格が全角では出品できない" do
        @item.price = "５０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格が半角英語のみでは出品できない" do
        @item.price = "sample"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
