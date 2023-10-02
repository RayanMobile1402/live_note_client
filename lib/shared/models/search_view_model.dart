import 'search_type.dart';

class SearchViewModel {
  final SearchType type;
  final String key;
  final String startValue;

  SearchViewModel({
    required this.type,
    required this.key,
    required this.startValue,
  });
}
