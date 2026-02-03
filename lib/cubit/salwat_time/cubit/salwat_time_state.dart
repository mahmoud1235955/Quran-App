part of 'salwat_time_cubit.dart';

@immutable
sealed class SalwatTimeState {}

final class SalwatTimeLoading extends SalwatTimeState {}

final class SalwatTimeLoaded extends SalwatTimeState {
  final SalwatTimeModel salwatTime;
  final String nextPray;
  final Duration remainingTimeDuration;
  SalwatTimeLoaded({
    required this.salwatTime,
    required this.nextPray,
    required this.remainingTimeDuration,
  });
}

final class SalwatTimeError extends SalwatTimeState {
  final String message;
  SalwatTimeError({required this.message});
}
