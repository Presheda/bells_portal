import 'package:bells_portal/views/controllers/export_controller.dart';

import 'export_widgets.dart';

class DashboardAppBarActionWidget extends StatelessWidget {

  final int index;
  final Function onTap;

  DashboardAppBarActionWidget({this.index, this.onTap});

  @override
  Widget build(BuildContext context) {

    if(index == 0){
      return DIconButtonWidget();
    }

    if(index == 1){
      return DIconButtonWidget();
    }

    return SizedBox.shrink();
  }
}
