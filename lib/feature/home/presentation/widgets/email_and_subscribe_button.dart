import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class EmailAndSubscribeButton extends StatelessWidget {
  const EmailAndSubscribeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "enter_email".tr(),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle subscribe action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: Directionality.of(context).toString().contains('rtl')
                    ? BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              elevation: 0,
              minimumSize: Size(0, 48),
            ),
            child: Text("subscribe".tr()),
          ),
        ],
      ),
    );
  }
}
