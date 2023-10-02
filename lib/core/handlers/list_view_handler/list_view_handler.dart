import 'package:flutter/material.dart';
import 'package:flutter_nice_ui/flutter_nice_ui.dart';

import '../../../shared/models/search_type.dart';
import '../../../shared/models/search_view_model.dart';

class ListViewHandler<T> {
  List<SearchViewModel> filterChipsList = <SearchViewModel>[];

  int paginationOffset = 0;
  bool hasMoreData = true;
  bool showError = false;

  List<T> list = <T>[];
  GlobalKey<NiceListViewState<T>> key = GlobalKey<NiceListViewState<T>>();
  int limit;

  ListViewHandler({final this.limit = 15});

  void prepareList({final bool resetList = false}) {
    if (resetList) {
      if (key.currentState != null) {
        key.currentState!.clearAllItems();
      } else if (list.isNotEmpty) {
        list.clear();
      }
      paginationOffset = 0;
    }
  }

  void onPageLoaded(final int totalItemsCount) {
    paginationOffset++;
    if (totalItemsCount == list.length) {
      hasMoreData = false;
    }
  }

  bool get isFirstPage => paginationOffset == 0;

  String get query {
    filterChipsList.add(SearchViewModel(
      type: SearchType.offset,
      key: 'offset',
      startValue: paginationOffset.toString(),
    ));
    filterChipsList.add(SearchViewModel(
      type: SearchType.limit,
      key: 'limit',
      startValue: '$limit',
    ));
    return generateQuery(filterChipsList);
  }

  static String generateQuery(
    final List<SearchViewModel> chipsList,
  ) {
    final List<String> query = [];
    for (final chip in chipsList) {
      query.add('${chip.key}=${chip.startValue}');
    }
    return '?${query.join('&')}';
  }
}
