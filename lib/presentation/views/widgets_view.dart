import 'package:coffee_app_flutter/config/helpers/text_google_fonts/text_style_go.dart';
import 'package:coffee_app_flutter/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class WidgetsView extends StatelessWidget {
  const WidgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: Image.asset(
            'assets/images/font-widgets.jpg',
            fit: BoxFit.fitHeight,
          ),
        ),
        ContainerPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Product Coffee Take',
                style: textStyleGo(fontSize: 40,),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.875),
                    borderRadius: BorderRadius.circular(50)),
                child: Column(
                  children: [
                    _ButtonWidgetsProduct(
                      imgUrl: 'assets/images/banner-button-coffee.jpg',
                      title: 'Coffee',
                      onPressed:(){
                        context.pushNamed(CoffeeScreen.name);
                      },
                    ),
                    _ButtonWidgetsProduct(
                        imgUrl:
                            'assets/images/banner-button-coffee-special.jpg',
                        title: 'Coffee Special',
                        onPressed: (){
                          context.pushNamed(CoffeeSpecialScreen.name);
                        },
                        )
                  ],
                ),
              ),
              SizedBox(
                height: size.height*.1,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _ButtonWidgetsProduct extends StatelessWidget {
  final String imgUrl;
  final String title;
  final VoidCallback onPressed;
  const _ButtonWidgetsProduct(
      {super.key, required this.imgUrl, required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: onPressed,
        child: ContainerCardStyle(
            width: size.width,
            height: size.height * .1,
            borderRadius: 10,
            paddingH: 4,
            paddingV: 8,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellow.shade700,
                    borderRadius: BorderRadius.circular(10),),
                child: Row(
                  children: [
                    Image.asset(imgUrl),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .7,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: textStyleGo(fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
