import 'package:flutter/material.dart';

import 'package:capstone/consts/colors.dart';
import 'package:capstone/blocs/terms_and_conditions_bloc.dart';
import 'package:capstone/consts/routes.dart';

import 'package:word_break_text/word_break_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgreementComponent extends StatelessWidget {
  final String popupText;
  final String titleText;
  final int conditionNum;

  const AgreementComponent(
      {super.key,
      required this.popupText,
      required this.titleText,
      required this.conditionNum});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          BlocBuilder<AgreementCheckBloc, AgreementCheckState>(
              builder: (context, state) {
            return InkWell(
              hoverColor: GColors.TRANSPARENT,
              splashColor: GColors.TRANSPARENT,
              onTap: () {
                BlocProvider.of<AgreementCheckBloc>(context).add(Checked(
                    allSelect: state.allSelect, conditionNum: conditionNum));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: state.conditions[conditionNum]
                        ? GColors.SELECTED
                        : GColors.TRANSPARENT,
                    border: Border.all(
                      color: GColors.FONTBLACK,
                    ),
                  ),
                  child: Image.asset('assets/images/1207.png',
                      color: state.conditions[conditionNum]
                          ? GColors.WHITE
                          : GColors.FONTGRAY),
                ),
              ),
            );
          }),
          const SizedBox(width: 5),
          Text(
            titleText,
            style: const TextStyle(
              color: GColors.FONTGRAY,
              fontSize: 14,
            ),
          ),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              switch (conditionNum) {
                case 0:
                  Navigator.of(context).pushNamed(Routes.SETTING_TERMS);
                  break;
                case 1:
                  Navigator.of(context).pushNamed(Routes.LOCATION_TERMS);
                  break;
                case 2:
                  Navigator.of(context).pushNamed(Routes.PRIVATE_TERMS);
                  break;
                default:
              }
            },
            child: Row(children: const [
              WordBreakText(
                '내용 확인',
                style: TextStyle(
                  color: GColors.FONTGRAY,
                  fontSize: 12,
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: GColors.FONTGRAY),
            ]),
          ),
        ],
      ),
    );
  }
}
