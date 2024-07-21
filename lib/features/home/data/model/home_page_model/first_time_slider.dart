import 'package:flutter/material.dart';

@immutable
class FirstTimeSlider {
  final String? imageUrl;
  final String? titr;
  final String? desc;
  final String? color1;
  final String? color2;
  final String? color3;

  const FirstTimeSlider({
    this.imageUrl,
    this.titr,
    this.desc,
    this.color1,
    this.color2,
    this.color3,
  });

  factory FirstTimeSlider.fromJson(Map<String, dynamic> json) {
    return FirstTimeSlider(
      imageUrl: json['imageUrl'] as String?,
      titr: json['titr'] as String?,
      desc: json['desc'] as String?,
      color1: json['color1'] as String?,
      color2: json['color2'] as String?,
      color3: json['color3'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'titr': titr,
        'desc': desc,
        'color1': color1,
        'color2': color2,
        'color3': color3,
      };
}
