// import 'package:flutter/material.dart';

// class IconToggleButton extends StatelessWidget {
//   final bool isSelected;
//   final Function onPressed;
//   IconToggleButton({required this.isSelected,required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: IconButton(
//         iconSize: 30.0,
//         padding: EdgeInsets.all(5),
//         icon: Padding(
//             padding: EdgeInsets.zero,
//             child: isSelected == true
//                 ? Icon(FontAwesome.sort_name_up)
//                 : Icon(FontAwesome.sort_name_down)),
//         onPressed: () {
//           onPressed();
//         },
//       ),
//     );
//   }
// }