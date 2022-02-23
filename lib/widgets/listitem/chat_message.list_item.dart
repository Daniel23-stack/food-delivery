import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/data/models/message.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessageListItem extends StatelessWidget {
  const ChatMessageListItem({this.message, this.withCustomer, Key key}) : super(key: key);

  final Message message;
  final bool withCustomer;
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        //
        "${!message.customer ? 'Me' : withCustomer ? 'Customer' : 'Vendor'}"
            .text.gray600.sm
            .make(),
        message.text.text.medium.make(),
      ],
    ).px12();
  }
}
