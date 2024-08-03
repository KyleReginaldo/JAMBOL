// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumbled/presentation/state/product/product_detail/product_detail_cubit.dart';
import 'package:star_rating/star_rating.dart';

import 'package:jumbled/common/theme.dart';
import 'package:jumbled/data/model/product_model.dart';
import 'package:jumbled/presentation/component/button/j_button.dart';
import 'package:jumbled/presentation/component/typography/j_text.dart';

import '../../component/container/product_container.dart';
import '../../state/product/product_cubit.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<String> productImages = [
    'asset/image/placeholder-1.jpg',
    'asset/image/placeholder-2.jpg',
    'asset/image/placeholder-3.jpg',
    'asset/image/placeholder-4.jpg',
    'asset/image/placeholder-5.jpg',
    'asset/image/placeholder-6.jpg',
    'asset/image/placeholder-7.jpg',
    'asset/image/placeholder-8.jpg',
    'asset/image/placeholder-9.jpg',
    'asset/image/placeholder-10.jpg',
    'asset/image/placeholder-11.jpg',
    'asset/image/placeholder-12.jpg',
  ];

  final scrollController = ScrollController();
  @override
  void initState() {
    context.read<ProductDetailCubit>().fetchProduct(widget.productId);
    context.read<ProductCubit>().fetchProducts();
    scrollController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoaded) {
            final product = state.product;
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.10,
                      vertical: 24,
                    ),
                    child: MediaQuery.sizeOf(context).width < 700
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                product.imageLink,
                                width: MediaQuery.sizeOf(context).width * 90,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.45,
                                fit: BoxFit.cover,
                              ),
                              JText(
                                product.productName,
                                size: 20,
                              ),
                              const JText(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
                              Row(
                                children: [
                                  const JText('10 Sold'),
                                  const SizedBox(width: 16),
                                  StarRating(
                                    length: 5,
                                    rating: 4,
                                    color: JTheme.primaryColor,
                                  ),
                                  const SizedBox(width: 16),
                                  const JText('6 Reviews'),
                                ],
                              ),
                              const SizedBox(height: 32),
                              const JText(
                                '₱ 1000',
                                size: 32,
                                weight: FontWeight.bold,
                              ),
                              Row(
                                children: [
                                  JText(
                                    '₱ ${product.price}',
                                    size: 15,
                                    color: Colors.green,
                                    weight: FontWeight.w600,
                                  ),
                                  const SizedBox(width: 5),
                                  if (product.discount != null)
                                    JText(
                                      '${product.discount}% Off',
                                      size: 15,
                                      color: Colors.red,
                                    ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              JOutlinedButton(
                                text: 'Add to Cart',
                                foregroundColor: JTheme.primaryColor,
                                size: Size(
                                    MediaQuery.sizeOf(context).width < 700
                                        ? MediaQuery.sizeOf(context).width * 1
                                        : MediaQuery.sizeOf(context).width *
                                            0.3,
                                    48),
                                weight: FontWeight.bold,
                                letterSpacing: 1,
                                onPressed: () {
                                  if (FirebaseAuth.instance.currentUser ==
                                      null) {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return AlertDialog(
                                            surfaceTintColor: Colors.white,
                                            title: const JText('Please Login'),
                                            content: const JText(
                                              'Login first before add to cart',
                                            ),
                                            actions: [
                                              JTextButton(
                                                text: 'back',
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              JTextButton(
                                                text: 'Login',
                                                textColor: Colors.green,
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  context.go('/login');
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return const AlertDialog(
                                            title: JText(
                                              'PENDING',
                                              letterSpacing: 3,
                                            ),
                                            content: JText(
                                                'this function is in progress'),
                                          );
                                        });
                                  }
                                },
                              ),
                              const SizedBox(height: 8),
                              JElevatedButton(
                                text: 'Buy this Item',
                                foregroundColor: Colors.white,
                                backgroundColor: JTheme.primaryColor,
                                radius: 0,
                                letterSpacing: 1,
                                size: Size(
                                    MediaQuery.sizeOf(context).width < 700
                                        ? MediaQuery.sizeOf(context).width * 1
                                        : MediaQuery.sizeOf(context).width *
                                            0.3,
                                    48),
                                weight: FontWeight.bold,
                                onPressed: () {},
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Image.network(
                                product.imageLink,
                                width: MediaQuery.sizeOf(context).width * 0.45,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.45,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 32),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    JText(
                                      product.productName,
                                      size: 20,
                                    ),
                                    const JText(
                                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
                                    Row(
                                      children: [
                                        const JText('10 Sold'),
                                        const SizedBox(width: 16),
                                        StarRating(
                                          length: 5,
                                          rating: 4,
                                          color: JTheme.primaryColor,
                                        ),
                                        const SizedBox(width: 16),
                                        const JText('6 Reviews'),
                                      ],
                                    ),
                                    const SizedBox(height: 32),
                                    JText(
                                      '₱ ${product.price}',
                                      size: 32,
                                      weight: FontWeight.bold,
                                    ),
                                    Row(
                                      children: [
                                        const JText(
                                          '₱ 900',
                                          size: 15,
                                          color: Colors.green,
                                          weight: FontWeight.w600,
                                        ),
                                        if (product.discount != null)
                                          const SizedBox(width: 5),
                                        if (product.discount != null)
                                          JText(
                                            '${product.discount}% Off',
                                            size: 15,
                                            color: Colors.red,
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    JOutlinedButton(
                                      text: 'Add to Cart',
                                      foregroundColor: JTheme.primaryColor,
                                      size: Size(
                                          MediaQuery.sizeOf(context).width *
                                              0.3,
                                          48),
                                      weight: FontWeight.bold,
                                      letterSpacing: 1,
                                      onPressed: () {
                                        if (FirebaseAuth.instance.currentUser ==
                                            null) {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  title: const JText(
                                                      'Please Login'),
                                                  content: const JText(
                                                      'Login first before add to cart'),
                                                  actions: [
                                                    JTextButton(
                                                      text: 'back',
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    JTextButton(
                                                      text: 'Login',
                                                      textColor: Colors.green,
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        context.go('/login');
                                                      },
                                                    ),
                                                  ],
                                                );
                                              });
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return const AlertDialog(
                                                  title: JText(
                                                    'PENDING',
                                                    letterSpacing: 3,
                                                  ),
                                                  content: JText(
                                                      'this function is in progress'),
                                                );
                                              });
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    JElevatedButton(
                                      text: 'Buy this Item',
                                      foregroundColor: Colors.white,
                                      backgroundColor: JTheme.primaryColor,
                                      radius: 0,
                                      letterSpacing: 1,
                                      size: Size(
                                          MediaQuery.sizeOf(context).width *
                                              0.3,
                                          48),
                                      weight: FontWeight.bold,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.10,
                      vertical: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JText(
                          'Reviews',
                          size: 24,
                          color: JTheme.secondaryColor,
                        ),
                        Column(
                          children: List.generate(
                            5,
                            (index) => Container(
                              padding: const EdgeInsets.all(8),
                              color: Colors.white,
                              margin: const EdgeInsets.only(bottom: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipOval(
                                        child: Image.network(
                                          'asset/image/placeholder-1.jpg',
                                          height: 24,
                                          width: 24,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const JText('Juan Delacruz'),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  StarRating(
                                    length: 5,
                                    rating: 4,
                                    color: JTheme.primaryColor,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const JText(
                                    'Ang product na ito ay sira ang camera, tangina naman',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.06,
                      vertical: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JText(
                          'You may also like',
                          size: 24,
                          color: JTheme.secondaryColor,
                        ),
                        BlocBuilder<ProductCubit, ProductState>(
                          builder: (context, state) {
                            if (state is ProductLoaded) {
                              return Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                runAlignment: WrapAlignment.start,
                                children: state.products.map((e) {
                                  return ProductContainer(
                                    product: e,
                                    ontap: () {
                                      context.go('/product-detail/${e.id}');
                                      scrollController.animateTo(
                                        0,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                  );
                                }).toList(),
                              );
                            } else if (state is ProductLoading) {
                              return Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                runAlignment: WrapAlignment.start,
                                children: List.generate(
                                  12,
                                  (index) => Container(
                                    width: 300,
                                    height: 320,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const CircularProgressIndicator(),
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ProductDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
