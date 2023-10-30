class ItemsModel {
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
  String? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryDate;
  String? categoryImage;
  String? favorite;
  String? itemPriceAfterDis;

  ItemsModel({
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
    this.itemCat,
    this.categoryId,
    this.categoryName,
    this.categoryNameAr,
    this.categoryDate,
    this.categoryImage,
    this.favorite,
    this.itemPriceAfterDis,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemPriceAfterDis = json['itempriceafterdis'];
    itemDiscount = json['item_discount'];
    itemImage = json['item_image'];
    itemDate = json['item_date'];
    itemCat = json['item_cat'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    categoryDate = json['category_date'];
    categoryImage = json['category_image'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_name_ar'] = itemNameAr;
    data['item_desc'] = itemDesc;
    data['item_desc_ar'] = itemDescAr;
    data['item_count'] = itemCount;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_discount'] = itemDiscount;
    data['item_image'] = itemImage;
    data['item_date'] = itemDate;
    data['item_cat'] = itemCat;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_name_ar'] = categoryNameAr;
    data['category_date'] = categoryDate;
    data['category_image'] = categoryImage;
    data['favorite'] = favorite;
    return data;
  }
}
