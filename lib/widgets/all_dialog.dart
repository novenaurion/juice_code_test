
import 'package:flutter/material.dart';
import 'package:juice_code_test/widgets/custom_button_view.dart';
import 'package:lottie/lottie.dart';


class AllDialog {
  static showErrorSuccessDialog({
    required BuildContext context,
    VoidCallback? onConfirm,
    required String title,
    required String confirm,
    required String subtitle,
    required bool isSuccess,
    Color? buttonColor,
    bool? isDismiss,
    double? titleSize,
  }) {
    AlertDialog alert = AlertDialog(
      key: Key("error-success-dialog"),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
              isSuccess
                  ? "assets/lottie/success.json"
                  : "assets/lottie/error.json",
              width: 60,
              height: 60),
          const SizedBox(
            height: 8,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 6, right: 6),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: titleSize),
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            height: 4,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 200,
            child: CustomButtonView(
              key: Key('confirm-button'),
              textColor: Colors.white ,
              buttonText: confirm,
              onPressed: ()=>onConfirm!(),
              backgroundColor: isSuccess ? Colors.green : Colors.red
            ),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible:false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



  static showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            key: Key("loading-dialog"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              content: SizedBox(
                height: 100,
                child: Center(
                  child:Text("Loading.."),
                ),
              ),);
        });
  }

}
