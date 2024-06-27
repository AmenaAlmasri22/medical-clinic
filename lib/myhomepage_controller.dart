// ignore_for_file: depend_on_referenced_packages, unused_import
import 'dart:isolate';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class HomeController extends GetxController {
  onchangedropdownbutton(String? v);
  onchangedropdownbuttonservises(String? v);
  downloadFile();
}

class HomeControllerImp extends HomeController {
  ReceivePort _receiveport = ReceivePort();
  @override
  void onInit() {
    super.onInit();
    IsolateNameServer.registerPortWithName(
        _receiveport.sendPort, 'downloader_send_port');
    _receiveport.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = DownloadTaskStatus(data[1]);
      int progress = data[2];
      update();
    });
    FlutterDownloader.registerCallback(downloadcallback);
    selectedval = RxString(specialties[0]);
    selectedval2 = RxString(servises[0]);
  }

  List specialties = [
    "Anesthesiology Critical Care Medicine",
    "Emergency Medical Services",
    "Internal Medicine-Critical Care Medicine",
    "Medical Toxicology",
    " Pain Medicine",
    " Pediatric Emergency Medicine",
    " Sports Medicine",
    "Undersea and Hyperbaric Medicine"
  ];
  List servises = [
    "Hospital",
    "Birth centers",
    "Nursing",
    "Primary care",
    "Addiction recoverye",
    "Clinics",
    " Physical therapy",
  ];
  RxString selectedval = "".obs;
  RxString selectedval2 = "".obs;

  @override
  onchangedropdownbutton(v) {
    selectedval.value = v!;
    update();
  }

  @override
  onchangedropdownbuttonservises(v) {
    selectedval2.value = v!;
    update();
  }

  List imagespath = [
    "assets/offers/1.png",
    "assets/offers/2.png",
    "assets/offers/3.png",
    "assets/offers/4.png",
    "assets/offers/5.png",
  ];
  @override
  Future<void> downloadFile() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final basedstorage = await getExternalStorageDirectory();
      final id = await FlutterDownloader.enqueue(
        url: 'https://file.io/2YPEPNXcff1X',
        savedDir: basedstorage!.path,
        fileName: 'excel',
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification: true,
      );
    } else {}
  }
}

downloadcallback(id, status, progress) {
  final SendPort? send =
      IsolateNameServer.lookupPortByName('downloader_send_port');
  send?.send([id, status, progress]);
}
