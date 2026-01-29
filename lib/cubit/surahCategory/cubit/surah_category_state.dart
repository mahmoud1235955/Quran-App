part of 'surah_category_cubit.dart';

@immutable
sealed class SurahCategoryState {}

final class SurahCategoryLoading extends SurahCategoryState {}

final class SurahCategoryLoaded extends SurahCategoryState {
  final List<SurahModel> surah;
  final int index;
  SurahCategoryLoaded({required this.surah, required this.index});
}

final class SurahCategoryError extends SurahCategoryState {
  final String message;
  SurahCategoryError({required this.message});
}
