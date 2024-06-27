// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'myhomepage_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 80.h,
        leadingWidth: 70.w,
        backgroundColor: const Color.fromARGB(255, 89, 163, 200),
        centerTitle: true,
        title: const Text('Medical clinic'),
        leading: Image.asset(
          width: 30.w,
          height: 30.h,
          'assets/logo.png',
          fit: BoxFit.cover,
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            children: [
              Obx(
                () => DropdownButtonFormField(
                  borderRadius: BorderRadius.circular(50),
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 102, 68, 255),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      prefixIcon: const Icon(
                        Icons.medical_services,
                        color: Color.fromARGB(255, 102, 68, 255),
                      ),
                      labelText: "choose the Medical specialties"),
                  dropdownColor: Colors.deepPurple.shade50,
                  icon: Icon(
                    size: 24.sp,
                    Icons.arrow_downward_outlined,
                    color: const Color.fromARGB(255, 102, 68, 255),
                  ),
                  value: controller.selectedval.value,
                  items: controller.specialties.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.onchangedropdownbutton(value);
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text("The Offers",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 102, 68, 255),
                      fontSize: 20.sp)),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 150,
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Image.asset(
                            "assets/offers/1.png",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/offers/2.png",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/offers/3.png",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/offers/4.png",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/offers/5.png",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Text("Services",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 102, 68, 255),
                          fontSize: 20.sp)),
                  SizedBox(
                    width: 110.w,
                  ),
                  Text("The Excel Files",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 102, 68, 255),
                          fontSize: 20.sp)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Obx(() => DropdownButton<String>(
                          value: controller.selectedval2.value,
                          items: controller.servises.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (val) {
                            controller.onchangedropdownbuttonservises(val);
                          },
                        )),
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  DropdownButton<String>(
                    items: <String>['download files1', 'download files2']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: InkWell(
                          child: Text(value),
                          onTap: () {
                            controller.downloadFile();
                          },
                        ),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  )
                ],
              ),
              SizedBox(height: 150.h),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 158, 213, 240),
                    borderRadius: BorderRadius.all(Radius.circular(50.sp))),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.white),
                    hintText: 'Please leave a comment  ',
                    hintTextDirection: TextDirection.ltr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.sp))),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
// Anesthesiology Critical Care Medicine.
// Emergency Medical Services.
// Internal Medicine-Critical Care Medicine.
// Medical Toxicology.
// Pain Medicine.
// Pediatric Emergency Medicine.
// Sports Medicine.
// Undersea and Hyperbaric Medicine