/*An enum which distinguish the error specific action */

enum ErrorAction {
  /* occured error is not important */
  doNothing,
  showToast,
  showSnackbar,
  showDialog,
  pop,
  popToast,
  forceLogout,
}
