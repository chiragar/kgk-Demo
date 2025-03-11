import 'package:equatable/equatable.dart';

class Data {
  int? qty;
  String? lotID;
  String? size;
  double? carat;
  String? lab;
  String? shape;
  String? color;
  String? clarity;
  String? cut;
  String? polish;
  String? symmetry;
  String? fluorescence;
  double? discount;
  double? perCaratRate;
  double? finalAmount;
  String? keyToSymbol;
  String? labComment;

  Data(
      {this.qty,
      this.lotID,
      this.size,
      this.carat,
      this.lab,
      this.shape,
      this.color,
      this.clarity,
      this.cut,
      this.polish,
      this.symmetry,
      this.fluorescence,
      this.discount,
      this.perCaratRate,
      this.finalAmount,
      this.keyToSymbol,
      this.labComment});

  Data.fromJson(Map<String, dynamic> json) {
    qty = json['Qty'];
    lotID = json['Lot ID'];
    size = json['Size'];
    carat = json['Carat'];
    lab = json['Lab'];
    shape = json['Shape'];
    color = json['Color'];
    clarity = json['Clarity'];
    cut = json['Cut'];
    polish = json['Polish'];
    symmetry = json['Symmetry'];
    fluorescence = json['Fluorescence'];
    discount = json['Discount'];
    perCaratRate = json['Per Carat Rate'];
    finalAmount = json['Final Amount'];
    keyToSymbol = json['Key To Symbol'];
    labComment = json['Lab Comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Qty'] = this.qty;
    data['Lot ID'] = this.lotID;
    data['Size'] = this.size;
    data['Carat'] = this.carat;
    data['Lab'] = this.lab;
    data['Shape'] = this.shape;
    data['Color'] = this.color;
    data['Clarity'] = this.clarity;
    data['Cut'] = this.cut;
    data['Polish'] = this.polish;
    data['Symmetry'] = this.symmetry;
    data['Fluorescence'] = this.fluorescence;
    data['Discount'] = this.discount;
    data['Per Carat Rate'] = this.perCaratRate;
    data['Final Amount'] = this.finalAmount;
    data['Key To Symbol'] = this.keyToSymbol;
    data['Lab Comment'] = this.labComment;
    return data;
  }
}
