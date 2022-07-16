import 'package:bells_portal/widgets/export_widgets.dart';
import 'package:flutter/material.dart';
import 'logo_anim.dart';
import 'package:get/get.dart';

import 'loading_anim.dart';

class LoadingScreen extends StatelessWidget {
  final title;

  LoadingScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Opacity(
                  opacity: 0.9,
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              LoadingAnim(), // LoadingAnim(),
                              SizedBox(
                                height: 30,
                              ),
                              CustomHeaderText(
                                title : title,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        onWillPop: () async => false);
  }
}
