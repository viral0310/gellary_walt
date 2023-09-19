import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class StoragePermissionExample extends StatelessWidget {
  Future<void> _requestStoragePermission() async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      // Permission is granted. You can access storage now.
      // Perform the actions you need to do with storage here.
    } else if (status.isDenied) {
      // Permission is denied. You can show a message to the user
      // indicating that they need to grant the permission in settings.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Permission Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _requestStoragePermission,
          child: Text('Request Storage Permission'),
        ),
      ),
    );
  }
}
