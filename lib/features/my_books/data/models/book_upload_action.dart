enum BookUploadAction {
  library,
  sell,
  swap,
  lend,
  donate;

  bool get isPublicListing =>
      this != BookUploadAction.library;

  bool get requiresPrice =>
      this == BookUploadAction.sell;
}