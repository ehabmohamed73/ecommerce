class CategoriesModel {
  String? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? categoryDate;
  String? categoryImage;

  CategoriesModel(
      {this.categoryId,
      this.categoryName,
      this.categoryNameAr,
      this.categoryDate,
      this.categoryImage});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    categoryDate = json['category_date'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_name_ar'] = this.categoryNameAr;
    data['category_date'] = this.categoryDate;
    data['category_image'] = this.categoryImage;
    return data;
  }
}
