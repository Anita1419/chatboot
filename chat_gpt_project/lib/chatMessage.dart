import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String sender;
  final bool isImage;
  const ChatMessage(
      {super.key,
      required this.text,
      required this.sender,
      this.isImage = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sender)
            .text
            .subtitle1(context)
            .make()
            .box
            .color(sender == "user" ? Vx.red200 : Vx.green200)
            .p16
            .rounded
            .alignCenter
            .makeCentered(),
        Expanded(
          child: isImage
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Center(
                      child: Image.network(
                    text,
                    fit: BoxFit.cover,
                  )),
                )
              : text.trim().text.bodyText1(context).make().px8(),
        )
      ],
    ).py8();
  }
}
