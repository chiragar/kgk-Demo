part of 'filter_bloc.dart';

enum SortOption {
  priceAsc,
  priceDesc,
  caratAsc,
  caratDesc,
}

class FilterState extends Equatable {
  final String? selectedShape;
  final List<String> selectedColors;
  final List<String> selectedClarity;
  final List<String> selectedLab;
  final List<Data> filteredItems;
  final SortOption? sortOption;

  const FilterState({
    this.selectedShape,
    this.selectedColors = const [],
    this.selectedClarity = const [],
    this.selectedLab = const [],
    this.filteredItems = const [],
    this.sortOption,
  });

  FilterState copyWith({
    String? selectedShape,
    List<String>? selectedColors,
    List<String>? selectedClarity,
    List<String>? selectedLab,
    List<Data>? filteredItems,
    SortOption? sortOption,
  }) {
    return FilterState(
      selectedShape: selectedShape ?? this.selectedShape,
      selectedColors: selectedColors ?? this.selectedColors,
      selectedClarity: selectedClarity ?? this.selectedClarity,
      selectedLab: selectedLab ?? this.selectedLab,
      filteredItems: filteredItems ?? this.filteredItems,
      sortOption: sortOption ?? this.sortOption,
    );
  }

  @override
  List<Object?> get props => [
        selectedShape,
        selectedColors,
        selectedClarity,
        selectedLab,
        filteredItems,
        sortOption
      ];
}
