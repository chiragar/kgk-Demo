import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kgk/src/data/model/data.dart';
import 'package:kgk/src/data/model/stone_shape.dart';
part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {

  FilterBloc() : super(const FilterState()) {
    on<AddSizeRange>(_onAddSizeRange);
    on<RemoveSizeRange>(_onRemoveSizeRange);
    on<SelectStoneShape>(_onSelectStoneShape);
    on<ToggleColor>(_onToggleColor);
    on<SelectedClarity>(_onSelectedClarity);
    on<SelectedLab>(_onSelectedLab);
    on<ApplyFilter>(_onApplyFilter);
    on<ApplySorting>(_onApplySorting);
  }

  FutureOr<void> _onAddSizeRange(event, emit) {
    List<String> updatedList = List.from(state.sizeRanges)
      ..add("${event.minSize}-${event.maxSize}");
    emit(state.copyWith(sizeRanges: updatedList));
  }
  FutureOr<void> _onRemoveSizeRange(event, emit) {
    final updatedSizes = List<String>.from(state.sizeRanges);
    if (event.index >= 0 && event.index < updatedSizes.length) {
      updatedSizes.removeAt(event.index);
      emit(state.copyWith(sizeRanges: updatedSizes));
    }
  }

  FutureOr<void> _onSelectStoneShape(SelectStoneShape event, Emitter<FilterState> emit) {
    emit(state.copyWith(selectedStoneShape: event.stoneShape));
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
      final bool shapeMatches = state.selectedStoneShape == null ||
          item.shape == state.selectedStoneShape!.stoneName; // Compare stone name

      final bool matchesSize = state.sizeRanges.isEmpty ||
          state.sizeRanges.any((range) {
            List<String> sizes = range.split('-');
            if (sizes.length != 2) return false; // Skip invalid ranges

            double? minSize = double.tryParse(sizes[0]);
            double? maxSize = double.tryParse(sizes[1]);

            if (minSize == null || maxSize == null || item.carat == null) {
              return false; // Prevent errors if values are null
            }

            return item.carat! >= minSize && item.carat! <= maxSize;
          });
      final colorMatches = state.selectedColors.isEmpty ||
          state.selectedColors.contains(item.color);

      final clarityMatches = state.selectedClarity.isEmpty ||
          state.selectedClarity.contains(item.clarity);
      final labMatches =
          state.selectedLab.isEmpty || state.selectedLab.contains(item.lab);
      return shapeMatches && matchesSize && clarityMatches && labMatches && colorMatches;
    }).toList();

    emit(state.copyWith(filteredItems: filteredItems));
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
