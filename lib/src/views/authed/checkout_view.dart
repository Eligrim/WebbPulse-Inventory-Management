import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webbcheck/src/providers/orgSelectorProvider.dart';
import 'package:webbcheck/src/services/firestoreService.dart';
import 'package:webbcheck/src/views/authed/home_view.dart';

import '../../widgets.dart';

class CheckoutView extends StatelessWidget {
  CheckoutView({super.key, required this.firestoreService});

  static const routeName = '/checkout';
  final TextEditingController _controller = TextEditingController();
  final FirestoreService firestoreService;

  @override
  Widget build(BuildContext context) {
    return Consumer<OrgSelectorProvider>(
      builder: (context, orgSelectorProvider, child) {
      return ScaffoldWithDrawer(
        title:'Checkout Page',
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Serial Number',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final deviceSerialNumber = _controller.text;
      
                  if (deviceSerialNumber.isNotEmpty) {
                    try {
                      await firestoreService.createDeviceInFirestore(deviceSerialNumber, orgSelectorProvider.selectedOrgUid);
                      
                      while (context.mounted == false) {
                        await Future.delayed(const Duration(milliseconds: 100));
                      }

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Device Checkout Successful!'),
                        ));
                        Navigator.pop(context);
                        Navigator.pushNamed(context, HomeView.routeName);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Device Checkout Successful!'),
                      ));
                      } 
                      

                      
                    } catch (e) {
                      while (context.mounted == false) {
                        await Future.delayed(const Duration(milliseconds: 100));
                      }
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Failed to check in/out device: $e'),
                        ));
                      } 
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please enter a serial number'),
                    ));
                  }
                },
                child: const Text('Checkout Serial Number'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
