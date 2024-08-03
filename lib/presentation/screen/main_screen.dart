import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumbled/common/theme.dart';
import 'package:jumbled/common/utils.dart';
import 'package:jumbled/presentation/component/container/product_container.dart';
import 'package:jumbled/presentation/component/typography/j_text.dart';
import 'package:jumbled/presentation/state/category/category_cubit.dart';
import 'package:jumbled/presentation/state/product/product_cubit.dart';

import '../component/button/j_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> carouselItems = [
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
  List<String> categories = [
    'All',
    'Phone',
    'Tablet',
    'Laptop',
    'Accessories',
  ];
  String selectedCategory = 'Phone';

  @override
  void initState() {
    context.read<ProductCubit>().fetchProducts();
    context.read<CategoryCubit>().fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MediaQuery.sizeOf(context).width < 700
          ? const Drawer(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.home_outlined),
                    title: JText('Home'),
                  ),
                  ListTile(
                    leading: Icon(Icons.gamepad_outlined),
                    title: JText('Product'),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_bag_outlined),
                    title: JText('Order'),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_cart_outlined),
                    title: JText('Cart'),
                  ),
                ],
              ),
            )
          : null,
      backgroundColor: JTheme.backgroundColor,
      appBar: MediaQuery.sizeOf(context).width < 700
          ? AppBar(
              bottom: AppBar(
                actions: const [
                  SizedBox(),
                ],
                centerTitle: true,
                title: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined),
                      hintText: 'Search product',
                      hintStyle: TextStyle(fontSize: 14),
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            )
          : AppBar(
              foregroundColor: JTheme.backgroundColor,
              backgroundColor: Colors.white,
              leading: Image.asset('asset/image/logo2.png'),
              actions: [
                IconButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                      JTheme.primaryColor,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
                const SizedBox(width: 10),
                StreamBuilder(
                  stream: FirebaseAuth.instance.userChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return JOutlinedButton(
                        foregroundColor: JTheme.primaryColor,
                        borderSide: const BorderSide(width: 2),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: const JText('Please Logout'),
                                  content: const JText(
                                      'Are you sure you want to logout'),
                                  actions: [
                                    JTextButton(
                                      text: 'back',
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    JTextButton(
                                      text: 'Logout',
                                      textColor: Colors.red,
                                      onPressed: () {
                                        FirebaseAuth.instance.signOut();
                                        Navigator.pop(context);
                                        Utils.showSnackBar(
                                          context: context,
                                          content: 'Logout successfully',
                                          bgColor: Colors.green,
                                        );
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        text: 'Logout',
                      );
                    } else {
                      return Row(
                        children: [
                          JOutlinedButton(
                            foregroundColor: JTheme.primaryColor,
                            borderSide: const BorderSide(width: 2),
                            onPressed: () {
                              context.go('/register');
                            },
                            text: 'Register',
                          ),
                          const SizedBox(width: 5),
                          JOutlinedButton(
                            foregroundColor: JTheme.primaryColor,
                            borderSide: const BorderSide(width: 2),
                            onPressed: () {
                              context.go('/login');
                            },
                            text: 'Login',
                          ),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(width: 8),
              ],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  JElevatedButton(
                    text: 'Home',
                    backgroundColor: JTheme.primaryColor,
                    foregroundColor: JTheme.backgroundColor,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  JElevatedButton(
                    text: 'Product',
                    backgroundColor: JTheme.primaryColor,
                    foregroundColor: JTheme.backgroundColor,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  JElevatedButton(
                    text: 'Order',
                    backgroundColor: JTheme.primaryColor,
                    foregroundColor: JTheme.backgroundColor,
                    onPressed: () {},
                  ),
                ],
              ),
              bottom: AppBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search_outlined),
                          hintText: 'Search product',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag_outlined),
                    ),
                  ],
                ),
              ),
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: carouselItems
                  .map(
                    (e) => Image.asset(
                      e,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                pageSnapping: true,
                height: 450,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                autoPlay: true,
              ),
            ),
            BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
              if (state is CategoryLoaded) {
                return MediaQuery.sizeOf(context).width < 700
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: JTheme.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton(
                            underline: const SizedBox(),
                            value: selectedCategory,
                            items: state.categories
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e.categoryName,
                                    child: JText(e.categoryName),
                                    onTap: () {
                                      context
                                          .read<ProductCubit>()
                                          .fetchProducts(categoryId: e.id);
                                    },
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value!;
                              });
                            }),
                      )
                    : Container(
                        width: MediaQuery.sizeOf(context).width,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Wrap(
                          spacing: 8,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: state.categories
                              .map(
                                (e) => JElevatedButton(
                                  elevation: e.categoryName != selectedCategory
                                      ? 0
                                      : 4,
                                  backgroundColor:
                                      e.categoryName == selectedCategory
                                          ? JTheme.primaryColor
                                          : Colors.transparent,
                                  foregroundColor:
                                      e.categoryName == selectedCategory
                                          ? JTheme.backgroundColor
                                          : JTheme.primaryColor,
                                  borderSide: BorderSide(
                                    color: e.categoryName == selectedCategory
                                        ? Colors.transparent
                                        : JTheme.primaryColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory = e.categoryName;
                                    });
                                    context
                                        .read<ProductCubit>()
                                        .fetchProducts(categoryId: e.id);
                                  },
                                  text: e.categoryName,
                                ),
                              )
                              .toList(),
                        ),
                      );
              } else if (state is CategoryLoading) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => Container(
                      height: 32,
                      width: 84,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width,
              child: BlocBuilder<ProductCubit, ProductState>(
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
                  } else if (state is ProductEmpty) {
                    return const Column(
                      children: [
                        JText(
                          'Empty',
                          letterSpacing: 2,
                          size: 20,
                          weight: FontWeight.w500,
                        ),
                        JText('There is no product to show.'),
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
