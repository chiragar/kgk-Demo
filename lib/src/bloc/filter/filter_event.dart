part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class SelectShape extends FilterEvent {
  final String shape;
  const SelectShape(this.shape);

  @override
  List<Object> get props => [shape];
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
