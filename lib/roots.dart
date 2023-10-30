import 'package:ecommerceapp/view/screen/address/add.dart';
import 'package:ecommerceapp/view/screen/address/addadressdetails.dart';
import 'package:ecommerceapp/view/screen/address/view.dart';
import 'package:ecommerceapp/view/screen/cart.dart';
import 'package:ecommerceapp/view/screen/checkout.dart';
import 'package:ecommerceapp/view/screen/homepage.dart';
import 'package:ecommerceapp/view/screen/items.dart';
import 'package:ecommerceapp/view/screen/myfavorite.dart';
import 'package:ecommerceapp/view/screen/orders/orderdetials.dart';
import 'package:ecommerceapp/view/screen/orders/pending.dart';
import 'package:ecommerceapp/view/screen/productdetails.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:ecommerceapp/core/middleware/mymiddleware.dart';
import 'package:ecommerceapp/view/screen/auth/LogIn.dart';
import 'package:ecommerceapp/view/screen/auth/SignUp.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/SuccessResetPassword.dart';
import 'package:ecommerceapp/view/screen/auth/SuccessSignUp.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/forgetPassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/resetPassword.dart';
import 'package:ecommerceapp/view/screen/auth/forgetpassword/verfyCode.dart';
import 'package:ecommerceapp/view/screen/auth/signupverfircode.dart';
import 'package:ecommerceapp/view/screen/language.dart';
import 'package:ecommerceapp/view/screen/onBording.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: '/', page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: '/', page: () => const OrderDetials()),

  GetPage(name: AppRoots.cart, page: () => const Cart()),
  GetPage(name: AppRoots.onBoarding, page: () => const onBording()),
  GetPage(name: AppRoots.logIn, page: () => const LogIn()),
  GetPage(name: AppRoots.signUP, page: () => const SignUp()),
  GetPage(name: AppRoots.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoots.verfyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoots.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoots.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoots.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoots.signupverfiycode, page: () => const SignUpVerfiyCode()),
  GetPage(name: AppRoots.homePage, page: () => const Homepage()),
  GetPage(name: AppRoots.items, page: () => const Items()),
  GetPage(name: AppRoots.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoots.myfavorite, page: () => const Myfavorite()),
  GetPage(name: AppRoots.viewaddress, page: () => const AddressView()),
  GetPage(name: AppRoots.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoots.addressaddtwo, page: () => const Addadressdetails()),
  GetPage(name: AppRoots.checkout, page: () => const CheckOut()),
  GetPage(name: AppRoots.orders, page: () => const PendingOrders()),
  GetPage(name: AppRoots.orderdetials, page: () => const OrderDetials()),
];
