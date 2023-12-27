import 'package:bkash_app_ui/globalcolor.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchNameNumberWidget extends StatelessWidget {
  SearchNameNumberWidget(
      {super.key,
      required this.title,
      required this.function,
      this.isIconshow = true});
  final String title;
  final Function function;
  bool isIconshow;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          decoration: InputDecoration(
              suffixIcon: isIconshow
                  ? IconButton(
                      onPressed: () {
                        function();
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.grey.withOpacity(.8),
                        size: 25,
                      ),
                    )
                  : Icon(Icons.arrow_forward, color: white),
              hintText: "Enter name or number",
              hintStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              border: InputBorder.none),
        )
      ],
    );
  }
}
