import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/core/constants/imagesAssets.dart';
import 'package:ecommerceapp/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';

class OrderDetials extends StatelessWidget {
  const OrderDetials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order #1234'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Text(
              "Yesterday, 10:00 am",
              style: TextStyle(
                  color: AppColor.fourthColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Text(
              "Waiting for payment",
              style: TextStyle(
                  color: Color.fromARGB(193, 160, 159, 159),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 20),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        color: AppColor.gray,
                        image: const DecorationImage(
                            image: AssetImage(imagesAssets.acer),
                            fit: BoxFit.contain),
                        borderRadius: BorderRadius.circular(10)),
                    // child: Image.asset(imagesAssets.acer),
                  )),
              const SizedBox(width: 10),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "450 \$",
                        style: TextStyle(
                            color: AppColor.fourthColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "example.ecommerceapp/com.example.ecommerceapp",
                        style: TextStyle(
                            color: Color.fromARGB(193, 160, 159, 159),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 70, top: 10, bottom: 5),
                        child: CustomButtonCoupon(
                          textbutton: "Order again",
                          onPressed: () {},
                        ),
                      )
                    ],
                  )),
            ]),
          ),
          Card(
            margin: const EdgeInsets.only(top: 15),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Image.asset(imagesAssets.acer),
                  )),
              const SizedBox(width: 10),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "450 \$",
                        style: TextStyle(
                            color: AppColor.fourthColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "example.ecommerceapp/com.example.ecommerceapp",
                        style: TextStyle(
                            color: Color.fromARGB(193, 160, 159, 159),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 70, top: 10, bottom: 5),
                        child: CustomButtonCoupon(
                          textbutton: "Order again",
                          onPressed: () {},
                        ),
                      )
                    ],
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
