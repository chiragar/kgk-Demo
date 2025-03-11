import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kgk/src/data/model/data.dart';
part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<SelectShape>(_onSelectShape);
    on<ToggleColor>(_onToggleColor);
    on<SelectedClarity>(_onSelectedClarity);
    on<SelectedLab>(_onSelectedLab);
    on<ApplyFilter>(_onApplyFilter);
    on<ApplySorting>(_onApplySorting);
  }

  FutureOr<void> _onToggleColor(ToggleColor event, Emitter<FilterState> emit) {
    final updatedColors = state.selectedColors.contains(event.color)
        ? (List<String>.from(state.selectedColors)..remove(event.color))
        : (List<String>.from(state.selectedColors)..add(event.color));

    emit(state.copyWith(selectedColors: updatedColors));
  }

  FutureOr<void> _onSelectedClarity(
      SelectedClarity event, Emitter<FilterState> emit) {
    final updatedClarity = state.selectedClarity.contains(event.clarity)
        ? (List<String>.from(state.selectedClarity)..remove(event.clarity))
        : (List<String>.from(state.selectedClarity)..add(event.clarity));
    emit(state.copyWith(selectedClarity: updatedClarity));
  }

  FutureOr<void> _onSelectedLab(SelectedLab event, Emitter<FilterState> emit) {
    final updatedLab = state.selectedLab.contains(event.lab)
        ? (List<String>.from(state.selectedLab)..remove(event.lab))
        : (List<String>.from(state.selectedLab)..add(event.lab));
    emit(state.copyWith(selectedLab: updatedLab));
  }

  FutureOr<void> _onApplyFilter(ApplyFilter event, Emitter<FilterState> emit) {
    final filteredItems = event.items.where((item) {
      final shapeMatches =
          state.selectedShape == null || item.shape == state.selectedShape;
      final colorMatches = state.selectedColors.isEmpty ||
          state.selectedColors.contains(item.color);

      final clarityMatches = state.selectedClarity.isEmpty ||
          state.selectedClarity.contains(item.clarity);
      final labMatches =
          state.selectedLab.isEmpty || state.selectedLab.contains(item.lab);
      return shapeMatches && clarityMatches && labMatches && colorMatches;
    }).toList();

    emit(state.copyWith(filteredItems: filteredItems));
  }

  FutureOr<void> _onSelectShape(SelectShape event, Emitter<FilterState> emit) {
    emit(state.copyWith(selectedShape: event.shape));
  }

  FutureOr<void> _onApplySorting(
      ApplySorting event, Emitter<FilterState> emit) {
    List<Data> sortedItems = List.from(state.filteredItems);
    switch (event.sortOption) {
      case SortOption.priceAsc:
        sortedItems.sort((a, b) => a.finalAmount!.compareTo(b.finalAmount!));
        break;
      case SortOption.priceDesc:
        sortedItems.sort((a, b) => b.finalAmount!.compareTo(a.finalAmount!));
        break;
      case SortOption.caratAsc:
        sortedItems.sort((a, b) => a.carat!.compareTo(b.carat!));
        break;
      case SortOption.caratDesc:
        sortedItems.sort((a, b) => b.carat!.compareTo(a.carat!));
        break;
    }

    emit(state.copyWith(
        filteredItems: sortedItems, sortOption: event.sortOption));
  }
}
