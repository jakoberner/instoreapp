import 'package:flutter/material.dart';
import 'package:instoreapp/models/constants/common_constants.dart';
import 'package:instoreapp/models/constants/messages.dart';
import 'package:instoreapp/widgets/modals/error_dialog.dart';

class OtpService {
  static bool validateOtp(String otp, BuildContext context) {
    const String defaultOtp = "1234";
    if (otp == "" || otp.length < 4) {
      ErrorDialog.openDialog(context, WARNING_TR, OTP_MISSING_NUMBER, OKAY_TR);
      return false;
    } else if (otp != defaultOtp) {
      ErrorDialog.openDialog(context, WARNING_TR, OTP_NOT_VALID, ERROR_TR);
      return false;
    }
    return true;
  }
}
