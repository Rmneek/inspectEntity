import 'package:flutter/material.dart';
import 'package:inspect_connect/features/auth_flow/presentation/view_model/inspector_view_model.dart';

class ServiceAreaScreen extends StatelessWidget {
  
  final InspectorViewModelProvider vm;
  final GlobalKey<FormState> formKey;
  const ServiceAreaScreen(this.vm, this.formKey, {super.key});


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
