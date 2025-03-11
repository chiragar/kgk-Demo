import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kgk/src/data/model/data.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCart>((event, emit) {
      final updatedCart = List<Data>.from(state.cartItems)..add(event.item);
      emit(state.copyWith(cartItems: updatedCart));
      Fluttertoast.showToast(
        msg: "Item Add: ${event.item.lotID.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    });

    on<RemoveFromCart>((event, emit) {
      final updatedCart = List<Data>.from(state.cartItems)..remove(event.item);
      emit(state.copyWith(cartItems: updatedCart));
      Fluttertoast.showToast(
        msg: "Item Remove: ${event.item.lotID.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    });
  }
}
