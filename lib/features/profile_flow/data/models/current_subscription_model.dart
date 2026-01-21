import 'package:inspect_connect/features/profile_flow/data/models/document_type_model.dart';
import 'package:inspect_connect/features/profile_flow/domain/entities/current_subscription_entity.dart';

class CurrentSubscriptionModel extends CurrentSubscriptionEntity {
  CurrentSubscriptionModel({
    required super.id,
    required super.planId,
    required super.startDate,
    required super.trialStart,
    required super.trialEnd,
    required super.amount,
    required super.currency,
    required super.interval,
    required super.endDate,
  });

  factory CurrentSubscriptionModel.fromJson(Map<String, dynamic> json) {
    return CurrentSubscriptionModel(
      id: json['_id'],
      planId: CommonDocumentTypeModel.fromJson(json['planId']),
      startDate: json['startDate'],
      trialStart: json['trialStart'],
      trialEnd: json['trialEnd'],
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'],
      interval: json['interval'],
      endDate: json['endDate'],
    );
  }
}
