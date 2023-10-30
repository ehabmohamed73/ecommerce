class AppLinks {
  static const String serverLink =
      "https://ecommereceappflutter.000webhostapp.com/ecommerceapp";
  static const String test = "$serverLink/test.php";

// ============images==============
  static const String categoriesImages = "$serverLink/upload/categories";
  static const String itemsImages = "$serverLink/upload/items";
// ============================

  ///// Auth ==============
  static const String signUpLink = "$serverLink/auth/signup.php";
  static const String checkCodeLink = "$serverLink/auth/checkVerifiyCode.php";
  static const String loginLink = "$serverLink/auth/login.php";
  static const String resendcode = "$serverLink/auth/resendcode.php";

  ///forgetpassword
  static const String checkEmailLink =
      "$serverLink/auth/forgetpassword/checkemail.php";
  static const String checkVerfiyCodeLink =
      "$serverLink/auth/forgetpassword/verfiyecode.php";
  static const String resetpasswordCodeLink =
      "$serverLink/auth/forgetpassword/resetpassword.php";

  // Home=========
  static const String homepageLink = "$serverLink/home.php";

  // ===========items==============
  static const String itemsLink = "$serverLink/items/items.php";
  static const String searchLink = "$serverLink/items/search.php";

  // ===========favorite==============
  static const String addFavorite = "$serverLink/favorite/addFav.php";
  static const String removeFavorite = "$serverLink/favorite/removeFav.php";
  static const String showFavorite = "$serverLink/favorite/showFav.php";
  static const String deletefromFav = "$serverLink/favorite/deletefromFav.php";

  // ===========cart==============
  static const String addCart = "$serverLink/cart/add.php";
  static const String removeCart = "$serverLink/cart/remove.php";
  static const String viewCart = "$serverLink/cart/view.php";
  static const String itemCount = "$serverLink/cart/count.php";
  static const String checkCoupon = "$serverLink/coupon/checkcoupon.php";

  // ===========address==============
  static const String addAddress = "$serverLink/address/add.php";
  static const String removeAddress = "$serverLink/address/remove.php";
  static const String viewAddress = "$serverLink/address/view.php";
  static const String editAddress = "$serverLink/address/edit.php";

  // ===========orders==============
  static const String checkout = "$serverLink/orders/checkout.php";
  static const String ordersPending = "$serverLink/orders/pending.php";
}
