class OrdersModle {
  String? ordersId;
  String? ordersUserid;
  String? ordersAddress;
  String? ordersTypes;
  String? ordersPriceDelivery;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersPayment;
  String? ordersStatus;
  String? ordersCoupon;
  String? ordersDate;

  OrdersModle(
      {this.ordersId,
      this.ordersUserid,
      this.ordersAddress,
      this.ordersTypes,
      this.ordersPriceDelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersPayment,
      this.ordersStatus,
      this.ordersCoupon,
      this.ordersDate});

  OrdersModle.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersTypes = json['orders_types'];
    ordersPriceDelivery = json['orders_price_delivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersPayment = json['orders_payment'];
    ordersStatus = json['orders_status'];
    ordersCoupon = json['orders_coupon'];
    ordersDate = json['orders_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_address'] = this.ordersAddress;
    data['orders_types'] = this.ordersTypes;
    data['orders_price_delivery'] = this.ordersPriceDelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_payment'] = this.ordersPayment;
    data['orders_status'] = this.ordersStatus;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_date'] = this.ordersDate;
    return data;
  }
}
