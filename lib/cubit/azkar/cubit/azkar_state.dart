part of 'azkar_cubit.dart';

@immutable
sealed class AzkarState {}

final class AzkarLoading extends AzkarState {}

final class AzkarLoaded extends AzkarState {
  final List<ZekrModel> azkarList;
  AzkarLoaded({required this.azkarList});
}

final class AzkarError extends AzkarState {
  final String message;
  AzkarError({required this.message});
}
