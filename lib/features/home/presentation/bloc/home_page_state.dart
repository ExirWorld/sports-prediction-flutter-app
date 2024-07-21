part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageLoading extends HomePageState {}

final class HomePageCompleted extends HomePageState {
  final HomePageEntity homePageEntity;

  const HomePageCompleted(this.homePageEntity);
}

final class HomePageError extends HomePageState {
  final String errorText;

  const HomePageError(this.errorText);
}
