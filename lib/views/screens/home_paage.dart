import 'package:carousel_slider/carousel_slider.dart';
import 'package:dars_65/controllers/products_controller.dart';
import 'package:dars_65/models/product_model.dart';
import 'package:dars_65/views/screens/product_detail_screen.dart';
import 'package:dars_65/views/widgets/cart_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _currentindexNotifier = ValueNotifier<int>(0);

  final List<String> _pageviewList = [
    "https://media.istockphoto.com/id/1386471399/photo/modern-living-room-interior-3d-render.jpg?s=612x612&w=0&k=20&c=XTxZqwAshg6Woda4pzUOnxd2Ro8HxROOrPDKz8GTvf4=",
    "https://media.istockphoto.com/id/1386471399/photo/modern-living-room-interior-3d-render.jpg?s=612x612&w=0&k=20&c=XTxZqwAshg6Woda4pzUOnxd2Ro8HxROOrPDKz8GTvf4=",
    "https://media.istockphoto.com/id/1386471399/photo/modern-living-room-interior-3d-render.jpg?s=612x612&w=0&k=20&c=XTxZqwAshg6Woda4pzUOnxd2Ro8HxROOrPDKz8GTvf4=",
    "https://media.istockphoto.com/id/1386471399/photo/modern-living-room-interior-3d-render.jpg?s=612x612&w=0&k=20&c=XTxZqwAshg6Woda4pzUOnxd2Ro8HxROOrPDKz8GTvf4=",
    "https://media.istockphoto.com/id/1386471399/photo/modern-living-room-interior-3d-render.jpg?s=612x612&w=0&k=20&c=XTxZqwAshg6Woda4pzUOnxd2Ro8HxROOrPDKz8GTvf4=",
  ];

  final List<Map<String, dynamic>> _productList = [
    {
      'title': 'Table Desk Lamp',
      'category': 'Lamp',
      'price': '\$142.00',
      'rating': 5.0,
      'image': 'assets/images/stol.png', // Replace with your image path
    },
    {
      'title': 'Painting Berry Plants',
      'category': 'Paint',
      'price': '\$83.00',
      'rating': 4.2,
      'image': 'assets/images/stol.png', // Replace with your image path
    },
    {
      'title': 'Decorative Plants',
      'category': 'Plant',
      'price': '\$105.00',
      'rating': 4.0,
      'image': 'assets/images/stol.png',
    },
    {
      'title': 'Double Wall Shelf',
      'category': 'Shelf',
      'price': '\$93.00',
      'rating': 4.5,
      'image': 'assets/images/stol.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list),
        actions: const [
          Icon(CupertinoIcons.bell),
          Gap(10),
          Icon(CupertinoIcons.search),
          Gap(10),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/person.png"),
          ),
          Gap(10),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 175,
                  child: CarouselSlider(
                    items: _pageviewList.map(
                      (image) {
                        return Builder(
                          builder: (context) {
                            return Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.network(
                                    image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(),
                              ],
                            );
                          },
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: .8,
                      enableInfiniteScroll: true,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        _currentindexNotifier.value = index;
                      },
                    ),
                  ),
                ),
                const Gap(20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'New',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Best Selling',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Featured',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Have 24 products',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Gap(10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sort by',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.5,
                  ),
                  itemCount:
                      Provider.of<ProductsController>(context).list.length,
                  itemBuilder: (context, index) {
                    final product =
                        Provider.of<ProductsController>(context).list[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChangeNotifierProvider<ProductModel>.value(
                                      value: product,
                                      builder: (context, child) =>
                                          ProductDetailScreen(),
                                    )));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.asset(
                                product.firstColorImage,
                                // height: 100,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Gap(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                product.productName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Gap(5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                product.category,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const Gap(5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                product.price.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[700],
                                        size: 16,
                                      ),
                                      Text(
                                        product.rating.toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Consumer<ProductsController>(
                                    builder: (context, controller, child) {
                                      return IconButton(
                                        onPressed: () {
                                          Provider.of<ProductsController>(
                                                  context,
                                                  listen: false)
                                              .changeLike(product.id);
                                        },
                                        icon: product.isLiked
                                            ? Icon(
                                                CupertinoIcons.heart_fill,
                                                color: Colors.grey,
                                                size: 16,
                                              )
                                            : Icon(
                                                CupertinoIcons.heart,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Cart",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
            padding: EdgeInsets.all(16),
            backgroundColor: Colors.white,
            showCloseIcon: true,
            closeIconColor: Colors.black,
          ));
        },
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(context));
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            child: Icon(
              CupertinoIcons.bag,
            ),
          ),
        ),
      ),
    );
  }
}
