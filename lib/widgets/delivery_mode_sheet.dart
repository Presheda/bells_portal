import 'export_widgets.dart';

class DeliveryModeWidget extends StatefulWidget {

  final Function(bool mode) function;

  DeliveryModeWidget({this.function});


  @override
  _DeliveryModeWidgetState createState() => _DeliveryModeWidgetState();
}

class _DeliveryModeWidgetState extends State<DeliveryModeWidget> {

  bool fastDelivery =  true;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left : 20,
        right : 20,
        top: 30

      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            CustomHeaderText(
              title: "Pick delivery mode",
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),

            SizedBox(
              height: 10,
            ),

            CustomText(
              title: "Help us place a priority on this meal",
              fontSize: 12,

            ),

            SizedBox(
              height: 30,
            ),


            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        fastDelivery = false;
                      });
                    },
                    child: AnimatedContainer(duration: Duration(milliseconds: 250),
                        decoration : BoxDecoration(
                            borderRadius : BorderRadius.circular(10),
                            border: Border.all(
                              color : !fastDelivery ? Theme.of(context).primaryColor : Color(0xffA3DCBF),
                              width : !fastDelivery ? 3 : 1,
                            )
                        ),
                        width: Get.width,
                        padding: EdgeInsets.all(14),
                        child : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children : [

                              fastDelivery ? SizedBox.shrink() : SizedBox(
                                height : 8,
                              ),

                              ImageIcon(
                                  AssetImage(AssetNames.standardDelivery),
                                  size : 48,

                                color: Color(0xffD6AA29),
                              ),

                              SizedBox(
                                height : 30,
                              ),


                              CustomHeaderText(
                                title: "Standard Delivery",
                                fontSize: 16,
                                maxLine: 2,
                                fontWeight: FontWeight.w600,
                              ),

                              SizedBox(
                                height : 20,
                              ),

                              CustomText(
                                title: "Delivers within 30min",
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),

                              SizedBox(
                                height : 20,
                              ),

                              CustomText(
                                title: Constant.moneyFormat(50, space: true),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color : Color(0xffD6AA29),
                                isNaira : true,
                              ),



                            ]
                        )

                    ),
                  ),
                ),

                SizedBox(width:20),

                Expanded(
                  child: InkWell(
                    onTap : (){
                      setState(() {
                        fastDelivery = true;
                      });
                    },
                    child: AnimatedContainer(duration: Duration(milliseconds: 250),
                      decoration : BoxDecoration(
                        borderRadius : BorderRadius.circular(10),
                        border: Border.all(
                          color : fastDelivery ? Theme.of(context).primaryColor : Color(0xffA3DCBF),
                          width : fastDelivery ? 3 : 1,
                        )
                      ),
                      width: Get.width,

                      padding: EdgeInsets.all(14),
                      child : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                        children : [

                          !fastDelivery ? SizedBox.shrink() : SizedBox(
                            height : 8,
                          ),

                          ImageIcon(
                            AssetImage(AssetNames.fasterDelivery),
                            size : 48,
                            color: Theme.of(context).primaryColor,
                          ),

                          SizedBox(
                            height : 30,
                          ),


                          CustomHeaderText(
                            title: "Express Delivery",
                            fontSize: 16,
                            maxLine: 2,
                            fontWeight: FontWeight.w600,
                          ),

                          SizedBox(
                            height : 20,
                          ),

                          CustomText(
                            title: "Less than 20m guaranteed",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),

                          SizedBox(
                            height : 20,
                          ),

                          CustomText(
                            title: Constant.moneyFormat(70, space: true),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,

                            color: Theme.of(context).primaryColor,
                            isNaira : true
                          ),



                        ]
                      )

                    ),
                  ),
                ),


              ],
            ),

            SizedBox(
              height: 34,
            ),

            InfoWidget(
              title: "What's delivery mode",
            ),

            SizedBox(
              height: 22,
            ),


            GradientButton(
              title: "Proceed",
              onTap: (){
              widget.  function(fastDelivery);
              },
            ),


            SizedBox(
              height: 30,
            ),


          ],
        ),
      ),
    );
  }
}
