import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/features/home/presentation/controllers/Home_Controller.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: Container(
              color: AppColors.deepNavy,
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.currentIndex.value,
                onTap: (index) {
                  controller.hasTapped.value = true;
                  controller.changeIndex(index);
                  if (index == 0) {
                    Get.offAllNamed('/home');
                  } else if (index == 1) {
                    Get.offAllNamed('/posts');
                  } else if (index == 2) {
                    Get.offAllNamed('/profile');
                  } else if (index == 3) {
                    Get.offAllNamed('/settings');
                  }
                },
                selectedItemColor:
                    controller.hasTapped.value == -1
                        ? AppColors.pureWhite
                        : AppColors.lavender,
                unselectedItemColor: AppColors.pureWhite,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: controller.currentIndex.value == 0 ? 40 : 30,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.newspaper,
                      size: controller.currentIndex.value == 1 ? 40 : 30,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_pin,
                      size: controller.currentIndex.value == 2 ? 40 : 30,
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: controller.currentIndex.value == 3 ? 40 : 30,
                    ),
                    label: "",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
