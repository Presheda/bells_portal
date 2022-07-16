
import 'package:bells_portal/utils/utils_export.dart';
import 'package:bells_portal/widgets/export_widgets.dart';

class DeggiaAppStateWidget extends StatelessWidget {
  final DeggiaAppState appState;
  final DeggiaEmptyState emptyState;
  final NoInternetConnection noInternetState;
  final LoadFailed loadFailed;

  DeggiaAppStateWidget(
      {@required this.appState,
      this.emptyState,
      this.noInternetState,
      this.loadFailed})
      : super(key: Key("deggia_app_state"));

  @override
  Widget build(BuildContext context) {
    switch (appState) {
      case DeggiaAppState.Loading:
        return LoadingAnim();

      case DeggiaAppState.NoConnection:
        return noInternetState;

      case DeggiaAppState.EmptyState:
        return emptyState;


      case DeggiaAppState.failed:
        return loadFailed;

      default:
        return NoInternetConnection();
    }
  }
}
