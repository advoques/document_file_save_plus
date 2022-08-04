package com.advoques.document_file_save_plus_example

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity(), PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate()
    }
    override fun registerWith(registry: PluginRegistry?) {
        PathProviderPlugin.registerWith(registry?.registrarFor(
                "io.flutter.plugins.pathprovider.PathProviderPlugin"))
        SharedPreferencesPlugin.registerWith(registry?.registrarFor(
                "io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"))
        FlutterLocalNotificationsPlugin.registerWith(registry?.registrarFor(
                "com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin"))
    }
}
