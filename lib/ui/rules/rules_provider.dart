import 'dart:async';

import 'package:clash_fudge/models/clash_rule.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RulesNotifier extends AsyncNotifier<List<ClashRule>> {
  @override
  Future<List<ClashRule>> build() async {
    try {
      return (await Http.rules()).map<ClashRule>((e) => ClashRule.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
}

final rulesProvider = AsyncNotifierProvider<RulesNotifier, List<ClashRule>>(RulesNotifier.new);
