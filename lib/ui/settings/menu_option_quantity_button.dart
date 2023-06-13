import 'package:flutter/material.dart';

import 'package:capstone/consts/colors.dart';

class MenuOptionQuantityButton extends StatefulWidget {
  final void Function()? plusOnPressed;
  final void Function()? minusOnPressed;

  const MenuOptionQuantityButton({
    super.key,
    required this.plusOnPressed,
    required this.minusOnPressed,
  });

  @override
  State<MenuOptionQuantityButton> createState() =>
      MenuOptionQuantityButtonState();
}

class MenuOptionQuantityButtonState extends State<MenuOptionQuantityButton> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 0.4),
          borderRadius: BorderRadius.circular(30),
          color: GColors.WHITE),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: IconButton(
              icon: Icon(
                Icons.remove,
                color: amount != 1 ? GColors.CRYPTOLAB_BLUE : GColors.GREY,
              ),
              onPressed: () {
                if (amount > 1) {
                  widget.minusOnPressed!();
                  setState(() {
                    amount -= 1;
                  });
                }
              },
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              '${amount}분',
              style: const TextStyle(
                color: GColors.CRYPTOLAB_BLUE,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: amount != 15 ? GColors.CRYPTOLAB_BLUE : GColors.GREY,
              ),
              onPressed: () {
                if (amount < 15) {
                  widget.plusOnPressed!();
                  setState(() {
                    amount += 1;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
