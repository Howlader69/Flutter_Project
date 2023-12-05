import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../data/models/product_details.dart';
import '../../state_holders/Product_details_controller.dart';
import '../utility/App_Colors.dart';
import '../utility/color_extention.dart';
import '../widgets/Custom_Stepper.dart';
import '../widgets/Product_Image_Slider.dart';
import '../widgets/Size_Picker.dart';
import 'Create_Reviews.dart';

class ProductDetailsScreeen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreeen({super.key, required this.productId});

  @override
  State<ProductDetailsScreeen> createState() => _ProductDetailsScreeenState();
}

class _ProductDetailsScreeenState extends State<ProductDetailsScreeen> {
  int _selectColorIndex = 0;
  int _selectSizeIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.getProductDetailsInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ProductImageSlider(
                          imageList: [
                            productDetailsController.productDetails.img1 ?? '',
                            productDetailsController.productDetails.img2 ?? '',
                            productDetailsController.productDetails.img3 ?? '',
                            productDetailsController.productDetails.img4 ?? '',
                          ],
                        ),
                        ProductDetailsAppBar,
                      ],
                    ),
                    productDetails(productDetailsController.productDetails,
                        productDetailsController.availableColors),
                  ],
                ),
              )),
              CarttoCartBottomContainer,
            ],
          ),
        );
      }),
    );
  }

  Padding productDetails(ProductDetails productDetails, List<String> colors) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                productDetails.product?.title ?? '',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5),
              )),
              CustomStepper(
                  lowerLimit: 1,
                  upperLimit: 10,
                  stepValue: 1,
                  value: 1,
                  onChange: (newvalue) {
                    print(newvalue);
                  })
            ],
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.amber,
                  ),
                  Text(
                    '${productDetails.product?.star ?? 0}',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Review',
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(2.0),
                child: Card(
                    color: AppColors.primaryColor,
                    child: Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          const Text(
            'Color',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 28,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    _selectColorIndex = index;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: HexColor.fromHex(colors[index]),
                    child: _selectColorIndex == index
                        ? const Icon(
                            Icons.done,
                            color: AppColors.primaryColor,
                          )
                        : null,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Size',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
              height: 28,
              child: SizePicker(
                  initialSelected: 0,
                  sizes: productDetails.size?.split(',') ?? [],
                  onSelected: (int selectIndex) {
                    _selectSizeIndex = selectIndex;
                  })),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black),
          ),
          Text(productDetails.product?.shortDes ?? '')
        ],
      ),
    );
  }

  AppBar get ProductDetailsAppBar {
    return AppBar(
      title: const Text('Product Details'),
      leading: const BackButton(
        color: Colors.black54,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container get CarttoCartBottomContainer {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '\$1000',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.primaryColor),
              )
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const CreateReviewsScreen());
                },
                child: const Text('Add to Card')),
          )
        ],
      ),
    );
  }
}
