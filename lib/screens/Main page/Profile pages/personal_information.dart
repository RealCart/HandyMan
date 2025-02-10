import 'package:flutter/material.dart';
import '../../../presentation/inputs/custom_input.dart';
import '../../../presentation/inputs/password_input.dart';
import '../../../presentation/buttons/custom_button.dart';
import '../../../utils/screen_size_extension.dart';

class PersonalInformation extends StatelessWidget {
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController birthDayInput = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController password = TextEditingController();
  PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(20.0),
        ),
        child: Column(
          children: [
            CustomInput(
              labelText: "Name",
              controller: nameInput,
              validation: (value) {},
            ),
            SizedBox(height: context.heightPercent(10.0)),
            CustomInput(
              labelText: "Email/Number",
              controller: emailInput,
              validation: (value) {},
            ),
            SizedBox(height: context.heightPercent(10.0)),
            Row(
              children: [
                Expanded(
                  child: CustomInput(
                    labelText: "Date of birth",
                    controller: birthDayInput,
                    validation: (value) {},
                    suffixIcon: const Icon(Icons.calendar_month_outlined),
                  ),
                ),
                SizedBox(width: context.widthPercent(20.0)),
                Expanded(
                  child: CustomInput(
                    labelText: "Gender",
                    controller: gender,
                    validation: (value) {},
                  ),
                ),
              ],
            ),
            SizedBox(height: context.heightPercent(10.0)),
            PasswordInput(
              controller: password,
              validation: (value) {},
            ),
            SizedBox(height: context.heightPercent(10.0)),
            CustomButton(
              labelText: "Delete account",
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
