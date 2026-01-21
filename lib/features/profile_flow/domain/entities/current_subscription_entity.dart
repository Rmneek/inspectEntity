import 'package:inspect_connect/features/profile_flow/domain/entities/document_type_entity.dart';

class CurrentSubscriptionEntity {
  final String id;
  final CommonDocumentTypeEntity planId;
  final int startDate;
  final int trialStart;
  final int trialEnd;
  final double amount;
  final String currency;
  final String interval;
  final int endDate;

  const CurrentSubscriptionEntity({
    required this.id,
    required this.planId,
    required this.startDate,
    required this.trialStart,
    required this.trialEnd,
    required this.amount,
    required this.currency,
    required this.interval,
    required this.endDate,
  });
}
