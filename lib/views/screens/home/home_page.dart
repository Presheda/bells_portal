import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart';
import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_page_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      //     init: HomePageController(),
      autoRemove: false,
      builder: (model) {
        return CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              flexibleSpace: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(text: TextSpan(
                        text: " Online ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).textTheme.bodyText1.color
                        ),

                        children: [

                          TextSpan(
                            text: "6",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16
                            )
                          )
                        ]
                      )),
                    ),



                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        title: "",
                        fontSize: 16,
                      ),
                    ),
                    DIconButtonWidget(
                      iconData: Icons.notifications,

                      onTap: () {},
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedHeight: 100,
              collapsedHeight: 100,
            ),

          ],
        );
      },
    );
  }
}
