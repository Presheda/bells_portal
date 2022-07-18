import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart';
import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'profile_page_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(
      //     init: HomePageController(),
      autoRemove: false,
      builder: (model) {
        return DefaultTabController(
            length: 3,
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  title: CustomText(
                    title: "Profile",
                    fontWeight: FontWeight.w600,
                    lineHeight: 27,
                    fontSize: 18,
                    color: Theme.of(context).textTheme.headline6.color,
                  ),
                  centerTitle: false,
                  // expandedHeight: 50,
                  // collapsedHeight: 50,
                  toolbarHeight: 124,
                  //  backgroundColor: Colors.red,
                  pinned: false,
                ),
                SliverList(
                    delegate: SliverChildListDelegate(([
                  TabBar(
                    tabs: [
                      Tab(
                        text: "Profile",
                      ),
                      Tab(
                        text: "Residential Information",
                      ),
                      Tab(
                        text: "Academic Information",
                      ),
                    ],
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelPadding: EdgeInsets.symmetric(horizontal: 30),
                    indicatorColor: Color(0xff000000),
                    isScrollable: true,
                    labelColor: Color(0xff000000),
                    unselectedLabelColor: Color(0xff767E93),
                    labelStyle: GoogleFonts.poppins(
                        // height: _calculateLineHeight(14, 21),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000)),
                    unselectedLabelStyle: GoogleFonts.poppins(
                        //  height: _calculateLineHeight(14, 21),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff767E93)),
                  ),
                ]))),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverFillRemaining(
                    child: TabBarView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        SingleChildScrollView(
                          child: ProfileInfoTab(
                            userData: model.userData,
                          ),
                        ),
                        SingleChildScrollView(
                          child: ResidentialInfoTab(
                            userData: model.userData,
                          ),
                        ),
                        SingleChildScrollView(
                          child: AcademicInfoTab(
                            userData: model.userData,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}
