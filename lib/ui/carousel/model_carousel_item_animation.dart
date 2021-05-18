class SlideItemAnimationModel {
  final String id;
  final int entryDuration;
  final int exitDuration;
  final int entry;
  final int exit;
  bool visible;

  SlideItemAnimationModel(
      {required this.id,
      required this.entryDuration,
      required this.exitDuration,
      required this.entry,
      required this.exit,
      this.visible = false});

  @override
  bool operator ==(other) {
    if (this.id == (other as SlideItemAnimationModel).id) {
      return true;
    }

    return false;
  }

  @override
  int get hashCode => this.id.hashCode;
}

Duration getSlideItemAnimationDuration(
    String id, List<SlideItemAnimationModel> items) {
  return Duration(
      milliseconds: items.firstWhere((element) => element.id == id).visible
          ? items.firstWhere((element) => element.id == id).entryDuration
          : items.firstWhere((element) => element.id == id).exitDuration);
}

bool getSlideItemAnimationVisibility(
    String id, List<SlideItemAnimationModel> items) {
  return items.firstWhere((element) => element.id == id).visible;
}

List<SlideItemAnimationModel> getSlideItemAnimationUpdate(
    double animationValue, List<SlideItemAnimationModel> items) {
  return items.map((e) {
    if (e.visible == false &&
        animationValue >= e.entry &&
        animationValue < e.exit) {
      e.visible = true;
      return e;
    } else if (e.visible == true && animationValue >= e.exit) {
      e.visible = false;
      return e;
    }
    return e;
  }).toList();
}
