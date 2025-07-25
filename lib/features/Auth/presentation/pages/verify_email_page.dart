import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/functions/validate_input.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/features/Auth/presentation/controllers/verifiy_email_controller.dart';
import '../../../../core/constants/Fonts.dart';
import '../widgets/base_auth_screen.dart';
import '../widgets/custom_text_form_field.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final controller = Get.find<VerifyEmailController>();

    return BaseAuthScreen(
      componentHeight: height * 0.4,
      widget: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              width: width * 0.8,
              hintText: "email",
              icon: Icons.email_outlined,
              controller: controller.emailController,
              validator: (val) => validateInput(val!, 11, 50, 'email'),
            ).paddingOnly(left: 15, right: 15, top: 40),
            Obx(() {
              return controller.isLoading.value
                  ? const CircularProgressIndicator().paddingOnly(top: 30)
                  : CustomButton(
                    text: 'Verify',
                    textColor: AppColors.pureWhite,
                    backgroundColor: AppColors.deepNavy,
                    borderRadius: 10,
                    width: width * 0.8,
                    onPressed: controller.sendCodeAndNavigate,
                  ).paddingOnly(top: 30);
            }),
          ],
        ),
      ),
      appBarTitle: "Verify Email",
      bodyText: "",
      clickableText: "Remember password ?",
      footerText: '',
      onTap: () {
        Get.toNamed(AppRoutes.login);
      },
    );
  }
}
