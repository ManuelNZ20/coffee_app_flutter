import 'package:coffee_app_flutter/config/helpers/functions/formatter_number.dart';
import 'package:coffee_app_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class DetailsScreenCoffee extends StatelessWidget {
  static const String name = 'details_screen';

  final String category;
  final String nameProduct;
  final double price;
  final String description;
  final String imgUrl;
  const DetailsScreenCoffee(
      {super.key,
      required this.category,
      required this.nameProduct,
      required this.price,
      required this.description,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                height: size.height * .6,
                color: const Color(0xFFf0e2c8),
                child: ContainerPadding(
                    child: _AppBarImage(size: size, imgUrl: imgUrl))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _ContainerInformationCoffee(
                size: size,
                name: nameProduct,
                category: category,
                description: description,
                price: price),
          ),
        ],
      ),
      bottomNavigationBar: const _DetailsBottomNavigationBar(),
    );
  }
}

class _ContainerInformationCoffee extends StatelessWidget {
  final String name;
  final String category;
  final String description;
  final double price;
  const _ContainerInformationCoffee(
      {super.key,
      required this.size,
      required this.name,
      required this.category,
      required this.description,
      required this.price});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * .47,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      child: ContainerPadding(
        child: Column(
          children: [
            TextInformation(category: category, name: name),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * .65,
                  child: Row(
                    children: List.generate(
                        5,
                        (index) => IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.coffee_outlined))),
                  ),
                ),
                TextPriceCoffee(price: price)
              ],
            ),
            Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInformationDescription(
                    text: 'Description',
                  ),
                  // WidgetSpan(child:),
                  Container(
                    color: Colors.red,
                    height: size.height * .1,
                    child: Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppBarImage extends StatelessWidget {
  const _AppBarImage({
    super.key,
    required this.size,
    required this.imgUrl,
  });

  final Size size;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back_ios_rounded)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          ]),
        ),
        Image.asset(
          width: size.width,
          height: size.height * .3,
          imgUrl,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}

class _DetailsBottomNavigationBar extends StatelessWidget {
  const _DetailsBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .09,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: const Offset(0, -5),
            color: Colors.grey.shade200,
            blurRadius: 10)
      ]),
      child: ContainerPadding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * .3,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonAddShopping(
                      onPressed: () {}, icons: Icons.remove_rounded),
                  Text(
                    FormatterNumberHuman.number(100000),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ButtonAddShopping(
                    onPressed: () {},
                    icons: Icons.add_rounded,
                  ),
                ],
              ),
            ),
            ButtonTab(
              text: 'Add to Order',
              onPressed: () {},
              elevation: 1,
            )
          ],
        ),
      ),
    );
  }
}
