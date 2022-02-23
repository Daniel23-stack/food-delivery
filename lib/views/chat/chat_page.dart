import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/data/models/order.dart';
import 'package:foodie_delivery_boy/view_model/chat.viewmodel.dart';
import 'package:foodie_delivery_boy/widgets/buttons/custom_button.dart';
import 'package:foodie_delivery_boy/widgets/inputs/custom_text_form_field.dart';
import 'package:foodie_delivery_boy/widgets/listitem/chat_message.list_item.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatPage extends StatelessWidget {
  ChatPage({this.order, this.withCustomer, Key key}) : super(key: key);

  final Order order;
  final bool withCustomer;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
      viewModelBuilder: () => ChatViewModel( order, withCustomer),
      onModelReady: (vm) => vm.initialise(),
      builder: (context, vm, child) {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            title:
                "Chat with ${!vm.withCustomer ? 'Vendor' : 'Customer'}"
                    .text
                    .make(),
            centerTitle: false,
          ),
          body: VStack(
            [
              //
              ListView.separated(
                reverse: true,
                itemCount: vm.messages.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (BuildContext context, int index) {
                  //
                  return ChatMessageListItem(
                    message: vm.messages[index],
                    withCustomer: vm.withCustomer,
                  );
                },
              ).expand(),
              //
              SafeArea(
                child: CustomTextFormField(
                  padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                  isFixedHeight: false,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  textEditingController: vm.messageTEC,
                  maxLines: 3,
                  hintText: "Message",
                  suffixWidget: CustomButton(
                    child: "Send".text.white.make(),
                    color: AppColor.primaryColor,
                    onPressed: vm.sendMessage,
                    loading: vm.isBusy,
                  ),
                ).px8(),
              ),
            ],
          ),
        );
      },
    );
  }
}
