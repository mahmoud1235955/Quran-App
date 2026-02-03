part of 'ayat_cubit.dart';

@immutable
sealed class AyatState {}

final class AyatLoading extends AyatState {}

final class AyatLoaded extends AyatState {
  final AyatModel ayatList;
  AyatLoaded({required this.ayatList});
}

final class AyatError extends AyatState {
  final String message;
  AyatError({required this.message});
}
