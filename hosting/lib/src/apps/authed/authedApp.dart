import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_functions/cloud_functions.dart';
import '../../shared/providers/authenticationChangeNotifier.dart';

import '../../shared/providers/settingsChangeNotifier.dart';
import '../../shared/providers/orgSelectorChangeNotifier.dart';
import '../../shared/providers/orgMemberSelectorChangeNotifier.dart';

import '../../shared/providers/firestoreService.dart';
import '../../shared/providers/deviceCheckoutService.dart';
import '../../shared/helpers/asyncContextHelpers.dart';

import 'views/org_selection_view.dart';

import 'views/settings_view.dart';
import 'views/profile_view.dart';
import 'views/organization_devices_view.dart';
import 'views/checkout_view.dart';
import 'views/users_view.dart';
import 'views/create_organization_view.dart';
import 'views/manage_user_view.dart';

class AuthedApp extends StatelessWidget {
  AuthedApp({
    super.key,
  });
  final AsyncContextHelpers snackBarHelpers = AsyncContextHelpers();
  final FirestoreService firestoreService = FirestoreService();
  final FirebaseFunctions firebaseFunctions = FirebaseFunctions.instance;
  late final DeviceCheckoutService deviceCheckoutService =
      DeviceCheckoutService(
          firestoreService: firestoreService,
          firebaseFunctions: firebaseFunctions);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OrgSelectorChangeNotifier>(
            create: (_) => OrgSelectorChangeNotifier()),
        ChangeNotifierProvider<OrgMemberSelectorChangeNotifier>(
            create: (_) => OrgMemberSelectorChangeNotifier()),
        Provider<FirestoreService>(create: (_) => firestoreService),
        Provider<FirebaseFunctions>.value(value: firebaseFunctions),
        Provider<DeviceCheckoutService>(create: (_) => deviceCheckoutService),
      ],
      child: Consumer4<OrgSelectorChangeNotifier, SettingsChangeNotifier,
          AuthenticationChangeNotifier, OrgMemberSelectorChangeNotifier>(
        builder: (context, orgSelectorProvider, settingsProvider, authProvider,
            orgMemberSelectorProvider, child) {
          return MaterialApp(
            restorationScopeId: 'authedapp',
            title: 'WebbPulse Inventory Management',
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsProvider.themeMode,
            onGenerateRoute: (RouteSettings routeSettings) {
              if (routeSettings.name == CreateOrganizationView.routeName) {
                return MaterialPageRoute<void>(
                  builder: (context) => CreateOrganizationView(),
                );
              }

              if (orgSelectorProvider.orgId.isEmpty) {
                return MaterialPageRoute<void>(
                  builder: (context) => const OrgSelectionView(),
                );
              }

              if (orgMemberSelectorProvider.orgMemberId.isNotEmpty) {
                return MaterialPageRoute<void>(
                  builder: (context) => const ManageUserView(),
                );
              }

              switch (routeSettings.name) {
                case SettingsView.routeName:
                  return MaterialPageRoute<void>(
                    builder: (context) => const SettingsView(),
                  );
                case ProfileView.routeName:
                  return MaterialPageRoute<void>(
                    builder: (context) => const ProfileView(),
                  );
                case OrganizationDevicesView.routeName:
                  return MaterialPageRoute<void>(
                    builder: (context) => OrganizationDevicesView(),
                  );
                case CheckoutView.routeName:
                  return MaterialPageRoute<void>(
                    builder: (context) => CheckoutView(),
                  );
                case UsersView.routeName:
                  return MaterialPageRoute<void>(
                    builder: (context) => UsersView(),
                  );
                case OrgSelectionView.routeName:
                  return MaterialPageRoute<void>(
                    builder: (context) => const OrgSelectionView(),
                  );
                case ManageUserView.routeName:
                  return MaterialPageRoute<void>(
                    builder: (context) => const ManageUserView(),
                  );
                default:
                  return MaterialPageRoute<void>(
                    builder: (context) => CheckoutView(),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
