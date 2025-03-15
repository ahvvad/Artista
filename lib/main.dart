import 'dart:developer';

import 'package:artista/config/cache/cache_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await CacheHelper.setSecureData(key: 'name', value: 'ahmed');
  log('The name is ${await CacheHelper.getSecureData(key: 'name')}');
  await CacheHelper.deleteSecureData(key: 'name');
  log('The name is ${await CacheHelper.getSecureData(key: 'name')}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Artista',
      home: Scaffold(),
    );
  }
}
