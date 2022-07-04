enum FilterType { sateCode, stateOrProvince }

class FilterOption {
  String value = '';
  FilterType type = FilterType.stateOrProvince;
  bool selected = false;

  FilterOption(this.value, {this.type = FilterType.stateOrProvince, this.selected = false});
}
