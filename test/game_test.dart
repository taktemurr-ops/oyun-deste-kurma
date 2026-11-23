import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_deste_kurma/oyun_deste_kurma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(desteSeferiConfig.title.length, 33);
    expect(desteSeferiConfig.tagline.length, 33);
    for (final s in desteSeferiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(desteSeferiConfig.gameId, desteSeferiId);
    expect(desteSeferiRules.gameId, desteSeferiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(desteSeferiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: desteSeferiId, optionalMechanics: desteSeferiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(desteSeferiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
