import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/signup_cubit.dart';

class GenderRadioButton extends StatefulWidget {
  const GenderRadioButton({super.key});

  @override
  State<GenderRadioButton> createState() => _GenderRadioButtonState();
}

class _GenderRadioButtonState extends State<GenderRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Gender :', style: TextStyles.font15DarkBlueMedium),
        buildRadioButton(
          context,
          title: 'Male',
          value: 0,
          currOption: context.read<SignupCubit>().currentOption,
        ),
        buildRadioButton(
          context,
          title: 'Female',
          value: 1,
          currOption: context.read<SignupCubit>().currentOption,
        ),
      ],
    );
  }

  Widget buildRadioButton(
    BuildContext context, {
    required String title,
    required int value,
    int? currOption,
  }) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: currOption,
          onChanged: (value) {
            context.read<SignupCubit>().changeCurrentOption(value!);
            setState(() {});
          },
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return ColorsManager.mainBlue;
              }
              return ColorsManager.lighterGray;
            },
          ),
        ),
        Text(
          title,
          style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}
