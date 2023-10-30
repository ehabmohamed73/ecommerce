class CartModel {
  String? itemsPrice;
  String? itemsCount;
  String? cartId;
  String? cartUserid;
  String? cartItemid;
  String? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemCount;
  String? itemActive;
  String? itemPrice;
  String? itemDiscount;
  String? itemImage;
  String? itemDate;
  String? itemCat;

  CartModel(
      {this.itemsPrice,
      this.itemsCount,
      this.cartId,
      this.cartUserid,
      this.cartItemid,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemImage,
      this.itemDate,
      this.itemCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsPrice = json['itemsPrice'];
    itemsCount = json['itemsCount'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemImage = json['item_image'];
    itemDate = json['item_date'];
    itemCat = json['item_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsPrice'] = this.itemsPrice;
    data['itemsCount'] = this.itemsCount;
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_itemid'] = this.cartItemid;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_name_ar'] = this.itemNameAr;
    data['item_desc'] = this.itemDesc;
    data['item_desc_ar'] = this.itemDescAr;
    data['item_count'] = this.itemCount;
    data['item_active'] = this.itemActive;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_image'] = this.itemImage;
    data['item_date'] = this.itemDate;
    data['item_cat'] = this.itemCat;
    return data;
  }
}
