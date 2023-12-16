import 'package:edeft/view_model/common_elements_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CommonElementsViewModel>(create: (context) => CommonElementsViewModel()),
  
];
