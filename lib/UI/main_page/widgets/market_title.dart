import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarketTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 17),
      child: Container(
        width: 345,
        height: 50,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 25,
            ),
            SizedBox(
              width: 7,
            ),
            Column(
              children: [
                Container(
                  width: 189,
                  height: 20,
                  child: Text(
                    "Общественное питание",
                    style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
