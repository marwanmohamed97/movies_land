import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../constats.dart';

class TvLiveOptions extends StatelessWidget {
  const TvLiveOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 25,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(FontAwesomeIcons.chromecast),
                Icon(FontAwesomeIcons.backwardStep),
                Text(
                  'LIVE',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
                Icon(FontAwesomeIcons.forwardStep),
                Icon(FontAwesomeIcons.expand),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              height: 3,
              color: kPrimaryColor,
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
    );
  }
}
