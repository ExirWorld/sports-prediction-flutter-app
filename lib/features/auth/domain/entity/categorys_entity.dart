import 'package:equatable/equatable.dart';

class CategorysEntity extends Equatable {
  final int? categoryId;
  final String? categoryName;
  final dynamic categoryUrl;

  const CategorysEntity({this.categoryId, this.categoryName, this.categoryUrl});

  @override
  List<Object?> get props => [categoryId, categoryName, categoryUrl];
}
