bool ifequal(List a, List b) {
  if (a.length == b.length) {
    for (int i = 0; i < b.length; i++) {
      if (a[i] == b[i]) {
        continue;
      } else {
        return false;
      }
    }
  } else {
    return false;
  }
  return true;
}
