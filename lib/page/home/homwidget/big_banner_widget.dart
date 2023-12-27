import 'package:flutter/cupertino.dart';

class BigBannerWidget extends StatelessWidget {
  const BigBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Image(
        image: AssetImage('assets/banar/banner.jpg'),
      ),
    );
  }
}
