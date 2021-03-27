import 'package:mindxtalk/shared/constants.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationUtil {
  Future<void> initPlatformState() async {
    await OneSignal.shared.init(Constants.APP_ID, iOSSettings: {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.inAppLaunchUrl: true
    });
    await OneSignal.shared.consentGranted(true);
    await OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.none);
    OneSignal.shared.setPermissionObserver((changes) {
      print("----- $changes");
    });
  }
}
