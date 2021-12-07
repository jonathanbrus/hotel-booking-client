String? validateEmail(String value) {
  return "";
}

String? validatePhone(String value) {
  if (value.isEmpty) {
    return "Phone Number Cannot be empty";
  }

  if (value.length < 10) {
    return "Enter Proper Phone Number";
  }
}

String? validateField(String value) {
  return "";
}
