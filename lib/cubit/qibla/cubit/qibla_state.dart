part of 'qibla_cubit.dart';

@immutable
sealed class QiblaState {}

final class QiblaLoading extends QiblaState {}

final class QiblaLoaded extends QiblaState {
  final double angle;
  QiblaLoaded({required this.angle});
}

final class QiblaError extends QiblaState {
  final String message;
  QiblaError({required this.message});
}
