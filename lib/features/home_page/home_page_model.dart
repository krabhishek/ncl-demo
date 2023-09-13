import '/amount_comp/amount_component/amount_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AmountComponent component.
  late AmountComponentModel amountComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    amountComponentModel = createModel(context, () => AmountComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    amountComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
