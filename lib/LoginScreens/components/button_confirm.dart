import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:shohaara/main_page.dart';

>>>>>>> 81a7b5ebece7ce25699b86327127f2ba36b4deb4
import '../../constants.dart';

class ButtonConfirm extends StatelessWidget {
  final VoidCallback onPressed;  

  const ButtonConfirm({
<<<<<<< HEAD
    required this.onPressed,  
    Key? key,
  }) : super(key: key);
=======
    super.key,
    required this.onPressed,
  });
>>>>>>> 81a7b5ebece7ce25699b86327127f2ba36b4deb4

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
<<<<<<< HEAD
=======
        child: Text(
          "تآیید",
          style: const TextStyle(
              color: Colors.white, fontFamily: "Vazir", fontSize: 18),
        ),
>>>>>>> 81a7b5ebece7ce25699b86327127f2ba36b4deb4
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 15, right: 15),
          backgroundColor: kPrimaryColor,
          minimumSize: const Size(315, 50),
          elevation: 10,
          shadowColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),  
        child: const Text(
          "تآیید",
          style: TextStyle(
              color: Colors.white, fontFamily: "Vazir", fontSize: 18),
        ),
      ),
    );
  }
}
