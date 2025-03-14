part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class SelectStoneShape extends FilterEvent {
  final StoneShape stoneShape;

  const SelectStoneShape(this.stoneShape);

  @override
  List<Object?> get props => [stoneShape];
}
class AddSizeRange extends FilterEvent {
  final String minSize;
  final String maxSize;

  AddSizeRange({required this.minSize, required this.maxSize});

  @override
  List<Object?> get props => [minSize, maxSize];
}

class RemoveSizeRange extends FilterEvent {
  final int index;
  RemoveSizeRange(this.index);
}

class ToggleColor extends FilterEvent {
  final String color;
  const ToggleColor(this.color);

  @override
  List<Object> get props => [color];
}

class SelectedClarity extends FilterEvent {
  final String clarity;
  const SelectedClarity(this.clarity);

  @override
  List<Object> get props => [clarity];
}

class SelectedLab extends FilterEvent {
  final String lab;
  const SelectedLab(this.lab);

  @override
  List<Object> get props => [lab];
}

class ApplyFilter extends FilterEvent {
  final List<Data> items;
  const ApplyFilter(this.items);

  @override
  List<Object> get props => [items];
}

class ApplySorting extends FilterEvent {
  final SortOption sortOption;
  const ApplySorting(this.sortOption);

  @override
  List<Object> get props => [sortOption];
}
