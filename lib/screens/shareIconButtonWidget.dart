import 'package:instagram/screens/share_buttonsheet.dart';
import 'package:flutter/material.dart';

class shareIconButtonWidget extends StatelessWidget {
  const shareIconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.2,
                maxChildSize: 0.76,
                builder: (context, controler) =>
                    ShareButtonSheet(controller: controler),
              ),
            );
          },
        );
      },
      icon: Image.asset('images/icon_share.png'),
    );
  }
}
