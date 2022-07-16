import 'package:carousel_slider/carousel_slider.dart';
import 'package:bells_portal/Services/service_export.dart';
import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  DNavigationService _navigationService = locator<DNavigationService>();

  CarouselController _carouselController;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  List<SliderItem> page = [
    SliderItem(
        image: AssetNames.onboarding_card,
        title: "Fast, reliable & easy service",
        description: "Have your meals delivered to you where ever you are within campus "),
    SliderItem(
        image: AssetNames.onboarding_card,
        title: "Free deliveries and more",
        description: "Earn points for each actions performed, get weekly and daily free delivery"),
    // SliderItem(
    //     image: AssetNames.onboarding_card,
    //     title: "Track your expenses today",
    //     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
    //         "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad"),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeggiaDarkTheme.backgroundColor,
      body: ScaffoldBackground(
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: page.length,
                itemBuilder: (c, i) {
                  return _sliderWidget(index: i, context: context);
                },
                options: CarouselOptions(
                    height: Get.height,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    scrollPhysics: BouncingScrollPhysics()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: currentIndex != page.length - 1,
                    child: AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: page.length,
                      effect: ExpandingDotsEffect(
                          dotWidth: 8,
                          dotHeight: 8,
                          activeDotColor: Theme.of(context).primaryColor,
                          dotColor: Theme.of(context).primaryColorLight),
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(118, 55)),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffD0B871)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          )),
                      onPressed: () {
                        if (currentIndex == page.length - 1) {

                          _navigationService.offAllNamedUntil(name: RouteName.login);

                          return;
                        }

                        currentIndex = page.length - 1;
                        _carouselController.animateToPage(page.length - 1);
                      },
                      child: Center(
                        child: CustomHeaderText(
                          color: Color(0xff07120D),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          title: currentIndex != page.length - 1
                              ? "Skip"
                              : "Login",
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sliderWidget({int index, BuildContext context}) {
    SliderItem sliderItem = page[index];

    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(AssetNames.onboarding_card),
            fit: BoxFit.cover,
          )),
        )),
        Padding(
          padding:
              const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 30),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeaderText(
                  title: sliderItem.title,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  maxLine: 2,
                  color: Color(0xffEDF8F2),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  title: sliderItem.description,
                  color: Color(0xffA1A1A1),
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SliderItem {
  String image;
  String title;
  String description;

  SliderItem({this.image, this.title, this.description});
}
