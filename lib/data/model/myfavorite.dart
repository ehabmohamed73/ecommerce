class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUserid;
  String? favoriteItemid;
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
  String? userId;
  String? itemPriceAfterDis;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUserid,
      this.favoriteItemid,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemPriceAfterDis,
      this.itemDiscount,
      this.itemImage,
      this.itemDate,
      this.itemCat,
      this.userId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserid = json['favorite_userid'];
    favoriteItemid = json['favorite_itemid'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemPriceAfterDis = json['itemsPrice'];
    itemDiscount = json['item_discount'];
    itemImage = json['item_image'];
    itemDate = json['item_date'];
    itemCat = json['item_cat'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_userid'] = this.favoriteUserid;
    data['favorite_itemid'] = this.favoriteItemid;
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
    data['user_id'] = this.userId;
    return data;
  }
}
