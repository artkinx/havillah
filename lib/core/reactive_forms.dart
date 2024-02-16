import 'package:havillah/core/constants.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveForms {
  static final form = FormGroup({
    'server_key': FormControl<String>(value: Constants.serverKey),
    'username': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
    'device_type': FormControl<String>(value: Constants.deviceType),
  });
}
